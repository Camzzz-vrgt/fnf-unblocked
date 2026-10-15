import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
let lastPct = '';
p.on('console', m => { const mm = m.text().match(/\((\d+)%/); if (mm) lastPct = mm[1] + '%'; });
await p.goto('http://127.0.0.1:8690/pkg/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(30000);
const r = await p.evaluate(() => ({
  q: (window.__q || []).slice(-8),
  qp: (window.__qp || []).slice(-8),
  qpN: (window.__qp || []).length,
  pre: (window.__pre || []).length,
  ok: new Set(window.__preOk || []).size,
}));
console.log('pct=' + lastPct, 'pre=' + r.pre, 'ok=' + r.ok, 'pops=' + r.qpN);
console.log('Q tail:', JSON.stringify(r.q));
console.log('POP tail:', JSON.stringify(r.qp));
await b.close(); process.exit(0);
