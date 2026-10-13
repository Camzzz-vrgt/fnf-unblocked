// deob-obf.js <file.js> <out.js>
// Generic javascript-obfuscator deobfuscator for the domain-check family:
// evals string arrays + decoder functions + alias wrappers, then substitutes
// every <fn>(literal-args) call site with the decoded string.
const fs = require("fs");
const path = require("path");
const file = process.argv[2];
const out = process.argv[3] || path.basename(file) + ".deob.js";
let src = fs.readFileSync(file, "utf8");

// --- collect candidate function defs: function NAME(args){...}
const fnRe = /function\s+(_0x[0-9a-zA-Z$]+)\s*\([^)]*\)\s*\{/g;
const defs = [];
let m;
while ((m = fnRe.exec(src))) {
  const name = m[1];
  const start = m.index;
  // find matching brace
  let depth = 0, i = m.index + m[0].length - 1;
  const bstart = i;
  for (; i < src.length; i++) {
    const c = src[i];
    if (c === "{") depth++;
    else if (c === "}") { depth--; if (!depth) break; }
    else if (c === '"' || c === "'") {
      const q = c; i++;
      while (i < src.length && src[i] !== q) { if (src[i] === "\\") i++; i++; }
    }
  }
  defs.push({ name, text: src.slice(start, i + 1) });
}

// --- collect var/const/let array inits: NAME = [ "x", ... ]
const arrRe = /(?:var|const|let)?\s*(_0x[0-9a-zA-Z$]+)\s*=\s*\[/g;
const arrInits = [];
while ((m = arrRe.exec(src))) {
  const name = m[1];
  const start = m.index;
  let depth = 0, i = src.indexOf("[", m.index);
  for (; i < src.length; i++) {
    const c = src[i];
    if (c === "[") depth++;
    else if (c === "]") { depth--; if (!depth) break; }
    else if (c === '"' || c === "'") {
      const q = c; i++;
      while (i < src.length && src[i] !== q) { if (src[i] === "\\") i++; i++; }
    }
  }
  arrInits.push({ name, text: src.slice(start, i + 1) + ";" });
}

// --- collect rotator IIFEs referencing the arrays: (function(arr,n){...}(arr,num))
const rotRe = /\(\s*function\s*\(\s*(_0x[0-9a-zA-Z$]+)\s*,\s*(_0x[0-9a-zA-Z$]+)\s*\)/g;
const rots = [];
while ((m = rotRe.exec(src))) {
  // take the whole balanced paren expr
  let depth = 0, i = m.index;
  for (; i < src.length; i++) {
    const c = src[i];
    if (c === "(") depth++;
    else if (c === ")") { depth--; if (!depth) break; }
    else if (c === '"' || c === "'") {
      const q = c; i++;
      while (i < src.length && src[i] !== q) { if (src[i] === "\\") i++; i++; }
    }
  }
  rots.push(src.slice(m.index, i + 1) + ";");
}

// Build a sandbox context
const prelude = [];
for (const a of arrInits) prelude.push("var " + a.text);
for (const r of rots) prelude.push(r);
for (const d of defs) prelude.push(d.text + "\nglobalThis." + d.name + "=" + d.name + ";");

let okCount = 0;
for (const p of prelude) {
  try { (0, eval)(p); okCount++; } catch (e) { /* keep going */ }
}
console.log("prelude evals ok:", okCount, "of", prelude.length);

// Second pass for alias defs that referenced decoders defined later
for (const p of prelude) { try { (0, eval)(p); } catch (e) {} }

// --- substitute calls NAME(literal-args)
const names = defs.map(d => d.name).filter(n => typeof globalThis[n] === "function");
console.log("decoders live:", names.length);
// find call sites of any _0x fn with only literal args
let count = 0;
const callRe = /(_0x[0-9a-zA-Z$]+)\s*\(/g;
let outSrc = "", last = 0;
while ((m = callRe.exec(src))) {
  const name = m[1];
  if (typeof globalThis[name] !== "function") continue;
  // parse balanced parens for args
  let depth = 0, i = m.index + m[0].length - 1;
  const ast = i;
  for (; i < src.length; i++) {
    const c = src[i];
    if (c === "(") depth++;
    else if (c === ")") { depth--; if (!depth) break; }
    else if (c === '"' || c === "'") {
      const q = c; i++;
      while (i < src.length && src[i] !== q) { if (src[i] === "\\") i++; i++; }
    }
  }
  const argStr = src.slice(ast + 1, i);
  // only substitute if args are all literals (numbers/strings) — safe eval
  if (!/^[\s\d'"xXoObB0-9a-fA-F._,\-\[\]!+]*$/.test(argStr) || argStr.length > 120) continue;
  try {
    const args = eval("[" + argStr + "]");
    const v = globalThis[name](...args);
    if (typeof v === "string" || typeof v === "number" || typeof v === "boolean") {
      outSrc += src.slice(last, m.index) + JSON.stringify(String(v));
      last = i + 1;
      count++;
    }
  } catch (e) {}
}
outSrc += src.slice(last);
fs.writeFileSync(out, outSrc);
console.log("substituted", count, "calls ->", out);
