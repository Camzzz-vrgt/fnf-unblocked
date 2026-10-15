import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
let lastPct = '', lastState = '';
p.on('console', m => {
  const t = m.text();
  const mm = t.match(/\((\d+)%/); if (mm) lastPct = mm[1] + '%';
  const sm = t.match(/PRELOADER\s+(\w+)/); if (sm) lastState = sm[1];
});
const errs = [];
p.on('pageerror', e => errs.push(String(e).slice(0, 120)));
await p.goto('http://127.0.0.1:8690/pkg/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
for (let i = 0; i < 6; i++) { await p.waitForTimeout(5000); if (lastState === 'Complete' && i > 1) break; }
console.log('BASE:', lastState, lastPct, 'pageerrs=' + errs.length);
// animania sanity
await p.goto('http://127.0.0.1:8690/pkg/snk-fnf-animania/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(12000);
const c = await p.evaluate(() => !!document.querySelector('canvas'));
console.log('ANIMANIA canvas:', c, 'errs=' + errs.length);
// overlay presence + back button onclick
const btns = await p.evaluate(() => [...document.querySelectorAll('.fnf-nav button')].map(b => b.getAttribute('onclick')));
console.log('OVERLAY btns:', JSON.stringify(btns));
await b.close(); process.exit(0);
