import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
await p.goto('http://127.0.0.1:8690/pkg/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(30000);
const r = await p.evaluate(() => ({
  boom: (window.__boom || []).slice(0, 4),
  pre: (window.__pre || []).length,
  ok: (window.__preOk || []).length,
  err: (window.__preErr || []).slice(0, 5)
}));
console.log('pre=' + r.pre, 'ok=' + r.ok);
console.log('BOOM:', JSON.stringify(r.boom, null, 1).slice(0, 3000));
console.log('ERRS:', JSON.stringify(r.err));
await b.close(); process.exit(0);
