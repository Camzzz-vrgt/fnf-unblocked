import re, sys

f = 'pkg/snk-fnf-animania/Funkin.js'
src = open(f, encoding='utf-8').read()

def neuter(src, pattern, inject, label):
    m = re.search(pattern, src)
    if not m:
        print('NOT FOUND:', label); return src, False
    at = m.end()
    if src[at:at+30].lstrip().startswith('return!![];') or src[at:at+30].lstrip().startswith('return;'):
        print('already neutered:', label); return src, True
    src = src[:at] + inject + src[at:]
    print('patched:', label, '@', m.start())
    return src, True

# ry — periodic location check (truthy = ok)
src, _ = neuter(src, r"'ry':function\s*\(\)\s*\{", 'return!![];', 'ry')
# q4 — allowlist check (truthy = allowed)
src, _ = neuter(src, r"\['q4'\]\s*=\s*function\s*\([^)]*\)\s*\{", 'return!![];', 'q4')
# q3 — deny action
src, _ = neuter(src, r"\['q3'\]\s*=\s*function\s*\([^)]*\)\s*\{", 'return!![];', 'q3')

open(f, 'w', encoding='utf-8', newline='').write(src)
print('done')
