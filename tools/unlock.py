#!/usr/bin/env python3
"""Neutralize the obfuscator.io anti-leech wrapper inside snokido game JS.

Locked builds call a once-wrapped checker (VAR = OTHER(this, function(){...}))
whose invocation (VAR()) navigates the page to about:blank when the host
isn't whitelisted. We replace every bare `VAR()` callsite with `void 0`.
"""
import io
import os
import re
import sys

PKG_ROOT = r"X:/GN-Math-local/site/offline/packages/snokido"

WRAP_RE = re.compile(r"(_0x[0-9a-f]+)\s*=\s*_0x[0-9a-f]+\(this,function\(\)\{")


def unlock_file(path):
    s = io.open(path, encoding="utf-8", errors="replace").read()
    names = WRAP_RE.findall(s)
    if not names:
        return 0
    changed = 0
    for name in set(names):
        n = s.count(name + "()")
        if n:
            s = s.replace(name + "()", "void 0")
            changed += n
    if changed:
        io.open(path, "w", encoding="utf-8").write(s)
    return changed


def unlock_pkg(pkg_dir):
    total = 0
    for dp, _, fs in os.walk(pkg_dir):
        for f in fs:
            if f.endswith(".js") and not f.endswith(".bak"):
                total += unlock_file(os.path.join(dp, f))
    return total


if __name__ == "__main__":
    patched = {}
    for slug in sorted(os.listdir(PKG_ROOT)):
        d = os.path.join(PKG_ROOT, slug)
        if not os.path.isdir(d):
            continue
        n = unlock_pkg(d)
        if n:
            patched[slug] = n
            print(f"  {slug}: {n} lock call(s) neutralized")
    print(f"\n{len(patched)} packages patched")
