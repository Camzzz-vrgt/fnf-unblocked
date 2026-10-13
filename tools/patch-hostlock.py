#!/usr/bin/env python
# patch-hostlock.py — bypass hostname checks inside self-decrypting jsjiami/AwiC
# wrappers by extracting the eval literal, capturing the decrypted payload via a
# node eval hook, patching the domain check feed, and re-embedding.
import os, re, sys, json, subprocess, tempfile

PKG_ROOT = r"X:\GN-Math-local\site\offline\packages\snokido"

def find_eval_literals(src):
    """Yield (start_of_eval_paren, lit_start, lit_end_incl_quote) for eval("...")."""
    out = []
    for m in re.finditer(r'eval\("', src):
        j = m.end() - 1
        k = j + 1
        while k < len(src):
            c = src[k]
            if c == '\\':
                k += 2
                continue
            if c == '"':
                break
            k += 1
        else:
            continue
        out.append((m.start() + 4, j, k + 1))  # '(' pos, quote pos, after close quote
    return out

def decode_lit(lit, workdir):
    """Decode a JS string literal via node (handles all JS escapes)."""
    lf = os.path.join(workdir, "lit.txt")
    open(lf, "w", encoding="utf-8").write(lit)
    r = subprocess.run(["node", "-e",
                        'process.stdout.write(eval(require("fs").readFileSync(process.argv[1],"utf8")))',
                        lf], capture_output=True)
    if r.returncode != 0:
        raise ValueError("decode failed: " + r.stderr.decode()[:200])
    return r.stdout.decode("utf-8", errors="replace")

def capture_payload(awic_src, workdir):
    """Run the wrapper in node with eval hooked to capture the inner payload."""
    cap = os.path.join(workdir, "cap.js")
    srcf = os.path.join(workdir, "awic_src.js")
    out = os.path.join(workdir, "payload.js")
    open(srcf, "w", encoding="utf-8").write(awic_src)
    js = (
        'const fs=require("fs");'
        'const src=fs.readFileSync(process.argv[1],"utf8");'
        'const out=process.argv[2];'
        'const realEval=eval;'
        'globalThis.eval=function(code){fs.writeFileSync(out,String(code));return function(){}};'
        'try{realEval(src)}catch(e){}'
        'globalThis.eval=realEval;'
    )
    subprocess.run(["node", "-e", js, srcf, out], check=False, capture_output=True)
    if not os.path.exists(out):
        return None
    p = open(out, encoding="utf-8").read()
    os.remove(out)
    return p if len(p) > 5000 and p != awic_src else None

def patch_payload(payload):
    """Neutralize the domain check: force the checked value to the allowlisted host.
    Returns (patched, how) or (None, reason)."""
    # Pattern A (KSI): const <flto>=<a>||<b>;  where a/b are fingerprinted lookups
    m = re.search(r'const (\w+)=(\w+)\|\|(\w+);', payload)
    if m:
        patched = payload[:m.start()] + f'const {m.group(1)}="w8.snokido.com";' + payload[m.end():]
        return patched, f"A:{m.group(0)}"
    return None, "no pattern"


def patch_inline(src):
    """Pattern B (jsjiami inline): fingerprinted 'document' check with an
    allowed-flag 'var X=!1' and a 'obj[a][b]=url' kill. Force flag to !0.
    Returns (patched, how) or (None, reason)."""
    DOC_FP = "[7,116,5,101,3,117,0,100]"
    fp = src.find(DOC_FP)
    if fp < 0:
        return None, "no doc fingerprint"
    seg_end = src.find(DOC_FP, fp + 1)
    seg = src[fp:(seg_end if seg_end > 0 else fp + 9000)]
    m = re.search(r'var (\w+)=!1', seg)
    if not m:
        return None, "no flag"
    flag = m.group(1)
    # flag must gate a 'obj[a][b]=url' kill (i.e., appear in if(!X) nearby)
    if not re.search(r'!\s*' + re.escape(flag) + r'\b', seg[m.end():]):
        return None, "flag not gating"
    newseg = seg[:m.start()] + seg[m.start():].replace(f"var {flag}=!1", f"var {flag}=!0", 1)
    return src[:fp] + newseg + src[fp + len(seg):], f"B:flag {flag}"


def process_inline(js_path):
    src = open(js_path, encoding="utf-8", errors="replace").read()
    out = patch_inline(src)
    if not out[0]:
        return False, out[1]
    open(js_path, "w", encoding="utf-8").write(out[0])
    return True, out[1]

def process(js_path, workdir):
    """Patch every self-decrypt eval literal in the file. Each replacement is a
    plaintext payload with the domain check neutered."""
    src = open(js_path, encoding="utf-8", errors="replace").read()
    results = []
    patched_any = False
    # iterate on an evolving string; recompute positions after each replace
    while True:
        lits = find_eval_literals(src)
        did = False
        for (epos, j, kend) in lits:
            lit = src[j:kend]
            try:
                awic = decode_lit(lit, workdir)
            except Exception:
                continue
            if not (len(awic) > 20000 and "toString()" in awic
                    and "eval(" in awic and re.search(r'\.apply\(null,(\w+)\)', awic)):
                continue  # not a self-decrypt wrapper
            payload = capture_payload(awic, workdir)
            if not payload:
                results.append("capture-failed")
                continue
            patched, how = patch_payload(payload)
            if not patched:
                results.append(how)
                continue
            argvar = re.search(r'\.apply\(null,(\w+)\)', awic).group(1)
            newlit = json.dumps(patched)
            assert src[epos:epos+1] == "("
            before = src[:epos]
            if not before.endswith("eval"):
                results.append("not-in-eval")
                continue
            before = before[:-4]
            after = src[kend:]
            if not after.startswith(")"):
                results.append("no-close-paren")
                continue
            src = before + "eval(" + newlit + ").apply(null," + argvar + after
            results.append("OK:" + how)
            patched_any = True
            did = True
            break
        if not did:
            break
    if patched_any:
        open(js_path, "w", encoding="utf-8").write(src)
        return True, " ".join(results)
    return False, " ".join(results) or "no eval literal found"

if __name__ == "__main__":
    pkg = sys.argv[1]
    jsname = sys.argv[2]
    js_path = os.path.join(PKG_ROOT, pkg, jsname)
    workdir = tempfile.mkdtemp()
    ok, msg = process(js_path, workdir)
    if not ok:
        ok, msg = process_inline(js_path)
    print(("OK " if ok else "FAIL ") + pkg + " " + msg)
