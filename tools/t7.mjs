import { chromium } from "playwright-core";
const b = await chromium.launch({ headless:true, args:["--autoplay-policy=no-user-gesture-required"] });
const p = await (await b.newContext()).newPage();
let refused=0; p.on("requestfailed",()=>refused++);
await p.goto("http://127.0.0.1:8642/games/snk-fnf-2hot-bf-mix/",{waitUntil:"domcontentloaded"});
await p.waitForTimeout(90000);
await p.screenshot({path:"tools/tmp/2hot-title.png"});
console.log("refused:",refused);
await b.close();
