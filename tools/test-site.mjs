import { chromium } from "playwright-core";

const base = "http://127.0.0.1:8642";
const browser = await chromium.launch({ headless: true });
const page = await (await browser.newContext({
  viewport: { width: 1280, height: 720 },
})).newPage();

page.on("pageerror", (e) => console.log("[pageerror]", String(e).slice(0, 200)));
page.on("response", (r) => { if (r.status() >= 400) console.log(`[${r.status()}]`, r.url().slice(0, 140)); });

await page.goto(base + "/", { waitUntil: "networkidle" });
await page.waitForTimeout(600);
await page.screenshot({ path: "shot-home.png" });
console.log("home shot");

await page.goto(base + "/mods.html", { waitUntil: "networkidle" });
await page.waitForTimeout(800);
await page.screenshot({ path: "shot-mods.png" });
console.log("mods shot,", await page.locator(".card").count(), "cards");

await browser.close();
console.log("done");
