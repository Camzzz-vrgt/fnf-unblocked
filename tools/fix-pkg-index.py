#!/usr/bin/env python
# fix-pkg-index.py — clean pkg/<slug>/index.html leftovers from the source
# mirrors that cause 404/CORS console noise or break the engine load:
#   * cloudflareinsights beacon.min.js script tags -> remove
#   * ../sk.min.js (mirror loader)                  -> remove
#   * /assets/js.js absolute path                   -> relative if file exists,
#                                                     else remove
#   * script src pointing at a missing local file   -> report (engine mismatch)
import os, re, sys

PKG = os.path.join(os.path.dirname(__file__), "..", "pkg")

SCRIPT_RE = re.compile(r'<script[^>]*\bsrc=["\']([^"\']+)["\'][^>]*>\s*</script>'
                       r'|<script[^>]*\bsrc=["\']([^"\']+)["\'][^>]*>', re.I)

def fix(path, slug):
    s = open(path, encoding="utf-8", errors="strict").read()
    orig = s
    missing = []

    def repl(m):
        url = m.group(1) or m.group(2)
        tag = m.group(0)
        if "cloudflareinsights.com" in url or "cdn-cgi" in url:
            return ""  # beacon/tracker
        if "sk.min.js" in url:
            return ""  # mirror loader, not shipped
        if url.startswith("/"):
            rel = url.lstrip("/").split("?")[0].split("#")[0]
            if os.path.exists(os.path.join(os.path.dirname(path), rel)):
                return tag.replace(url, rel)
            return ""  # dead absolute path -> drop
        rel = url.split("?")[0].split("#")[0]
        rel = re.sub(r"^\./", "", rel)
        if not url.startswith(("http", "//", "data:")) and \
           not os.path.exists(os.path.join(os.path.dirname(path), rel)):
            missing.append(url)
        return tag

    s = SCRIPT_RE.sub(repl, s)
    if s != orig:
        open(path, "w", encoding="utf-8").write(s)
    return s != orig, missing

for d in sorted(os.listdir(PKG)):
    idx = os.path.join(PKG, d, "index.html")
    if not os.path.exists(idx):
        continue
    changed, missing = fix(idx, d)
    if changed or missing:
        print(f"{d}: cleaned={changed} missing={missing}")
