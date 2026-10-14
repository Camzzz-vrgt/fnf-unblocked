// Verify host-locked games boot past the deny screen via the real blob-launch path
import { chromium } from 'playwright-core';

const SHA = '84478abb3eefb1da21bc9d4baf8c334f62099ec2';
const CDN = `https://rawcdn.githack.com/Camzzz-vrgt/fnf-unblocked/${SHA}/`;
const slugs = process.argv.slice(2);

const browser = await chromium.launch();
const ctx = await browser.newContext();
for (const slug of slugs) {
  const page = await ctx.newPage();
  const errs = [];
  page.on('pageerror', e => errs.push(String(e).split('\n')[0].slice(0, 140)));
  page.on('console', m => { if (m.type() === 'error') errs.push('con:' + m.text().slice(0, 140)); });
  try {
    const idx = await (await fetch(`${CDN}pkg/${slug}/index.html`)).text();
    const base = `<base href="${CDN}pkg/${slug}/">`;
    const html = /<base[^>]*>/i.test(idx)
      ? idx.replace(/<base[^>]*>/i, base)
      : idx.replace(/<head[^>]*>/i, m => m + base);
    await page.goto('about:blank');
    await page.evaluate(h => { document.open(); document.write(h); document.close(); }, html);
    await page.waitForTimeout(25000);
    const r = await page.evaluate(() => ({
      canvas: document.querySelectorAll('canvas').length,
      denied: /Snokido exclusive|only playable/i.test(document.body.innerText || ''),
      text: (document.body.innerText || '').slice(0, 100).replace(/\n/g, ' '),
    }));
    console.log(`${slug} | canvas=${r.canvas} denied=${r.denied} | errs=${errs.length} | "${r.text}"`);
    errs.slice(0, 3).forEach(e => console.log('   err:', e));
    await page.screenshot({ path: `shot-lock-${slug}.png` });
  } catch (e) {
    console.log(`${slug} | FAIL ${String(e).slice(0, 140)}`);
  }
  await page.close();
}
await browser.close();
