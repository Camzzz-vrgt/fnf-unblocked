import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
let lastPct = '', lastState = '';
p.on('console', m => {
  const t = m.text();
  const mm = t.match(/\((\d+)%/); if (mm) lastPct = mm[1] + '%';
  const sm = t.match(/PRELOADER\s+(\w+)/); if (sm) lastState = sm[1];
});
await p.goto('http://127.0.0.1:8690/pkg/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
for (let i = 0; i < 12; i++) {
  await p.waitForTimeout(10000);
  const r = await p.evaluate(() => ({ ok: new Set(window.__preOk || []).size, t: (window.__pre || []).length }));
  console.log(((i + 1) * 10) + 's ' + lastState + ' ' + lastPct + ' ok=' + r.ok + '/' + r.t);
}
await b.close(); process.exit(0);
