#!/usr/bin/env python3
"""Pack staged game packages into the git repo for raw.githubusercontent.com serving.

github raw has no per-file cdn cap, so any file >=19MB is split into
<name>.partNN chunks (16MB each) and listed in pkg/<slug>/chunks.json —
the single-file launcher reassembles them client-side.

  pkg/<slug>/...          real files (git-committed)
  pkg/<slug>/chunks.json  {"path/from/pkg/root": numParts, ...}
  data/repo-games.json    ["<slug>", ...]  — slugs served via raw.githubusercontent.com

  python tools/pack-games.py <slug...>          pack specific games
  python tools/pack-games.py --budget 2e9       base game + smallest-first
"""
import io
import json
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
SITE = os.path.dirname(HERE)
GAMES = os.path.join(SITE, "games")
OUT = os.path.join(SITE, "pkg")
REPO_GAMES = os.path.join(SITE, "data", "repo-games.json")
SIZES = os.path.join(SITE, "data", "pkg-sizes.json")

LIMIT = 19 * 1024 * 1024   # raw.githubusercontent.com hard cap is 20MB — stay under
CHUNK = 16 * 1024 * 1024


def split_file(src, dest_dir, rel):
    """Split src into chunks under dest_dir. Returns part count."""
    n = 0
    with open(src, "rb") as f:
        while True:
            b = f.read(CHUNK)
            if not b:
                break
            part = os.path.join(dest_dir, f"{rel}.part{n:02d}")
            os.makedirs(os.path.dirname(part), exist_ok=True)
            with open(part, "wb") as o:
                o.write(b)
            n += 1
    return n


def pack(slug):
    src = os.path.join(GAMES, slug, "pkg")
    dst = os.path.join(OUT, slug)
    if not os.path.isdir(src):
        print(f"! {slug}: no package")
        return None
    chunks = {}
    copied = 0
    for dp, _dn, fs in os.walk(src):
        for f in fs:
            sp = os.path.join(dp, f)
            rel = os.path.relpath(sp, src).replace(os.sep, "/")
            dp2 = os.path.join(dst, os.path.dirname(rel))
            os.makedirs(dp2, exist_ok=True)
            tp = os.path.join(dst, rel)
            if os.path.getsize(sp) >= LIMIT:
                if not os.path.isfile(tp + ".part00"):
                    n = split_file(sp, dst, rel)
                    chunks[rel] = n
                else:
                    n = 0
                    while os.path.isfile(os.path.join(
                            dst, f"{rel}.part{n:02d}")):
                        n += 1
                    chunks[rel] = n
                if os.path.isfile(tp):
                    os.remove(tp)
            else:
                if not os.path.isfile(tp) or \
                        os.path.getsize(tp) != os.path.getsize(sp):
                    shutil.copyfile(sp, tp)
                copied += 1
    # drop stale files that vanished upstream
    src_rels = {os.path.relpath(os.path.join(dp, f), src).replace(os.sep, "/")
                for dp, _dn, fs in os.walk(src) for f in fs}
    for dp, _dn, fs in os.walk(dst):
        for f in fs:
            rel = os.path.relpath(os.path.join(dp, f), dst).replace(os.sep, "/")
            if rel == "chunks.json" or ".part" in f:
                continue
            if rel not in src_rels:
                os.remove(os.path.join(dp, f))
    if chunks:
        with io.open(os.path.join(dst, "chunks.json"), "w") as f:
            json.dump(chunks, f, indent=0)
    elif os.path.isfile(os.path.join(dst, "chunks.json")):
        os.remove(os.path.join(dst, "chunks.json"))
    return chunks


def main():
    os.makedirs(OUT, exist_ok=True)
    done = json.load(io.open(REPO_GAMES, encoding="utf-8")) \
        if os.path.isfile(REPO_GAMES) else []

    if len(sys.argv) > 2 and sys.argv[1] == "--budget":
        budget = float(sys.argv[2])
        sizes = json.load(io.open(SIZES, encoding="utf-8"))
        slugs = ["friday-night-funkin"]  # flagship always ships
        total = sizes["friday-night-funkin"]["bytes"]
        for slug, v in sorted(sizes.items(), key=lambda kv: kv[1]["bytes"]):
            if slug == "friday-night-funkin":
                continue
            if total + v["bytes"] > budget:
                continue
            slugs.append(slug)
            total += v["bytes"]
        print(f"budget {budget/1e9:.1f}GB -> {len(slugs)} games "
              f"({total/1e6:.0f}MB)")
    else:
        slugs = sys.argv[1:] or [s for s in done]

    for slug in slugs:
        if slug in done:
            continue
        print(f"+ {slug} ...", flush=True)
        chunks = pack(slug)
        if chunks is None:
            continue
        if chunks:
            print(f"    split {len(chunks)} big file(s)")
        done.append(slug)

    io.open(REPO_GAMES, "w", encoding="utf-8").write(
        json.dumps(done, indent=1))
    print(f"{len(done)} games packed into pkg/")


if __name__ == "__main__":
    main()
