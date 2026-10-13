#!/usr/bin/env python3
"""Pack ALL staged games into pkg/ and push to GitHub in batches.

Pack ~1.5GB at a time -> git add/commit/push -> repeat, so each push
stays small enough to succeed and a rerun resumes where it stopped
(repo-games.json records what's already packed).

  python tools/ship-games.py
"""
import io
import json
import os
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import importlib.util

spec = importlib.util.spec_from_file_location(
    "pack_games",
    os.path.join(os.path.dirname(os.path.abspath(__file__)),
                 "pack-games.py"))
pg = importlib.util.module_from_spec(spec)
spec.loader.exec_module(pg)

SITE = pg.SITE
BATCH = int(1.5e9)  # bytes of pkg data per commit+push


def git(*args):
    r = subprocess.run(["git", "-C", SITE] + list(args),
                       capture_output=True, text=True)
    if r.returncode != 0:
        print("git", args[0], "FAILED:", r.stderr.strip()[:400])
        return False
    return True


def main():
    sizes = json.load(io.open(pg.SIZES, encoding="utf-8"))
    done = json.load(io.open(pg.REPO_GAMES, encoding="utf-8")) \
        if os.path.isfile(pg.REPO_GAMES) else []
    done_set = set(done)

    # smallest first -> most games playable earliest; flagship first
    todo = sorted((s for s in sizes if s not in done_set),
                  key=lambda s: sizes[s]["bytes"])
    print(f"{len(done)} packed, {len(todo)} to go", flush=True)

    batch_slugs, batch_bytes = [], 0
    for i, slug in enumerate(todo):
        print(f"[{i+1}/{len(todo)}] pack {slug} "
              f"({sizes[slug]['bytes']/1e6:.0f}MB)", flush=True)
        if pg.pack(slug) is None:
            continue
        done.append(slug)
        done_set.add(slug)
        io.open(pg.REPO_GAMES, "w", encoding="utf-8").write(
            json.dumps(done, indent=1))
        batch_slugs.append(slug)
        batch_bytes += sizes[slug]["bytes"]

        if batch_bytes >= BATCH:
            if not push_batch(batch_slugs):
                sys.exit(1)
            batch_slugs, batch_bytes = [], 0

    if batch_slugs:
        if not push_batch(batch_slugs):
            sys.exit(1)
    print(f"DONE — {len(done)} games shipped", flush=True)


def push_batch(slugs):
    print(f"  pushing {len(slugs)} game(s) ...", flush=True)
    if not git("add", "--", *[f"pkg/{s}" for s in slugs],
               "data/repo-games.json"):
        return False
    if not git("commit", "-m",
               f"pack games: {slugs[0]} (+{len(slugs)-1} more)"):
        return False
    for attempt in range(3):
        if git("push"):
            return True
        print("  push failed, retrying", flush=True)
    return False


if __name__ == "__main__":
    main()
