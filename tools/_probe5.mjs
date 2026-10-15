import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
let lastPct = '';
p.on('console', m => { const mm = m.text().match(/\((\d+)%/); if (mm) lastPct = mm[1] + '%'; });
await p.goto('http://127.0.0.1:8690/pkg/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(30000);
const r = await p.evaluate(() => {
  const pre = window.__pre || [], ok = new Set(window.__preOk || []), err = window.__preErr || [];
  const stuck = pre.map(x => x.split('|')).filter(([id]) => !ok.has(id) && !err.some(e => e.startsWith(id)));
  const types = {}; pre.forEach(x => { const t = x.split('|')[1]; types[t] = (types[t] || 0) + 1 });
  return { total: pre.length, ok: ok.size, errs: err.length, stuck, types, lastPct: '' };
});
console.log('pct=' + lastPct, 'total=' + r.total, 'ok=' + r.ok, 'errs=' + r.errs);
console.log('types:', JSON.stringify(r.types));
console.log('STUCK:', JSON.stringify(r.stuck));
console.log('ERRS:', JSON.stringify((r.err || []).slice ? [] : []), '');
await b.close(); process.exit(0);
