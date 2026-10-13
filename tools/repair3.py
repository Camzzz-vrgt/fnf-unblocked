#!/usr/bin/env python3
"""Repair pass 3 — download assets listed in secondary manifests.

PsychEngine builds ship manifest/default.json (preloaded) plus lazy
manifests: songs.json, videos.json, shared.json, etc. repair.py only
followed default.json so every Inst.mp3/Voices.mp3/song asset was missed.
Also grabs manifest files the JS references but we never downloaded.
"""
import io, os, re, sys, json, urllib.request, urllib.parse, glob
from concurrent.futures import ThreadPoolExecutor

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import importlib.util
spec = importlib.util.spec_from_file_location("snk", os.path.join(os.path.dirname(os.path.abspath(__file__)), "snokido.py"))
snk = importlib.util.module_from_spec(spec); spec.loader.exec_module(snk)

ROOT = r"X:/GN-Math-local/site/offline/packages/snokido"
H = {"User-Agent": "Mozilla/5.0", "Referer": "https://www.snokido.com/"}
CACHE = os.path.join(ROOT, "build-urls.json")
STATUS = os.path.join(ROOT, "repair3-status.json")


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
    return "https://" + m.group(0).rsplit("/", 1)[0] + "/" if m else None


def main():
    try: bases = json.load(open(CACHE))
    except Exception: bases = {}
    status = {}
    # collect every package dir that contains a manifest/ dir (incl. sub-builds)
    pkgs = set()
    for m in glob.glob(os.path.join(ROOT, "*", "manifest")):
        pkgs.add(os.path.dirname(m))
    for m in glob.glob(os.path.join(ROOT, "*", "*", "manifest")):
        pkgs.add(os.path.dirname(m))

    for pkg in sorted(pkgs):
        rel = os.path.relpath(pkg, ROOT).replace("\\", "/")
        slug = rel.split("/")[0]
        sub = rel[len(slug):].lstrip("/")           # e.g. "sonicexe26" for sub-builds

        # 1) ensure every manifest the JS references is downloaded
        refs = set()
        for j in glob.glob(os.path.join(pkg, "*.js")):
            try: s = io.open(j, encoding="utf-8", errors="replace").read()
            except OSError: continue
            refs.update(re.findall(r'manifest/[a-zA-Z0-9_\-%]+\.json', s))
        refs.add("manifest/default.json")
        if slug not in bases:
            try: bases[slug] = build_base(slug)
            except Exception: bases[slug] = None
            json.dump(bases, open(CACHE, "w"), indent=1)
        base = bases[slug]
        if not base: status[rel] = {"err": "no build url"}; continue
        b = base + (sub + "/" if sub else "")
        for mf in sorted(refs):
            dst = os.path.join(pkg, mf)
            if not os.path.exists(dst):
                try: fetch(b + mf, dst)
                except Exception: pass

        # 2) download every asset all local manifests list but we lack
        missing = []
        for mf in glob.glob(os.path.join(pkg, "manifest", "*.json")):
            txt = io.open(mf, encoding="utf-8", errors="replace").read()
            for p in snk.manifest_paths(txt=txt):
                if p and not os.path.exists(os.path.join(pkg, p)):
                    missing.append(p)
        if not missing:
            status[rel] = {"wanted": 0}; continue
        ok = fail = 0
        def dl(p):
            nonlocal ok, fail
            dst = os.path.join(pkg, p)
            for url in (b + urllib.parse.quote(p), b + p):
                try: fetch(url, dst); ok += 1; return
                except Exception: pass
            fail += 1
        with ThreadPoolExecutor(8) as ex:
            list(ex.map(dl, missing))
        status[rel] = {"wanted": len(missing), "ok": ok, "fail": fail}
        print(f"{rel}: {ok}/{len(missing)} ok ({fail} fail)", flush=True)
        json.dump(status, open(STATUS, "w"), indent=1)
    print("DONE", len(status))


if __name__ == "__main__":
    main()
