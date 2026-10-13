#!/usr/bin/env python3
"""Build FNF Unblocked from the GN-Math-local FNF package mirror.

Reads fnf-inventory.json (generated from the GN-Math catalog + ugs html stubs)
and produces the site content under fnf-unblocked/:

  data/games.json           game manifest (name, slug, cover, source dir)
  covers/<slug>.<ext>       cover art (catalog cover or extracted mod logo)
  games/<slug>/index.html   playable page (wrapper w/ base -> ./pkg/)
  games/<slug>/pkg          junction to the real package dir (or a real copy
                            when run with --copy, for deployment)

Usage:
  python tools/build.py            # junction mode (local dev, zero-copy)
  python tools/build.py --copy     # real copies into games/<slug>/pkg (deploy)
"""
import io
import json
import os
import re
import shutil
import subprocess
import sys
import unicodedata

HERE = os.path.dirname(os.path.abspath(__file__))
SITE = os.path.dirname(HERE)
INVENTORY = os.path.join(os.path.dirname(SITE), "fnf-inventory.json")
GNM_OFFLINE = r"X:/GN-Math-local/site/offline"
COVERS_SRC = os.path.join(GNM_OFFLINE, "covers")
CATALOG_JSON = r"X:/GN-Math-local/reports/ugs-import/current-gn-local-games.json"

COPY = "--copy" in sys.argv

# images we consider as a cover fallback inside a package, best first
LOGO_CANDIDATES = (
    "logobumpin.png", "logo.png", "title.png", "thumbnail.jpg", "thumbnail.png",
    "bg.png", "favicon.png",
)


def fix_mojibake(name: str) -> str:
    """Repair UTF-8-as-latin1 mojibake from the source catalog."""
    try:
        fixed = name.encode("latin-1").decode("utf-8")
        # keep the fix only if it didn't produce replacement chars
        return fixed if "" not in fixed else name
    except (UnicodeEncodeError, UnicodeDecodeError):
        return name


def slugify(name: str) -> str:
    s = unicodedata.normalize("NFKD", name).encode("ascii", "ignore").decode()
    s = re.sub(r"[^a-zA-Z0-9]+", "-", s).strip("-").lower()
    return s or "game"


def display_name(raw: str) -> str:
    n = fix_mojibake(raw).strip()
    # ugs filenames come in like "fnf vs bunzo bunny" -> title-case them
    if n == n.lower():
        n = n.title()
        n = re.sub(r"\bFnf\b", "FNF", n)
        n = re.sub(r"\bVs\b", "vs.", n)
    return n


def find_cover_asset(pkg: str):
    """Pick the best logo-ish image inside a package dir."""
    if not pkg:
        return None
    found = {}
    for dp, _dn, fs in os.walk(pkg):
        for f in fs:
            fl = f.lower()
            if fl in LOGO_CANDIDATES and fl not in found:
                found[fl] = os.path.join(dp, f)
    for c in LOGO_CANDIDATES:
        if c in found:
            return found[c]
    return None


def atlas_first_frame(img_path: str):
    """If img_path has a Sparrow/Starling <name>.xml atlas beside it, return the
    first frame's (x, y, w, h) crop rect — these files are spritesheets and we
    only want frame 1 for the cover. Otherwise None."""
    xml_path = os.path.splitext(img_path)[0] + ".xml"
    if not os.path.isfile(xml_path):
        return None
    try:
        head = io.open(xml_path, encoding="utf-8", errors="replace").read(20000)
    except OSError:
        return None
    m = re.search(
        r'<SubTexture[^>]*x="(\d+)"[^>]*y="(\d+)"[^>]*width="(\d+)"[^>]*height="(\d+)"',
        head)
    if not m:
        return None
    return tuple(int(v) for v in m.groups())


def write_cover(src: str, dest_base: str) -> str:
    """Copy src to covers/<dest_base>.<ext>, cropping atlas spritesheets to
    their first frame, or center-cropping screenshots to a square thumbnail.
    Returns the cover filename."""
    from PIL import Image
    name = dest_base + ".png"
    dest = os.path.join(SITE, "covers", name)
    rect = atlas_first_frame(src)
    img = Image.open(src)
    if rect:
        img.crop((rect[0], rect[1], rect[0] + rect[2], rect[1] + rect[3])).save(dest)
        return name
    if f"{os.sep}raw{os.sep}" in src or "/raw/" in src:
        # title-screen screenshot -> centered square thumbnail
        w, h = img.size
        s = min(w, h)
        img.crop(((w - s) // 2, (h - s) // 2, (w + s) // 2, (h + s) // 2)) \
           .resize((512, 512), Image.LANCZOS).save(dest)
        return name
    ext = os.path.splitext(src)[1]
    if ext.lower() != ".png":
        img.save(dest)
    else:
        shutil.copyfile(src, dest)
    return name


def main():
    rows = json.load(io.open(INVENTORY, encoding="utf-8"))
    snk = os.path.join(SITE, "data", "snokido-inventory.json")
    if os.path.isfile(snk):
        rows += json.load(io.open(snk, encoding="utf-8"))
    # catalog id -> mod author, for the credits page
    authors = {}
    try:
        for c in json.load(io.open(CATALOG_JSON, encoding="utf-8", errors="replace")):
            if c.get("id") is not None and c.get("author"):
                authors[c["id"]] = fix_mojibake(c["author"]).replace("", "Ø")
    except OSError:
        pass
    games_dir = os.path.join(SITE, "games")
    covers_dir = os.path.join(SITE, "covers")
    os.makedirs(games_dir, exist_ok=True)
    os.makedirs(covers_dir, exist_ok=True)

    seen = {}
    games = []
    for r in rows:
        name = display_name(r["name"])
        slug = r.get("slug") or slugify(name)
        if slug in seen:  # name collision after cleanup -> suffix
            i = seen[slug] + 1
            seen[slug] = i
            slug = f"{slug}-{i}"
        else:
            seen[slug] = 1

        # cover: catalog cover by id, else extracted logo from the package,
        # else a title-screen screenshot staged in covers/raw/<slug>.png
        cover = None
        cover_src = None
        if r.get("catalog") and r.get("id") is not None:
            src = os.path.join(COVERS_SRC, f"{r['id']}.png")
            if os.path.isfile(src):
                cover = f"{slug}.png"
                cover_src = "catalog"
                shutil.copyfile(src, os.path.join(covers_dir, cover))
        if cover is None and r.get("coverFile") and os.path.isfile(r["coverFile"]):
            cover = f"{slug}.jpg"
            cover_src = "snokido"
            dst = os.path.join(covers_dir, cover)
            if os.path.normcase(os.path.abspath(r["coverFile"])) != \
               os.path.normcase(os.path.abspath(dst)):
                shutil.copyfile(r["coverFile"], dst)
        shot = os.path.join(covers_dir, "raw", f"{slug}.png")
        if cover is None and os.path.isfile(shot):
            cover = write_cover(shot, slug)
            cover_src = "screenshot"
        if cover is None:
            asset = find_cover_asset(r["pkg"])
            if asset:
                cover = write_cover(asset, slug)
                cover_src = "logo"

        remote = bool(r.get("base")) and "/offline/packages/" not in r.get("base", "")

        # canonical/source link — snokido rows carry it directly; others get
        # the canonical link out of the wrapper html (fnfhub etc.)
        source_url = r.get("sourceUrl")
        src_html_path = r.get("srcHtmlAbs") or \
            os.path.join(GNM_OFFLINE, "html", *r.get("html", "").split("/"))
        if not source_url:
            try:
                head_html = io.open(src_html_path, encoding="utf-8",
                                    errors="replace").read(40000)
                m = re.search(r'<link rel="canonical" href="([^"]+)"', head_html)
                if m:
                    source_url = m.group(1)
            except OSError:
                pass

        games.append({
            "name": name,
            "slug": slug,
            "cover": f"covers/{cover}" if cover else None,
            "catalogCover": cover_src == "catalog",
            "coverSrc": cover_src,
            "base": r.get("id") == 8,  # catalog id 8 = vanilla Friday Night Funkin
            "remote": remote,
            "remoteBase": r["base"] if remote else None,
            "sourceUrl": source_url,
            "author": authors.get(r.get("id")),
            "pkg": r["pkg"],
            "srcHtml": src_html_path,
            "hostlock": bool(r.get("hostlock")),
        })

    games.sort(key=lambda g: (not g["base"], g["name"].lower()))
    with io.open(os.path.join(SITE, "data", "games.json"), "w", encoding="utf-8") as f:
        json.dump(games, f, indent=1, ensure_ascii=False)

    have = sum(1 for g in games if g["pkg"] or g["remote"])
    print(f"games.json: {len(games)} games ({have} playable, "
          f"{sum(1 for g in games if g['remote'])} CDN-backed)")

    # --- stage games ------------------------------------------------------
    staged = linked = copied = skipped = 0
    for g in games:
        gdir = os.path.join(games_dir, g["slug"])
        os.makedirs(gdir, exist_ok=True)
        pkg_link = os.path.join(gdir, "pkg")

        if g["remote"]:
            base = g["remoteBase"]  # keep the CDN base; nothing to link
        elif g["pkg"]:
            base = "./pkg/"
            if not os.path.exists(pkg_link):
                if COPY:
                    print(f"copy {g['slug']} <- {g['pkg']}")
                    shutil.copytree(g["pkg"], pkg_link)
                    copied += 1
                else:
                    # directory junction: zero-copy local mount (no admin needed)
                    target = os.path.normpath(g["pkg"])
                    res = subprocess.run(
                        ["cmd", "/c", "mklink", "/J", pkg_link, target],
                        capture_output=True, text=True)
                    if res.returncode != 0:
                        print(f"mklink failed for {g['slug']}: "
                              f"{res.stdout.strip()} {res.stderr.strip()}")
                    else:
                        linked += 1
        else:
            skipped += 1
            continue

        # playable page: rewrite the GN-Math stub with our local base, and
        # drop the GN-Math-only shim + analytics
        src_html = g["srcHtml"] if os.path.isabs(g["srcHtml"]) else \
            os.path.join(GNM_OFFLINE, "html", *g["srcHtml"].split("/"))
        page = io.open(src_html, encoding="utf-8", errors="replace").read()
        if re.search(r"<base\b", page):
            page = re.sub(r'<base href="[^"]*"\s*/?>', f'<base href="{base}">', page, count=1)
        else:
            page = re.sub(r"<head[^>]*>", r"\g<0>" + f'\n\t<base href="{base}">', page, count=1)
        page = re.sub(r'<script src="/offline/shared/offline-only\.js"></script>\s*', "", page)
        page = re.sub(r'<script>\s*window\.dataLayer.*?</script>', "", page, count=1, flags=re.S)
        page = page.replace('href="/favicon.png"', 'href="pkg/favicon.png"')
        page = inject_site_nav(page)
        with io.open(os.path.join(gdir, "index.html"), "w", encoding="utf-8") as f:
            f.write(page)
        staged += 1

    print(f"staged {staged} game pages ({linked} junctioned, {copied} copied, "
          f"{skipped} skipped-no-assets)")


SITE_NAV = """<style>
#fnf-nav{position:fixed;top:10px;right:12px;z-index:2147483647;display:flex;gap:8px;font-family:Arial,sans-serif;opacity:.55;transition:opacity .15s}
#fnf-nav:hover,#fnf-nav:focus-within{opacity:1}
#fnf-nav a,#fnf-nav button{width:40px;height:40px;background:rgba(20,15,30,.85);border:2px solid rgba(255,255,255,.15);border-radius:10px;color:#fff;font-size:17px;font-weight:bold;line-height:36px;text-align:center;text-decoration:none;cursor:pointer;display:block;box-sizing:border-box}
#fnf-nav a:hover,#fnf-nav button:hover{border-color:#3fc1ff;color:#3fc1ff}
</style>
<script>
(function(){
  function nav(){
    if(document.getElementById("fnf-nav"))return;
    var wrap=document.createElement("div");wrap.id="fnf-nav";
    var p=location.pathname,i=p.indexOf("/games/");
    var root=i>=0?p.slice(0,i+1):p.replace(/[^/]*$/,"");
    var back=document.createElement("a");back.textContent="\\u2190";back.title="Back to games";
    back.href=root+"mods.html";
    var nt=document.createElement("a");nt.textContent="\\u2197";nt.title="Open in new tab";
    nt.href=location.href;nt.target="_blank";nt.rel="noopener";
    var fs=document.createElement("button");fs.textContent="\\u26f6";fs.title="Fullscreen";
    fs.onclick=function(){if(document.fullscreenElement)document.exitFullscreen();else(document.documentElement.requestFullscreen||function(){}).call(document.documentElement);};
    wrap.appendChild(back);wrap.appendChild(nt);wrap.appendChild(fs);
    (document.body||document.documentElement).appendChild(wrap);
  }
  if(document.readyState==="loading")document.addEventListener("DOMContentLoaded",nav);
  else nav();
})();
</script>
"""


def inject_site_nav(page: str) -> str:
    """Add the site's back/new-tab/fullscreen overlay so bare game pages stay
    navigable (games run directly in the tab — no iframe wrapper)."""
    if "id=\"fnf-nav\"" in page:
        return page
    if "</body>" in page:
        return page.replace("</body>", SITE_NAV + "</body>", 1)
    return page + SITE_NAV


def strip_site_nav(page: str) -> str:
    """Remove an injected overlay block (for idempotent re-injection)."""
    i = page.find('<style>\n#fnf-nav')
    if i < 0:
        return page
    j = page.find("</script>", i)
    if j < 0:
        return page
    return page[:i] + page[j + len("</script>"):]


if __name__ == "__main__":
    main()
