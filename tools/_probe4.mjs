import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
await p.goto('http://127.0.0.1:8690/games/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(20000);
const r = await p.evaluate(() => {
  const keys = Object.keys(window);
  const haxe = keys.filter(k => /lime|openfl|hxClasses|flixel|funkin|Application/i.test(k));
  const out = { haxe: haxe.slice(0, 40), n: keys.length };
  try {
    const c = window.lime_app_Application?.current || window.$hxClasses && 'has';
    out.hasHx = !!window.$hxClasses;
    out.app = !!window.lime_app_Application;
  } catch (e) { out.err = String(e) }
  return out;
});
console.log(JSON.stringify(r, null, 1).slice(0, 2500));
await b.close(); process.exit(0);
