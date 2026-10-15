import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
const done = new Set(); let pending = new Set(); const fails = [];
let lastPct = '';
p.on('request', r => pending.add(r.url()));
p.on('requestfinished', r => { pending.delete(r.url()); done.add(r.url()); });
p.on('requestfailed', r => { pending.delete(r.url()); fails.push(r.url().slice(-70)); });
p.on('console', m => { const t = m.text(); const mm = t.match(/\((\d+)%/); if (mm) lastPct = mm[1] + '%'; });
await p.goto('http://127.0.0.1:8690/games/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
for (let i = 0; i < 6; i++) {
  await p.waitForTimeout(10000);
  console.log(((i + 1) * 10) + 's pct=' + lastPct, 'done=' + done.size, 'pend=' + pending.size, 'fail=' + fails.length);
}
console.log('fails:', fails.slice(0, 6).join(' ; '));
console.log('pending:', [...pending].slice(0, 6).map(u => u.slice(-70)).join(' ; '));
await b.close(); process.exit(0);
