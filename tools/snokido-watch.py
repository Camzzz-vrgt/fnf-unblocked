#!/usr/bin/env python3
"""Live monitor for the snokido ripper. Run it in your own terminal:

    python tools/snokido-watch.py

Shows a progress bar, rate, and ETA. Ctrl+C quits (ripper keeps running).
"""
import io
import json
import os
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
SITE = os.path.dirname(HERE)
STATUS_JSON = os.path.join(SITE, "data", "snokido-status.json")
INV_JSON = os.path.join(SITE, "data", "snokido-inventory.json")
PKG_ROOT = r"X:/GN-Math-local/site/offline/packages/snokido"

BAR_W = 34


def fmt_dur(s):
    if s is None or s < 0:
        return "?"
    s = int(s)
    if s < 60:
        return f"{s}s"
    if s < 3600:
        return f"{s // 60}m{s % 60:02d}s"
    return f"{s // 3600}h{s % 3600 // 60:02d}m"


def fmt_bytes(n):
    for u in ("B", "KB", "MB", "GB"):
        if n < 1024 or u == "GB":
            return f"{n:.0f}{u}" if u == "B" else f"{n:.1f}{u}"
        n /= 1024


def dir_size(root):
    total = 0
    for dp, _, fs in os.walk(root):
        for f in fs:
            try:
                total += os.path.getsize(os.path.join(dp, f))
            except OSError:
                pass
    return total


def render(st):
    total = st.get("total", 0)
    done = st.get("done", 0)
    mirrored = st.get("mirrored", 0)
    dupes = st.get("dupes", 0)
    errors = st.get("errors", 0)
    elapsed = time.time() - st.get("startedAt", time.time())
    stale = time.time() - st.get("updatedAt", time.time())

    fill = int(BAR_W * done / total) if total else 0
    bar = "#" * fill + "-" * (BAR_W - fill)
    rate = done / elapsed * 60 if elapsed > 0 else 0
    eta = fmt_dur((total - done) / (done / elapsed) if done and total else None)

    cur = st.get("current") or "-"
    ft, fd = st.get("currentFilesTotal") or 0, st.get("currentFilesDone") or 0
    cur_s = f"{cur}  {fd}/{ft} files" if ft else cur

    pkg_size = dir_size(PKG_ROOT) if os.path.isdir(PKG_ROOT) else 0
    state = "RUNNING" if stale < 20 else f"STALE ({fmt_dur(stale)} ago)"

    lines = [
        f"  snokido rip   [{state}]   elapsed {fmt_dur(elapsed)}",
        "",
        f"  [{bar}] {done}/{total} games",
        "",
        f"  current   {cur_s}",
        f"  mirrored  {mirrored}   dupes {dupes}   errors {errors}",
        f"  rate      {rate:.1f} games/min   eta {eta}",
        f"  on disk   {fmt_bytes(pkg_size)}",
        "",
        "  ctrl+c to exit (rip keeps running)",
    ]
    return "\n".join(lines)


def main():
    while True:
        st = {}
        if os.path.isfile(STATUS_JSON):
            try:
                st = json.load(io.open(STATUS_JSON, encoding="utf-8"))
            except (json.JSONDecodeError, OSError):
                pass
        if not st:
            # rip not started or no status yet — still show inventory count
            n = 0
            if os.path.isfile(INV_JSON):
                try:
                    n = len(json.load(io.open(INV_JSON, encoding="utf-8")))
                except (json.JSONDecodeError, OSError):
                    pass
            out = f"  no status file yet — {n} games in inventory"
        else:
            out = render(st)
        sys.stdout.write("\x1b[H\x1b[J" + out + "\n")
        sys.stdout.flush()
        time.sleep(1.5)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print()
