import { chromium } from "playwright-core";

const base = "http://127.0.0.1:8642";
const slugs = process.argv.slice(2);
const browser = await chromium.launch({ headless: true });
const page = await (await browser.newContext()).newPage();

for (const slug of slugs) {
  const errs = [];
  const fails = [];
  const onErr = (e) => errs.push(String(e).slice(0, 150));
  const onResp = (r) => { if (r.status() >= 400) fails.push(`${r.status()} ${r.url().slice(-80)}`); };
  page.on("pageerror", onErr);
  page.on("response", onResp);
  await page.goto(`${base}/games/${slug}/`, { waitUntil: "domcontentloaded" });
  let canvas = false;
  try {
    await page.locator("canvas").first().waitFor({ timeout: 20000 });
    canvas = true;
  } catch {}
  await page.waitForTimeout(8000);
  console.log(`\n== ${slug} | canvas=${canvas} | errs=${errs.length} | http>=400=${fails.length}`);
  errs.slice(0, 3).forEach(e => console.log("  err:", e));
  fails.slice(0, 5).forEach(f => console.log("  fail:", f));
  page.off("pageerror", onErr);
  page.off("response", onResp);
}
await browser.close();
