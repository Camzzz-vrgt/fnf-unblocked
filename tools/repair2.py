#!/usr/bin/env python3
"""Repair pass 2 — catch assets the manifest never listed.

mirror_build() only downloaded manifest entries + wrapper refs, but many
builds lazily request files by name: secondary manifests (manifest/songs.json,
videos.json), fonts (.woff variants), GDevelop sprite frames at package root,
haxeui-flixel styles. This scans every text file in each package for
asset-looking path strings and downloads whichever exist on the CDN.
"""
import io, os, re, sys, json, urllib.request, urllib.parse
from concurrent.futures import ThreadPoolExecutor

ROOT = r"X:/GN-Math-local/site/offline/packages/snokido"
H = {"User-Agent": "Mozilla/5.0", "Referer": "https://www.snokido.com/"}
CACHE = os.path.join(ROOT, "build-urls.json")
STATUS = os.path.join(ROOT, "repair2-status.json")

EXT = ("png|jpg|jpeg|gif|webp|xml|json|txt|csv|lua|ogg|mp3|wav|m4a|woff2?|ttf|otf|eot|css|svg|cur|atlas|fnt|skel")
QPATH = re.compile(r'["\']([A-Za-z0-9_ .\-/%&(){}[\]!$^~]+?\.(?:' + EXT + r'))(?:\?[^"\']*)?["\']')
YPATH = re.compile(r"y(\d+):([A-Za-z0-9_ .\-/%]+?\." + "(?:" + EXT + r"))")

TEXT_EXT = (".js", ".html", ".css", ".json", ".xml", ".txt", ".data")


def fetch(url, dest=None, timeout=25, method="GET"):
    req = urllib.request.Request(url, headers=H, method=method)
    data = urllib.request.urlopen(req, timeout=timeout).read()
    if dest:
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        with open(dest, "wb") as f: f.write(data)
    return data


def build_base(slug):
    h = fetch(f"https://www.snokido.com/game/{slug}", timeout=20).decode("utf-8", "replace")
    m = re.search(r'w8\.snokido\.com/games/html5/[^"<>\' ]*?\.html', h)
    return "https://" + m.group(0).rsplit("/", 1)[0] + "/" if m else None


def candidates(pkg):
    out = set()
    for dp, _, fs in os.walk(pkg):
        for f in fs:
            if not f.lower().endswith(TEXT_EXT): continue
            try:
                s = io.open(os.path.join(dp, f), encoding="utf-8", errors="replace").read()
            except OSError: continue
            for m in QPATH.finditer(s):
                p = urllib.parse.unquote(m.group(1)).strip()
                if "://" in p or p.startswith(("data:", "#", "/", "http")): continue
                p = p.lstrip("./")
                if p and " " not in p.split("/")[-1][:1] and len(p) < 160:
                    out.add(p)
            for m in YPATH.finditer(s):
                p = urllib.parse.unquote(m.group(2)).lstrip("./")
                if "://" not in p: out.add(p)
    return out


def main():
    try: bases = json.load(open(CACHE))
    except Exception: bases = {}
    status = {}
    pkgs = [d for d in sorted(os.listdir(ROOT)) if os.path.isdir(os.path.join(ROOT, d))]
    for slug in pkgs:
        pkg = os.path.join(ROOT, slug)
        missing = [p for p in candidates(pkg) if not os.path.exists(os.path.join(pkg, p))]
        if not missing: continue
        if slug not in bases:
            try: bases[slug] = build_base(slug)
            except Exception as e: bases[slug] = None
            json.dump(bases, open(CACHE, "w"), indent=1)
        base = bases[slug]
        if not base:
            status[slug] = {"err": "no build url"}; continue
        ok = fail = 0
        def dl(p):
            nonlocal ok, fail
            dst = os.path.join(pkg, p)
            for url in (base + urllib.parse.quote(p),
                        base + urllib.parse.quote(p, safe="%")):
                try: fetch(url, dst); ok += 1; return
                except Exception: pass
            fail += 1
        with ThreadPoolExecutor(8) as ex:
            list(ex.map(dl, missing))
        status[slug] = {"wanted": len(missing), "ok": ok, "fail": fail}
        print(f"{slug}: {ok}/{len(missing)} ok ({fail} not-on-cdn)", flush=True)
        json.dump(status, open(STATUS, "w"), indent=1)
    print("DONE", len(status))


if __name__ == "__main__":
    main()
