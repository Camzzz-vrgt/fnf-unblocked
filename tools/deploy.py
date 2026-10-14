#!/usr/bin/env python3
"""Deploy both fnf links: rebuild single-file -> ../math-site/, purge CF edge cache.

  python tools/deploy.py

fnf.booksforschool.online serves this directory live (no copy needed).
math.booksforschool.online serves ../math-site/index.html (the single-file).
Purge token lives in ~/.cf-toby-purge.env (zone-scoped, not committed).
"""
import json
import os
import shutil
import subprocess
import sys
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
SITE = os.path.dirname(HERE)
MATH = os.path.join(os.path.dirname(SITE), "math-site")
ENV = os.path.expanduser("~/.cf-toby-purge.env")
HOSTS = ["fnf.booksforschool.online", "math.booksforschool.online"]

subprocess.check_call([sys.executable, os.path.join(HERE, "build-singlefile.py")], cwd=SITE)

dst = os.path.join(MATH, "index.html")
shutil.copyfile(os.path.join(SITE, "single-file.html"), dst)
print("published ->", dst)

env = {}
for line in open(ENV):
    if "=" in line:
        k, v = line.strip().split("=", 1)
        env[k] = v

req = urllib.request.Request(
    f"https://api.cloudflare.com/client/v4/zones/{env['CF_ZONE_ID']}/purge_cache",
    data=json.dumps({"hosts": HOSTS}).encode(),
    headers={"Authorization": f"Bearer {env['CF_PURGE_TOKEN']}",
             "Content-Type": "application/json"},
    method="POST")
r = json.load(urllib.request.urlopen(req))
print("purge:", "OK" if r.get("success") else r)
