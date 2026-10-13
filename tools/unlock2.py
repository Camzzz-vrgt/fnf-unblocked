#!/usr/bin/env python3
"""Second-pass unlock: some snokido packages hide the anti-leech code
inside a packed eval(…) blob so the text-level unlock can't see it.

For each .js in a package:
  1. find eval(function(…){decoder}( "blob", args )) calls
  2. decode them offline in node (pull the _0x helper decls they need)
  3. splice the decoded source in place of the eval call
  4. run the normal wrapper-NOP pass on the now-readable code
"""
import io, json, os, re, subprocess, sys, tempfile

PKG_ROOT = os.environ.get("PKG_ROOT",
    r"X:/GN-Math-local/site/offline/packages/snokido")

WRAP = re.compile(r"(_0x[0-9a-f]+)\s*=\s*_0x[0-9a-f]+\(this,function\(\)\{")
EVAL = re.compile(r"eval\(function\(")
IDENT = re.compile(r"\b_0x[0-9a-f]+\b")


def match_paren(s, open_i):
    """Index of the ')' matching the '(' at open_i."""
    depth = 0
    in_str = None
    esc = False
    for i in range(open_i, len(s)):
        c = s[i]
        if in_str:
            if esc: esc = False
            elif c == "\\": esc = True
            elif c == in_str: in_str = None
        elif c in "\"'`": in_str = c
        elif c == "(": depth += 1
        elif c == ")":
            depth -= 1
            if depth == 0: return i
    return -1


def find_decl(s, name):
    """Return (start,end) of `var name=…;` or `function name(…){…}`."""
    m = re.search(r"var\s+" + re.escape(name) + r"\s*=", s)
    if m:
        i = m.end()
        in_str = None; esc = False
        while i < len(s):
            c = s[i]
            if in_str:
                if esc: esc = False
                elif c == "\\": esc = True
                elif c == in_str: in_str = None
            elif c in "\"'`": in_str = c
            elif c == ";": return m.start(), i + 1
            i += 1
    m = re.search(r"function\s+" + re.escape(name) + r"\s*\(", s)
    if m:
        p = match_paren(s, s.find("(", m.start()))
        if p < 0: return None
        b = s.find("{", p)
        depth = 0
        for i in range(b, len(s)):
            if s[i] == "{": depth += 1
            elif s[i] == "}":
                depth -= 1
                if depth == 0: return m.start(), i + 1
    return None


def decode_eval(s, eval_start):
    """Decode one eval-packed call at eval_start. Returns (end, decoded)."""
    p = match_paren(s, s.find("(", eval_start))
    if p < 0: return None
    expr = s[eval_start + len("eval("):p]          # function(…)(args) expr
    # collect helper decls the expression references, transitively
    decls, queue, seen = [], list(set(IDENT.findall(expr))), set()
    while queue:
        name = queue.pop()
        if name in seen: continue
        seen.add(name)
        d = find_decl(s, name)
        if not d: continue
        decl = s[d[0]:d[1]]
        decls.append(decl)
        queue += [x for x in IDENT.findall(decl) if x not in seen]
    code = "\n".join(decls) + "\nprocess.stdout.write(String(" + expr + "));\n"
    try:
        with tempfile.NamedTemporaryFile(
                "w", suffix=".js", delete=False, encoding="utf-8") as f:
            f.write(code)
            tmp = f.name
        r = subprocess.run(
            ["node", "--max-old-space-size=8192", tmp],
            capture_output=True, timeout=120)
        os.unlink(tmp)
        if r.returncode != 0:
            return None
        return p + 1, r.stdout.decode("utf-8", "replace")
    except Exception:
        return None


HOSTGATE = re.compile(
    r"(?:window\.)?location\.host(?:name)?\s*={2,3}\s*['\"][^'\"]+['\"]")


def nop_wrappers(s):
    names = WRAP.findall(s)
    for n in set(names):
        s = s.replace(n + "()", "void 0")
    s, gates = HOSTGATE.subn("!0", s)
    return s, len(set(names)) + gates


def unpack(s):
    """Recursively decode eval-packed payloads into readable source."""
    for _ in range(8):
        m = EVAL.search(s)
        if not m: break
        r = decode_eval(s, m.start())
        if not r: break
        end, decoded = r
        s = s[:m.start()] + decoded + s[end:]
    return s


def process(path):
    s = io.open(path, encoding="utf-8", errors="replace").read()
    patched = 0
    # first: patch any hostname gates already inlined as plain text
    # (earlier pass spliced decoded payloads literally into some files)
    s, n = HOSTGATE.subn("!0", s)
    patched += n
    for _ in range(8):
        m = EVAL.search(s)
        if not m: break
        r = decode_eval(s, m.start())
        if not r: break
        end, decoded = r
        decoded = unpack(decoded)           # nested payloads first
        decoded, n = nop_wrappers(decoded)
        patched += n
        # put the patched source back as an eval() string so it runs
        # in the exact scope the original packed call used
        s = s[:m.start()] + "eval(" + json.dumps(decoded) + ")" + s[end:]
    if not patched:
        return 0
    io.open(path, "w", encoding="utf-8").write(s)
    return patched


def main():
    root = sys.argv[1] if len(sys.argv) > 1 else PKG_ROOT
    patched = []
    for dp, _, fs in os.walk(root):
        for f in fs:
            if not f.endswith(".js"): continue
            p = os.path.join(dp, f)
            try:
                n = process(p)
                if n:
                    patched.append((p, n))
                    print("patched", p, f"({n} locks)")
            except Exception as e:
                print("ERR", p, e)
    print(f"{len(patched)} files decoded+patched")


if __name__ == "__main__":
    main()
