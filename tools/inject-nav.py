#!/usr/bin/env python
# inject-nav.py — add the site back/fullscreen overlay to every staged
# games/<slug>/index.html (idempotent). Needed once after the iframe removal.
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from build import inject_site_nav, strip_site_nav

GAMES = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "games")

done = skip = 0
for slug in os.listdir(GAMES):
    idx = os.path.join(GAMES, slug, "index.html")
    if not os.path.isfile(idx):
        continue
    page = open(idx, encoding="utf-8", errors="replace").read()
    new = inject_site_nav(strip_site_nav(page))
    if new != page:
        open(idx, "w", encoding="utf-8").write(new)
        done += 1
    else:
        skip += 1
print(f"injected {done}, unchanged {skip}")
