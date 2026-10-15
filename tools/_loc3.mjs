import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
p.on('pageerror', e => console.log('[PAGEERROR]', String(e).slice(0, 400)));
p.on('console', m => {
  const t = m.text();
  if (m.type() === 'error' || /exception|error|Unknown|cannot|null/i.test(t))
    console.log('[C:' + m.type() + ']', t.slice(0, 220));
});
await p.goto('http://127.0.0.1:8690/games/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(25000);
console.log('--- sampled');
await b.close(); process.exit(0);
