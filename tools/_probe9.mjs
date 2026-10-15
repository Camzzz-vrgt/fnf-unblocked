import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
let lastPct = '';
p.on('console', m => { const mm = m.text().match(/\((\d+)%/); if (mm) lastPct = mm[1] + '%'; });
await p.goto('http://127.0.0.1:8690/pkg/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(30000);
const r = await p.evaluate(() => {
  const qi = window.__rqi || [], qo = window.__rqo || [];
  const outSet = new Set(qo.map(x => x.slice(4)));
  const stuck = qi.filter(x => x.startsWith('in|')).map(x => x.slice(3)).filter(u => !outSet.has(u)).slice(0, 15);
  return { in: qi.length, out: qo.length, stuck, ok: new Set(window.__preOk || []).size, qc: (window.__q || []).length };
});
console.log('pct=' + lastPct, 'rscIn=' + r.in, 'rscOut=' + r.out, 'ok=' + r.ok, 'pQcalls=' + r.qc);
console.log('NEVER-EXITED:', JSON.stringify(r.stuck, null, 1));
await b.close(); process.exit(0);
