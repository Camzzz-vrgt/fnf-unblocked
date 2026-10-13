import { chromium } from "playwright-core";
const b = await chromium.launch({ headless:true, args:["--autoplay-policy=no-user-gesture-required"] });
const p = await (await b.newContext()).newPage();
let refused=0;
p.on("requestfailed",r=>{refused++; if(refused<=6)console.log("REFUSED",r.url().slice(-70))});
await p.goto("http://127.0.0.1:8642/games/snk-fnf-2hot-bf-mix/",{waitUntil:"domcontentloaded"});
for(const w of [10000,15000,15000,15000]){
  await p.waitForTimeout(w);
  const s=await p.evaluate(()=>{const c=document.querySelector("canvas");return c?{w:c.width,h:c.height,vis:c.getBoundingClientRect().width}:{none:1}});
  console.log(JSON.stringify(s),"refused:",refused);
}
await p.screenshot({path:"tools/tmp/2hot-fixed.png"});
await b.close();
