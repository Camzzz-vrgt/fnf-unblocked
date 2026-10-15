import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const ctx = await b.newContext();
await ctx.addInitScript(() => {
  window.__loads = [];
  const L = window.__loads;
  const X = XMLHttpRequest;
  window.XMLHttpRequest = function () {
    const r = new X(); let url = '';
    const oo = r.open.bind(r); r.open = (m, u) => { url = u; return oo(m, u); };
    const os = r.send.bind(r); r.send = (b) => { L.push({ t: 'xhr', u: url, d: 0 }); const i = L.length - 1;
      r.addEventListener('loadend', () => { L[i].d = 1; L[i].st = r.status; }); return os(b); };
    return r;
  };
  const of = window.fetch;
  window.fetch = (u, o) => { L.push({ t: 'fetch', u: String(u && u.url || u), d: 0 }); const i = L.length - 1;
    return of(u, o).then(r => { L[i].d = 1; L[i].st = r.status; return r }, e => { L[i].d = 1; L[i].st = 'err'; throw e }); };
  const d = Object.getOwnPropertyDescriptor(HTMLImageElement.prototype, 'src');
  Object.defineProperty(HTMLImageElement.prototype, 'src', { get: d.get, set(v) {
    const el = this; L.push({ t: 'img', u: String(v), d: 0 }); const i = L.length - 1;
    el.addEventListener('load', () => L[i].d = 1); el.addEventListener('error', () => { L[i].d = 1; L[i].st = 'err'; });
    d.set.call(el, v); } });
  try { const AC = window.AudioContext || window.webkitAudioContext;
    const od = AC.prototype.decodeAudioData;
    AC.prototype.decodeAudioData = function (buf, ok, err) { L.push({ t: 'aud', u: 'bytes' + buf.byteLength, d: 0 }); const i = L.length - 1;
      return od.call(this, buf, r => { L[i].d = 1; ok && ok(r) }, e => { L[i].d = 1; L[i].st = 'err'; err && err(e) }); };
  } catch (e) {}
  try { if (window.FontFace) { const oL = FontFace.prototype.load;
    FontFace.prototype.load = function () { const fam = this.family; L.push({ t: 'font', u: fam, d: 0 }); const i = L.length - 1;
      return oL.call(this).then(r => { L[i].d = 1; return r }, e => { L[i].d = 1; L[i].st = 'err'; throw e }); }; } } catch (e) {}
});
const p = await ctx.newPage();
await p.goto('http://127.0.0.1:8690/games/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(30000);
const r = await p.evaluate(() => {
  const L = window.__loads || [];
  const byType = {};
  L.forEach(x => { byType[x.t] = (byType[x.t] || 0) + 1 });
  return { total: L.length, byType, unfinished: L.filter(x => !x.d), fonts: L.filter(x => x.t === 'font').slice(0, 20) };
});
console.log(JSON.stringify(r, null, 1).slice(0, 4000));
await b.close(); process.exit(0);
