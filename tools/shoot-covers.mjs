// Boot every game without a catalog cover and screenshot its title screen.
// Raw shots land in covers/raw/<slug>.png — build.py squares them into covers/.
import { chromium } from "playwright-core";
import { readFileSync, existsSync, mkdirSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const SITE = join(dirname(fileURLToPath(import.meta.url)), "..");
const base = "http://127.0.0.1:8642";
const rawDir = join(SITE, "covers", "raw");
mkdirSync(rawDir, { recursive: true });

const games = JSON.parse(readFileSync(join(SITE, "data", "games.json"), "utf8"));
const todo = games.filter(g => !g.base && g.coverSrc !== "catalog" && !existsSync(join(rawDir, g.slug + ".png")));
console.log(`${todo.length} games to shoot`);

// fresh browser per game — PsychEngine builds can peg a renderer and poison
// everything navigated afterwards in the same browser process
for (const g of todo) {
  let browser;
  try {
    browser = await chromium.launch({ headless: true });
    const page = await (await browser.newContext({ viewport: { width: 1280, height: 720 } })).newPage();
    await page.goto(`${base}/games/${g.slug}/`, { waitUntil: "commit", timeout: 20000 });
    // heavy builds sit on the HaxeFlixel preloader for a while — give them a
    // real chance to reach the title screen, then shoot whatever is painted
    await page.waitForTimeout(25000);
    await page.keyboard.press("Enter").catch(() => {});
    await page.waitForTimeout(2000);
    await page.screenshot({ path: join(rawDir, g.slug + ".png") });
    console.log("ok", g.slug);
  } catch (e) {
    console.log("FAIL", g.slug, String(e).slice(0, 100));
  }
  await browser.close().catch(() => {});
}
console.log("done");
