import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
const f5 = [], errs = [];
p.on('response', r => { if (r.status() >= 500) f5.push(r.status() + ' ' + r.url().slice(-60)); });
p.on('console', m => { const t = m.text(); if (m.type() === 'error') errs.push(t.slice(0, 140)); if (/DownloadingAssets|%\)/.test(t)) errs.push('P:' + t.slice(0, 90)); });
await p.goto('https://fnf.booksforschool.online/pkg/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
for (let i = 0; i < 8; i++) {
  await p.waitForTimeout(15000);
  const st = await p.evaluate(() => ({
    c: !!document.querySelector('canvas'),
    txt: (document.querySelector('canvas') ? 'canvas-live' : document.body.innerText.slice(0, 80)),
    u: location.href.slice(0, 60)
  })).catch(e => ({ err: String(e) }));
  console.log(((i + 1) * 15) + 's', JSON.stringify(st), '5xx=' + f5.length);
}
console.log('--- last 5xx:', f5.slice(-5).join(' ; '));
console.log('--- console errs:', errs.slice(-8).join(' ;; '));
await b.close(); process.exit(0);
