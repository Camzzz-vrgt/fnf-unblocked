import re

f = 'pkg/snk-fnf-animania/Funkin.js'
src = open(f, encoding='utf-8').read()

def neuter_after_body(src, pattern, inject, label):
    """insert inject right after the opening { of the matched function"""
    m = re.search(pattern, src)
    if not m:
        print('NOT FOUND:', label); return src
    # find the { after params
    i = src.index('{', m.end()-1)
    at = i + 1
    if src[at:at+12].startswith(inject):
        print('already:', label); return src
    src = src[:at] + inject + src[at:]
    print('patched:', label, '@', m.start())
    return src

# GatePulse.q0 — the exported gate (truthy = allowed)
src = neuter_after_body(src, r"_0x55eb4b\['q0'\]\s*=\s*function\s*\(\)\s*", 'return!![];', 'GatePulse.q0')
# backend_Sk.q2 — URL allowlist verifier (truthy = allowed)
src = neuter_after_body(src, r"_0x454858\['q2'\]\s*=\s*function\s*\([^)]*\)\s*", 'return!![];', 'Sk.q2')
# messieur — deny screen/nav
src = neuter_after_body(src, r"_0x333609\['messieur'\]\s*=\s*function\s*\(\)\s*", 'return;', 'messieur')

open(f, 'w', encoding='utf-8', newline='').write(src)
print('done')
