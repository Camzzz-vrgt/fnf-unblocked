// Re-shoot covers for games whose icon is the vanilla FNF logo.
// Waits for the game to pass its warning/title screens (click canvas to focus,
// Enter to advance), takes 3 candidate shots, keeps the richest (largest PNG).
import { chromium } from "playwright-core";
import { readFileSync, writeFileSync, mkdirSync, statSync, unlinkSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const SITE = join(dirname(fileURLToPath(import.meta.url)), "..");
const base = "http://127.0.0.1:8642";
const rawDir = join(SITE, "covers", "raw");
mkdirSync(rawDir, { recursive: true });

const slugs = JSON.parse(readFileSync(join(SITE, "data", "vanilla-logo-slugs.json"), "utf8"));
const only = process.argv[2] ? slugs.filter(s => s.includes(process.argv[2])) : slugs;

for (const slug of only) {
  let browser;
  try {
    browser = await chromium.launch({ headless: true,
      args: ["--autoplay-policy=no-user-gesture-required"] });
    const page = await (await browser.newContext({ viewport: { width: 1280, height: 720 } })).newPage();
    page.setDefaultTimeout(15000);
    await page.goto(`${base}/games/${slug}/`, { waitUntil: "commit", timeout: 25000 });
    // wait for the game canvas, then focus it so keys reach the game
    await page.waitForSelector("canvas", { timeout: 60000 }).catch(() => {});
    await page.waitForTimeout(18000);

    const shots = [];
    const take = async tag => {
      const f = join(rawDir, `.tmp-${slug}-${tag}.png`);
      await page.screenshot({ path: f });
      shots.push(f);
    };
    await take(0);
    for (const tag of [1, 2]) {
      // click canvas to focus, Enter past epilepsy/intro screens
      await page.mouse.click(640, 360).catch(() => {});
      await page.waitForTimeout(400);
      await page.keyboard.press("Enter").catch(() => {});
      await page.waitForTimeout(3500);
      await page.keyboard.press("Enter").catch(() => {});
      await page.waitForTimeout(3500);
      await take(tag);
    }
    // richest frame wins — title art is far more complex than warning text
    let best = shots[0], bestSize = 0;
    for (const f of shots) {
      const s = statSync(f).size;
      if (s > bestSize) { bestSize = s; best = f; }
    }
    for (const f of shots) if (f !== best) unlinkSync(f);
    writeFileSync(join(rawDir, slug + ".png"), readFileSync(best));
    unlinkSync(best);
    console.log("ok", slug, bestSize);
  } catch (e) {
    console.log("FAIL", slug, String(e).slice(0, 100));
  }
  await browser?.close().catch(() => {});
}
console.log("done");
