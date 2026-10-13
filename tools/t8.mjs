import { chromium } from "playwright-core";
const exe="C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe";
const b = await chromium.launch({ headless:false, executablePath:exe, args:["--autoplay-policy=no-user-gesture-required","--window-position=2000,100"] });
const p = await (await b.newContext()).newPage();
let refused=0; p.on("requestfailed",()=>refused++);
await p.goto("http://127.0.0.1:8642/play.html?g=snk-fnf-2hot-bf-mix",{waitUntil:"domcontentloaded"});
await p.waitForTimeout(1500);
await p.click("#gate-play");
for(const w of [15000,15000,15000]){await p.waitForTimeout(w);
  const s=await p.evaluate(()=>{const d=document.querySelector("iframe").contentDocument;const c=d&&d.querySelector("canvas");return c?1:0});
  console.log("canvas:",s,"refused:",refused);}
await p.screenshot({path:"tools/tmp/2hot-edge.png"});
await b.close();
