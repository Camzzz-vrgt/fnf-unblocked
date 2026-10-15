import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
const pending = new Set();
p.on('request', r => pending.add(r.url()));
p.on('requestfinished', r => pending.delete(r.url()));
p.on('requestfailed', r => pending.delete(r.url()));
let lastPct = '', lastState = '';
p.on('console', m => {
  const t = m.text();
  const mm = t.match(/\((\d+)%/); if (mm) lastPct = mm[1] + '%';
  const sm = t.match(/PRELOADER\s+(\w+)/); if (sm) lastState = sm[1];
});
await p.goto('http://127.0.0.1:8690/pkg/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(30000);
const r = await p.evaluate(() => {
  const pre = window.__pre || [], ok = new Set(window.__preOk || []), err = window.__preErr || [];
  const stuck = pre.map(x => x.split('|')).filter(([id]) => !ok.has(id) && !err.some(e => e.startsWith(id + '|')));
  return { ok: ok.size, t: pre.length, stuck, err: err.slice(0, 6) };
});
console.log(lastState, lastPct, 'ok=' + r.ok + '/' + r.t);
console.log('STUCK:', JSON.stringify(r.stuck));
console.log('ERR:', JSON.stringify(r.err));
console.log('pending net:', [...pending].map(u => u.slice(-60)).join(' ; '));
await b.close(); process.exit(0);
