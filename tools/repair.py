#!/usr/bin/env python3
"""Repair incomplete snokido packages: for each package dir, re-derive the
CDN build dir from the snokido game page, then download every manifest
asset missing on disk. Also handles no-manifest builds (asset list is
embedded as y<len>:<path> tokens inside the main JS)."""
import io, os, re, sys, json, urllib.request, urllib.parse
from concurrent.futures import ThreadPoolExecutor

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import importlib.util
spec = importlib.util.spec_from_file_location("snk", os.path.join(os.path.dirname(os.path.abspath(__file__)), "snokido.py"))
snk = importlib.util.module_from_spec(spec); spec.loader.exec_module(snk)

ROOT = r"X:/GN-Math-local/site/offline/packages/snokido"
H = {"User-Agent": "Mozilla/5.0", "Referer": "https://www.snokido.com/"}


def fetch(url, dest=None, timeout=30):
    req = urllib.request.Request(url, headers=H)
    data = urllib.request.urlopen(req, timeout=timeout).read()
    if dest:
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        with open(dest, "wb") as f: f.write(data)
    return data


def build_base(slug):
    h = fetch(f"https://www.snokido.com/game/{slug}", timeout=20).decode("utf-8", "replace")
    m = re.search(r'w8\.snokido\.com/games/html5/[^"<>\' ]*?\.html', h)
    if not m: return None
    return "https://" + m.group(0).rsplit("/", 1)[0] + "/"


def embedded_paths(pkg):
    """No-manifest builds: asset list embedded in the JS as y<len>:<path> tokens."""
    out = set()
    for f in os.listdir(pkg):
        if f.endswith(".js"):
            s = io.open(os.path.join(pkg, f), encoding="utf-8", errors="replace").read()
            for m in re.finditer(r"y(\d+):", s):
                t = s[m.end():m.end() + int(m.group(1))]
                if t.startswith("assets"):
                    out.add(urllib.parse.unquote(t))
    return out


def wanted(pkg):
    mani = os.path.join(pkg, "manifest", "default.json")
    paths = snk.manifest_paths(pkg=pkg) if os.path.exists(mani) else embedded_paths(pkg)
    return [p for p in paths if p and not os.path.exists(os.path.join(pkg, p))]


def main():
    pkgs = [d for d in sorted(os.listdir(ROOT)) if os.path.isdir(os.path.join(ROOT, d))]
    status = {}
    for slug in pkgs:
        pkg = os.path.join(ROOT, slug)
        missing = wanted(pkg)
        if not missing:
            continue
        # sub-build dirs (vs-sonicexe/sonicexe26) handled when their own manifest exists
        try:
            base = build_base(slug)
        except Exception as e:
            print(slug, "no build url:", e); status[slug] = {"err": str(e)}; continue
        if not base:
            status[slug] = {"err": "no build url"}; continue
        ok = fail = 0
        def dl(p):
            nonlocal ok, fail
            try:
                fetch(base + urllib.parse.quote(p), os.path.join(pkg, p)); ok += 1
            except Exception:
                # some CDN paths need the raw encoded form
                try:
                    fetch(base + p.replace("/", "%2F"), os.path.join(pkg, p)); ok += 1
                except Exception as e:
                    fail += 1
        with ThreadPoolExecutor(8) as ex:
            list(ex.map(dl, missing))
        status[slug] = {"wanted": len(missing), "ok": ok, "fail": fail}
        print(f"{slug}: {ok}/{len(missing)} ok, {fail} fail", flush=True)
        json.dump(status, open(os.path.join(ROOT, "repair-status.json"), "w"), indent=1)
    print("DONE", len(status))


if __name__ == "__main__":
    main()
