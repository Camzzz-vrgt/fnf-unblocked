import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
let lastPct = '';
p.on('console', m => { const mm = m.text().match(/\((\d+)%/); if (mm) lastPct = mm[1] + '%'; });
await p.goto('http://127.0.0.1:8690/pkg/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(25000);
const r = await p.evaluate(() => {
  const pre = window.__pre || [], ok = new Set(window.__preOk || []), err = window.__preErr || [];
  const stuck = pre.map(x => x.split('|')).filter(([id]) => !ok.has(id) && !err.some(e => e.startsWith(id + '|')));
  return { total: pre.length, ok: ok.size, stuck: stuck.slice(0, 20), err: err.slice(0, 5) };
});
console.log('pct=' + lastPct, 'total=' + r.total, 'ok=' + r.ok, 'errs=' + JSON.stringify(r.err));
console.log('STUCK:', JSON.stringify(r.stuck, null, 1));
await b.close(); process.exit(0);
