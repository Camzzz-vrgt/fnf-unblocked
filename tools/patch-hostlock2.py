#!/usr/bin/env python
# patch-hostlock2.py — neuter the Snokido host-lock inside packaged engine JS.
# Only touches the 19 known-locked files (verified by signature scan).
# Lock vocabulary is identical across variants:
#   gate (bool):  isHostUrlAllowed, scanA/scanB, vmScanA, isAntiTamperOk,
#                 pulseGate, verifyGatePulseBridge, computeCanarySignature
#   guard/deny:   rx, installRuntimeGuard, cary, messie, showAccessMessage,
#                 printAccess, captureAntiTamperBaseline,
#                 refreshImageCanaryProbe, decodeCanaryUri, decodeHostLayer*
# We inject "return!![];" right after each lock function's opening brace,
# matching ONLY the property-definition forms used in these files:
#   'name':function(...){   "name":function(){   name:function(){  name: function() {
import os, re, subprocess

PKG = os.path.join(os.path.dirname(__file__), "..", "pkg")

LOCKED = [
    "snk-fnf-animania/Funkin.js",
    "snk-fnf-bang-bang-bang/Funkin.js",
    "snk-fnf-bikini-horrors/Funkin.js",
    "snk-fnf-due-debts/Funkin.js",
    "snk-fnf-dusk-till-dawn-remix/Funkin.js",
    "snk-fnf-hazier-river/Funkin.js",
    "snk-fnf-jax-toy/Funkin.js",
    "snk-fnf-mid-fight-masses-repented/Funkin.js",
    "snk-fnf-nocturnal-protocol/Funkin.js",
    "snk-fnf-philly-mix/Funkin.js",
    "snk-fnf-rescript-blueballed/PsychEngine.js",
    "snk-fnf-sonic-the-funk/PsychEngine.js",
    "snk-fnf-steven-mix/Funkin.js",
    "snk-fnf-vocaloid-pack/Funkin.js",
    "snk-fnf-vs-fliqpy-post-traumatic/PsychEngine.js",
    "snk-fnf-vs-mouse-ultimate/Funkin.js",
    "snk-fnf-vs-shucks-demo/PsychEngine.js",
    "snk-fnf-vs-team-fortress-2-mann-co-v2/tf2.js",
    "snk-fnf-vs-tricky-clowned-out/Funkin.js",
    "snk-fnf-yararara/Funkin.js",
]

NAMES = [
    "isHostUrlAllowed", "scanA", "scanB", "scanC", "vmScanA",
    "isAntiTamperOk", "pulseGate", "verifyGatePulseBridge",
    "computeCanarySignature",
    "rx", "installRuntimeGuard", "cary", "messie", "showAccessMessage",
    "printAccess", "captureAntiTamperBaseline", "refreshImageCanaryProbe",
    "decodeCanaryUri", "decodeHostLayer2", "decodeHostLayer",
]

def patch_file(path):
    src = open(path, encoding="utf-8", errors="strict").read()
    touched = []
    for name in NAMES:
        pat = re.compile(
            r"(['\"]" + re.escape(name) + r"['\"]|" + re.escape(name) + r")"
            r"\s*:\s*function\s*\([^)]*\)\s*\{"
        )
        def repl(m):
            touched.append(name)
            return m.group(0) + "return!![];"
        src = pat.sub(repl, src)
    if touched:
        open(path, "w", encoding="utf-8").write(src)
    return sorted(set(touched))

for rel in LOCKED:
    p = os.path.join(PKG, rel)
    if not os.path.exists(p):
        print("MISSING", rel)
        continue
    t = patch_file(p)
    r = subprocess.run(["node", "--check", p], capture_output=True, text=True)
    ok = "OK" if r.returncode == 0 else "SYNTAX-FAIL: " + r.stderr.splitlines()[0]
    print(rel, "| patched:", ",".join(t) or "NONE", "|", ok)
