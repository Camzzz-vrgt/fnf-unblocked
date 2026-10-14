// trace-obf.js — run the obfuscated IIFE inside `with(proxy)` and log globals.
const fs = require('fs');

const file = process.argv[2];
const start = parseInt(process.argv[3], 10);
const end = parseInt(process.argv[4], 10);
const s = fs.readFileSync(file, 'utf8');
const block = s.slice(start, end); // expect '(function(){...})'

const reads = [];
function tracer(name) {
  const fn = function () { return tracer(name + '()') };
  return new Proxy(fn, {
    get(t, k) {
      if (k === Symbol.toPrimitive) return () => '';
      if (k === 'length') return 0;
      reads.push(name + '.' + String(k));
      return tracer(name + '.' + String(k));
    },
    set() { return true },
    apply() { return tracer(name + '()') },
    has() { return true },
  });
}
const G = new Proxy(function () {}, {
  get(t, k) {
    if (k === Symbol.toPrimitive) return () => '';
    if (k === Symbol.unscopables) return undefined;
    reads.push('G.' + String(k));
    return tracer(String(k));
  },
  set() { return true },
  has() { return true },
});

try {
  const f = new Function('G', 'with(G){ var M = ' + block + '; M.apply(this,[G.a,G.b,G.c,G.d,G.e]); }');
  f(G);
} catch (e) {
  console.log('threw:', String(e).slice(0, 300));
}
const interesting = reads.filter(r =>
  /location|document|referrer|host|href|cookie|domain|URL|top|parent|self|window|frame|script|src|origin|uri|base|nav|canvas/i.test(r));
console.log('--- interesting reads ---');
interesting.slice(0, 80).forEach(r => console.log(r));reads.slice(0,80).forEach(r=>console.log(' *',r));
console.log('total reads:', reads.length);
