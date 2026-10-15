import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await b.newPage();
await p.goto('http://127.0.0.1:8690/games/friday-night-funkin/index.html', { waitUntil: 'load', timeout: 60000 });
await p.waitForTimeout(20000);
const r = await p.evaluate(() => {
  const out = {};
  try {
    const app = window.lime?.app?.Application?.current;
    const pre = app && (app.__preloader || app.preloader);
    if (pre) {
      out.preKeys = Object.keys(pre).slice(0, 40);
      out.loaded = pre.loaded; out.total = pre.total;
      out.loadedLibraries = pre.loadedLibraries; out.totalLibraries = pre.totalLibraries;
      if (pre.loadedAssetNames || pre._loadedAssetNames) out.assets = 'hasNames';
    } else out.noPre = Object.keys(window.lime || {});
    // enumerate openfl/lime asset cache state
    const A = window.openfl?.utils?.Assets || window.lime?.utils?.Assets;
    if (A) out.libs = Object.keys(A.libraries?.h || A.cache?.h || {});
  } catch (e) { out.err = String(e); }
  return out;
});
console.log(JSON.stringify(r, null, 1).slice(0, 3000));
await b.close(); process.exit(0);
