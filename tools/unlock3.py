#!/usr/bin/env python3
"""unlock3.py — NOP javascript-obfuscator "domain fingerprint" protection calls.

Pattern: NAME=FACTORY(this,(function(){ <charcode fingerprint search of
window->document->location->hostname + scrambled domain allow-list +
window[doc][loc]="about:blank" assignment> })) ; NAME()

We NOP only the *call site* `;NAME();` — never the function sources, so
self-defending toString integrity checks keep passing.
"""
import re, sys, pathlib

ROOT = pathlib.Path(r"X:\GN-Math-local\site\offline\packages\snokido")

# fingerprint arrays like [7,116,5,101,3,117,0,100] (index,charCode pairs)
FINGER = re.compile(r'\[(?:\d+,\d{2,3},){3,}\d+,\d{2,3}\]')
# bare call statement of a protection result:  ;NAME();  or  ,NAME(),
CALL = re.compile(r'([;,])(_0x[0-9a-fA-F]+)\(\)(?=[;,])')
# wrapper-result def: NAME=FACTORY(this,(function(){
DEF = re.compile(r'(_0x[0-9a-fA-F]+)=(_0x[0-9a-fA-F]+)\(this,\(function')


def patched(src: str):
    defs = {m.group(1): m.start() for m in DEF.finditer(src)}
    hits = []
    for m in CALL.finditer(src):
        name = m.group(2)
        d = defs.get(name)
        if d is None or d > m.start():
            continue
        region = src[d:m.start()]
        # the domain check body: fingerprint arrays + a replace() that decodes
        # the scrambled "about:blank"/domain strings
        if len(FINGER.findall(region)) >= 3 and ('repl"+"ace' in region or '.replace(' in region):
            hits.append((m.start(), name))
    return hits


def main():
    only = sys.argv[1:] or None
    for js in sorted(ROOT.rglob('*.js')):
        if only and not any(o in str(js) for o in only):
            continue
        try:
            src = js.read_text(encoding='utf-8', errors='replace')
        except OSError:
            continue
        if '_0x' not in src:
            continue
        hits = patched(src)
        if not hits:
            continue
        # NOP each call site (exactly once per name)
        done = set()
        for pos, name in hits:
            stmt = f';{name}();'
            if stmt in src and name not in done:
                src = src.replace(stmt, ';void 0;')
                done.add(name)
        js.write_text(src, encoding='utf-8', newline='')
        print(f'{js.parent.name}/{js.name}: NOPed {sorted(done)}')


if __name__ == '__main__':
    main()
