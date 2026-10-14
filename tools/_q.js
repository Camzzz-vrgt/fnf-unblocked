const { chromium } = require('../../node_modules/playwright-core');
(async () => {
  const b = await chromium.launch({ headless: true });
  const p = await b.newPage();
  const errs = [];
  p.on('console', m => { if (m.type() === 'error') errs.push(m.text().slice(0, 160)); });
  for (const s of ['friday-night-funkin', 'snk-fnf-animania']) {
    errs.length = 0;
    const t0 = Date.now();
    await p.goto('http://127.0.0.1:8690/pkg/' + s + '/index.html', { waitUntil: 'load', timeout: 60000 });
    await p.waitForTimeout(25000);
    const st = await p.evaluate(() => ({ c: !!document.querySelector('canvas'), u: location.href.slice(0, 60) })).catch(e => ({ err: String(e) }));
    console.log(s, JSON.stringify(st), ((Date.now() - t0) / 1000) + 's', 'errs=' + errs.length, errs.slice(0, 3).join(' | '));
  }
  await b.close(); process.exit(0);
})().catch(e => { console.log('FAIL', e.message); process.exit(1) });
