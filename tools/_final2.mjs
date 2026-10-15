import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
let lastPct = '', lastState = '';
p.on('console', m => {
  const t = m.text();
  const mm = t.match(/\((\d+)%/); if (mm) lastPct = mm[1] + '%';
  const sm = t.match(/PRELOADER\s+(\w+)/); if (sm) lastState = sm[1];
});
p.on('pageerror', e => console.log('[PAGEERROR]', String(e).slice(0, 300)));
await p.goto('http://127.0.0.1:8690/pkg/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
for (let i = 0; i < 18; i++) {
  await p.waitForTimeout(10000);
  console.log(((i+1)*10)+'s '+lastState+' '+lastPct);
  if (lastState === 'Complete') { await p.waitForTimeout(5000); break; }
}
const shot = await p.screenshot({ path: 'tools/_fnl.png' });
console.log('done');
await b.close(); process.exit(0);
