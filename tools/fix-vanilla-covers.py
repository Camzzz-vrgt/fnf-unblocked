#!/usr/bin/env python
# fix-vanilla-covers.py — replace covers that show the vanilla FNF logo.
# Rich title screenshots (covers/raw) win where they exist; otherwise the
# mod's antagonist icon is cropped from its spritesheet into a square cover.
import os, glob, re, sys, json
from PIL import Image

SITE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
RAW = os.path.join(SITE, "covers", "raw")

# slug -> preferred icon stem (the mod's antagonist where identifiable)
PICKS = {
    "fnf-blourple-guy-ourple-guy-b-sides": "bourple",
    "fnf-cycles-encore": "lord",
    "fnf-impostor-getaway": "black",
    "fnf-impostor-tainted-fate": "black_april",
    "fnf-jeffy-s-endless-aethos": "jeffy",
    "fnf-lime-impostor": "lime",
    "fnf-parasite-origins-blackness": "parasite",
    "fnf-unknown-suffering-awe-and-saster-remix": "nedle",
    "fnf-unknown-suffering-reanimated": "nedle",
    "fnf-insanity-psychosis-remake": "suicide5",
    "fnf-jurassic-park-breakout": "rexy",
    "fnf-steve-universe-mini-mod-pack": "steven",
    "fnf-vs-bambi-strident-crisis": "bambi",
    "fnf-vs-riddler": "riddie",
    "fnf-antipathy": "efnhank",
    "fnf-vs-bunzo-bunny": "bunzo",
    "fnf-freakpostor": "theimpostor",
    "fnf-qt-rewired": "QT",
    "fnf-confronting-yourself-ff-mix": "sonic",
    "fnf-ben-drowned": "deez",
    "fnf-minus-eteled": "eteled",
}

# shots that came out rich (real title art) — keep them
GOOD_SHOTS = {
    "fnf-creepy-internet-stories",
    "fnf-impostor-b3-remixed",
    "fnf-dusttale-remastered-v2-0",
    "fnf-mami",
    "fnf-creepypasta-but-everyone-sings-it",
    "fnf-hd",
    "fnf-vs-camellia",
}

def icon_frame(path):
    """Crop the first (left) square frame of an icon spritesheet."""
    img = Image.open(path).convert("RGBA")
    h = img.size[1]
    return img.crop((0, 0, h, h))

def pick_icon(slug):
    pkg = os.path.join(SITE, "games", slug, "pkg")
    icons = glob.glob(pkg + "/**/icons/icon-*.png", recursive=True)
    want = PICKS.get(slug, "").lower()
    for f in icons:
        stem = re.sub(r"icon-|\.png$", "", os.path.basename(f)).lower()
        if stem == want or stem == want.lower():
            return f
    # fallback: first non-stock icon
    stock = {"bf", "face", "gf", "bf-old", "bf-pixel", "dad", "spooky",
             "monster", "pico", "mom", "parents", "senpai", "tankman",
             "senpai-pixel", "spirit-pixel", "darnell", "nene", "none"}
    for f in icons:
        stem = re.sub(r"icon-|\.png$", "", os.path.basename(f)).lower()
        if stem not in stock and not stem.startswith("bf") and not stem.startswith("gf"):
            return f
    return None

done, failed = [], []
for slug in PICKS:
    if slug in GOOD_SHOTS:
        continue
    src = pick_icon(slug)
    if not src:
        failed.append(slug)
        continue
    frame = icon_frame(src).resize((512, 512), Image.LANCZOS)
    # drop into covers/raw so build.py's write_cover reproduces it
    frame.save(os.path.join(RAW, slug + ".png"))
    frame.save(os.path.join(SITE, "covers", slug + ".png"))
    done.append((slug, os.path.basename(src)))

for slug, f in done:
    print("ok", slug, "<-", f)
for slug in failed:
    print("NO ICON", slug)
print(len(done), "icon covers,", len(GOOD_SHOTS), "screenshots kept")
