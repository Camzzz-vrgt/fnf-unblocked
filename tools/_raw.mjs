import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
let lastPct = '';
p.on('console', m => { const mm = m.text().match(/\((\d+)%/); if (mm) lastPct = mm[1] + '%'; });
await p.goto('http://127.0.0.1:8690/games/friday-night-funkin/index-noshim.html', { waitUntil: 'load', timeout: 60000 });
for (let i = 0; i < 6; i++) { await p.waitForTimeout(8000); console.log(((i+1)*8)+'s pct='+lastPct); }
await b.close(); process.exit(0);
