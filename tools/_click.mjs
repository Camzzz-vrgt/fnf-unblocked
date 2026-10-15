import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
let lastPct = '';
p.on('console', m => { const mm = m.text().match(/\((\d+)%/); if (mm) lastPct = mm[1] + '%'; });
await p.goto('http://127.0.0.1:8690/games/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(15000);
console.log('before click pct=' + lastPct);
// inspect audio ctx state
const ac = await p.evaluate(() => { try { const c = new (window.AudioContext || window.webkitAudioContext)(); return c.state; } catch (e) { return 'noAC:' + e } });
console.log('fresh AudioContext state:', ac);
for (let i = 0; i < 5; i++) {
  await p.mouse.click(640, 360);
  await p.waitForTimeout(6000);
  console.log('after click ' + i + ' pct=' + lastPct);
}
await b.close(); process.exit(0);
