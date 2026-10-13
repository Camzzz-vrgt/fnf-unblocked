// Test games under w8.snokido.com hostname mapping (host-resolver-rules → local server)
import { chromium } from 'playwright-core';

const slugs = process.argv.slice(2);
const browser = await chromium.launch({ args: ['--host-resolver-rules=MAP w8.snokido.com 127.0.0.1'] });
const ctx = await browser.newContext();
for (const slug of slugs) {
  const page = await ctx.newPage();
  const errs = [], bad = [];
  page.on('pageerror', e => errs.push(String(e).split('\n')[0].slice(0, 120)));
  page.on('response', r => { if (r.status() >= 400) bad.push(r.url().split('/').pop() + ':' + r.status()); });
  page.on('framenavigated', f => { if (f === page.mainFrame() && f.url() === 'about:blank') errs.push('NAV about:blank'); });
  try {
    await page.goto(`http://w8.snokido.com:8642/games/${slug}/`, { timeout: 20000 });
    await page.waitForTimeout(18000);
    const r = await page.evaluate(() => ({
      canvas: document.querySelectorAll('canvas').length,
      lime: typeof lime,
      url: location.href,
    }));
    console.log(`${slug} | canvas=${r.canvas} lime=${r.lime} | errs=${errs.length} | http>=400=${bad.length}`);
    errs.slice(0, 2).forEach(e => console.log('   err:', e));
    bad.slice(0, 3).forEach(b => console.log('   404:', b));
  } catch (e) {
    console.log(`${slug} | LOAD FAIL ${String(e).slice(0, 120)}`);
  }
  await page.close();
}
await browser.close();
