#!/usr/bin/env python3
"""Mirror FNF games from snokido.com into a local package tree.

Snokido hotlink-protects their builds by referer, so we can't iframe them —
we download each package: game wrapper html, the js + manifest, every asset
listed in manifest/default.json, plus css/font/img refs in the html.

  packages -> X:/GN-Math-local/site/offline/packages/snokido/<slug>/
  covers   -> fnf-unblocked/covers/snk-<slug>.jpg
  rows     -> fnf-unblocked/data/snokido-inventory.json  (merged by build.py)

Resumable: existing files are skipped. Re-run anytime.
"""
import io
import json
import os
import re
import sys
import threading
import time
import traceback
import unicodedata
import urllib.request
import urllib.error
import urllib.parse
from concurrent.futures import ThreadPoolExecutor

sys.stdout.reconfigure(line_buffering=True)

HERE = os.path.dirname(os.path.abspath(__file__))
SITE = os.path.dirname(HERE)
PKG_ROOT = r"X:/GN-Math-local/site/offline/packages/snokido"
COVERS = os.path.join(SITE, "covers")
OUT_JSON = os.path.join(SITE, "data", "snokido-inventory.json")
STATUS_JSON = os.path.join(SITE, "data", "snokido-status.json")
LOCK = os.path.join(SITE, "data", "snokido.lock")

STATUS = {"startedAt": time.time(), "current": None}


def save_status(**kw):
    STATUS.update(kw)
    STATUS["updatedAt"] = time.time()
    try:
        with io.open(STATUS_JSON, "w", encoding="utf-8") as f:
            json.dump(STATUS, f)
    except OSError:
        pass
    progress_line()


def pid_alive(pid):
    if sys.platform == "win32":
        r = os.system(f'tasklist /FI "PID eq {pid}" /NH 2>nul'
                      r' | findstr /R "python" >nul')
        return r == 0
    try:
        os.kill(pid, 0)
        return True
    except OSError:
        return False


def acquire_lock():
    """One ripper at a time. Returns True if we got it."""
    if os.path.isfile(LOCK):
        try:
            pid = int(io.open(LOCK).read().strip())
        except (OSError, ValueError):
            pid = 0
        if pid and pid_alive(pid):
            return False
    with io.open(LOCK, "w") as f:
        f.write(str(os.getpid()))
    return True


def progress_line():
    """Live bar for when this runs in a real console."""
    if not sys.stdout.isatty():
        return
    total, done = STATUS.get("total") or 0, STATUS.get("done") or 0
    w = 30
    fill = int(w * done / total) if total else 0
    cur = STATUS.get("current") or "scraping list"
    ft, fd = STATUS.get("currentFilesTotal") or 0, STATUS.get("currentFilesDone") or 0
    cur_s = f"{cur} {fd}/{ft}" if ft else cur
    print(f"\r[{'#' * fill}{'-' * (w - fill)}] {done}/{total}  {cur_s[:40]:<40}",
          end="", flush=True)


def log(*a):
    if sys.stdout.isatty():
        print("\r" + " " * 90 + "\r", end="")
    print(*a)

UA = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"}
LIST_URL = "https://www.snokido.com/games/fnf?page={}"
DELAY = 0.35

# games already covered by the GN-Math archive — loose key so dupes are skipped
def game_key(name: str) -> str:
    s = unicodedata.normalize("NFKD", name).encode("ascii", "ignore").decode().lower()
    s = re.sub(r"friday\s*night\s*funkin[']?s?", "", s)
    s = re.sub(r"\bfnf\b", "", s)
    s = re.sub(r"\bvs\.?\b", "", s)
    s = re.sub(r"[^a-z0-9]+", "", s)
    return s


def fetch(url, dest=None, binary=True):
    req = urllib.request.Request(url, headers=UA)
    try:
        with urllib.request.urlopen(req, timeout=30) as r:
            data = r.read()
    except Exception as e:
        log(f"    !! {url} -> {e}")
        return None
    if dest:
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        mode = "wb" if binary else "w"
        with open(dest, mode) as f:
            f.write(data if binary else data.decode("utf-8", "replace"))
    return data


def scrape_list():
    """Union all paginated /games/fnf pages -> [(slug, page_url)]"""
    seen, page = {}, 1
    while True:
        html = fetch(LIST_URL.format(page))
        if not html:
            break
        links = re.findall(r'href="https://www\.snokido\.com/game/([a-z0-9-]+)"',
                           html.decode("utf-8", "replace"))
        new = [s for s in links if s not in seen]
        if not new:
            break
        for s in links:
            seen[s] = f"https://www.snokido.com/game/{s}"
        page += 1
        if page > 10:
            break
        time.sleep(DELAY)
    return list(seen.items())


def game_info(slug, page_url, html):
    """Pull the build url, title, and cover out of a game page."""
    m = re.search(r"(https://w8\.snokido\.com/games/html5/[^\"' <>]+\.html)", html)
    if not m:
        return None
    build_url = m.group(1)
    title = slug
    t = re.search(r'"name":"([^"]+)"', html) or re.search(r"<title>([^<|]+)", html)
    if t:
        title = t.group(1).strip()
    cover = None
    c = re.search(r'"image":"(https://w8\.snokido\.com/img/large/[^"]+)"', html) or \
        re.search(r'content="(https://w8\.snokido\.com/img/large/[^"]+)"', html)
    if c:
        cover = c.group(1)
    return build_url, title, cover


def haxe_strings(blob):
    """Snokido manifests are often haxe.Serializer output, not real JSON —
    `y<len>:<string>` tokens. Pull each length-prefixed string out."""
    for m in re.finditer(r"y(\d+):", blob):
        n = int(m.group(1))
        yield blob[m.end():m.end() + n]


def manifest_paths(pkg=None, txt=None):
    """Asset paths a package should have — from its saved manifest file,
    or from raw manifest text (which may be a haxe-serialized blob)."""
    if txt is None:
        man_file = os.path.join(pkg, "manifest", "default.json")
        if not os.path.isfile(man_file):
            return set()
        txt = io.open(man_file, encoding="utf-8", errors="replace").read()
    try:
        assets = json.loads(txt).get("assets", [])
    except (json.JSONDecodeError, AttributeError):
        assets = txt  # probably raw haxe blob
    out = set()
    if isinstance(assets, str):
        for s in haxe_strings(assets):
            if s.startswith("assets"):
                out.add(urllib.parse.unquote(s))
    else:
        for a in assets:
            p = a if isinstance(a, str) else (a.get("path") or a.get("id"))
            if p and p.startswith("assets"):
                out.add(p)
    return out


def unlock_js(pkg):
    """NOP the obfuscator.io site-lock invocations in mirrored JS —
    they navigate to about:blank on non-snokido hosts."""
    wrap = re.compile(r"(_0x[0-9a-f]+)\s*=\s*_0x[0-9a-f]+\(this,function\(\)\{")
    for dp, _, fs in os.walk(pkg):
        for f in fs:
            if not f.endswith(".js"):
                continue
            p = os.path.join(dp, f)
            try:
                s = io.open(p, encoding="utf-8", errors="replace").read()
            except OSError:
                continue
            names = wrap.findall(s)
            if not names:
                continue
            for name in set(names):
                s = s.replace(name + "()", "void 0")
            io.open(p, "w", encoding="utf-8").write(s)


def mirror_build(slug, build_url):
    """Download the whole package dir. Returns local dir path."""
    pkg = os.path.join(PKG_ROOT, slug)
    root = build_url.rsplit("/", 1)[0] + "/"
    html = fetch(build_url)
    if not html:
        return None
    text = html.decode("utf-8", "replace")

    # collect relative refs from the wrapper: js, css, fonts, images
    rels = set()
    for m in re.finditer(r'(?:src|href)="(\.[^"]*|[^"{}: ]+)"', text):
        u = m.group(1)
        if u.startswith(("http", "//", "data:", "mailto:", "#")):
            continue
        rels.add(u.split("#")[0].split("?")[0])
    for m in re.finditer(r"(assets/[^\"' <>)]+)", text):
        rels.add(m.group(1).split("?")[0].split("#")[0])

    # the openfl manifest lists every game asset (json or haxe-serialized)
    man = fetch(root + "manifest/default.json")
    if man:
        rels |= manifest_paths(txt=man.decode("utf-8", "replace"))
        rels.add("manifest/default.json")
    # keep only sane relative file paths — junk like ".", "%", "-" sneaks in
    # from loose regex matches against the html
    rels = {r for r in rels if re.fullmatch(r"[\w./% ()'-]+\.\w{1,5}", r)}
    rels = {r for r in rels if ".." not in r}
    total = len(rels)
    save_status(currentFilesTotal=total, currentFilesDone=0)

    todo, skipped = [], 0
    for rel in rels:
        rel = rel.lstrip("./")
        if not rel:
            continue
        dest = os.path.join(pkg, *rel.split("/"))
        if os.path.isfile(dest):
            skipped += 1
        else:
            todo.append((rel, dest))
    save_status(currentFilesDone=skipped)

    # a few workers — fast but still polite to snokido
    lock = threading.Lock()
    counts = {"got": 0, "failed": 0}

    def work(rel, dest):
        ok = fetch(root + urllib.parse.quote(rel), dest)
        with lock:
            counts["got" if ok else "failed"] += 1
            save_status(currentFilesDone=skipped + sum(counts.values()))
        time.sleep(0.1)

    with ThreadPoolExecutor(max_workers=8) as ex:
        list(ex.map(lambda a: work(*a), todo))

    got, failed = counts["got"], counts["failed"]

    # save the wrapper last so a finished dir always has its entry point
    os.makedirs(pkg, exist_ok=True)
    with open(os.path.join(pkg, "index.html"), "w", encoding="utf-8") as f:
        f.write(text)
    unlock_js(pkg)
    log(f"    {len(rels)} files listed, {got} new, {skipped} kept, {failed} failed")
    return pkg


def main():
    if not acquire_lock():
        print("already running — watch it with:  python tools/snokido-watch.py")
        return
    os.makedirs(PKG_ROOT, exist_ok=True)
    os.makedirs(COVERS, exist_ok=True)

    have = set()
    gj = os.path.join(SITE, "data", "games.json")
    if os.path.isfile(gj):
        for g in json.load(io.open(gj, encoding="utf-8")):
            have.add(game_key(g["name"]))

    games = scrape_list()
    log(f"{len(games)} snokido games listed")
    save_status(total=len(games), done=0, mirrored=0, dupes=0, errors=0)

    rows = []
    if os.path.isfile(OUT_JSON):
        rows = json.load(io.open(OUT_JSON, encoding="utf-8"))
    # repair pass — earlier runs may have skipped haxe-serialized manifests
    # and mirrored only the wrapper files; force those back into the queue
    repaired = []
    for r in rows:
        want = manifest_paths(pkg=r["pkg"])
        if not want:
            repaired.append(r)
            continue
        have_files = {os.path.relpath(os.path.join(dp, f), r["pkg"])
                      .replace(os.sep, "/")
                      for dp, _, fs in os.walk(r["pkg"]) for f in fs}
        missing = want - have_files
        if len(missing) > max(3, len(want) * 0.1):
            log(f"~ {r['slug']}: incomplete ({len(have_files)}/{len(want)} "
                f"assets) — re-mirroring")
            continue
        repaired.append(r)
    rows = repaired

    done = {r["slug"].removeprefix("snk-") for r in rows}
    stats = {"done": len(done), "mirrored": len(done), "dupes": 0, "errors": 0}

    for slug, page_url in games:
        if slug in done:
            continue
        save_status(current=slug, done=stats["done"])
        try:
            html = fetch(page_url)
            if not html:
                stats["errors"] += 1
                continue
            info = game_info(slug, page_url, html.decode("utf-8", "replace"))
            if not info:
                log(f"- {slug}: no build url found")
                stats["errors"] += 1
                continue
            build_url, title, cover = info
            key = game_key(title) or game_key(slug)
            if key in have:
                log(f"= {slug}: already have it ({title})")
                stats["dupes"] += 1
                continue
            log(f"+ {slug}: {title}  [{build_url}]")
            pkg = mirror_build(slug, build_url)
            if not pkg:
                stats["errors"] += 1
                continue
            if cover:
                fetch(cover, os.path.join(COVERS, f"snk-{slug}.jpg"))
            rows.append({
                "name": title,
                "slug": "snk-" + slug,
                "sourceUrl": page_url,
                "remote": False,
                "pkg": pkg,
                "srcHtmlAbs": os.path.join(pkg, "index.html"),
                "coverFile": os.path.join(COVERS, f"snk-{slug}.jpg")
                           if cover else None,
                "catalog": False,
                "snokido": True,
            })
            done.add(slug)
            stats["done"] = len(done)
            stats["mirrored"] += 1
            with io.open(OUT_JSON, "w", encoding="utf-8") as f:
                json.dump(rows, f, indent=1, ensure_ascii=False)
            save_status(**stats)
        except Exception:
            stats["errors"] += 1
            log(f"!! {slug} crashed:")
            traceback.print_exc()
            save_status(**stats)
        time.sleep(DELAY)

    save_status(current=None, **stats)
    log(f"done — {stats['mirrored']} mirrored, {stats['dupes']} dupes, "
        f"{stats['errors']} errors")


if __name__ == "__main__":
    main()
