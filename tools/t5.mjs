import { chromium } from "playwright-core";
const b = await chromium.launch({ headless:true, args:["--autoplay-policy=no-user-gesture-required"] });
const p = await (await b.newContext()).newPage();
let refused=0, f404=0, done=0;
p.on("requestfailed",r=>{refused++; if(refused<=8)console.log("REFUSED",r.url().slice(-70))});
p.on("response",r=>{ if(r.status()>=400){f404++; if(f404<=6)console.log(r.status(),r.url().slice(-70))} });
p.on("requestfinished",()=>done++);
await p.goto("http://127.0.0.1:8642/games/snk-fnf-2hot-bf-mix/",{waitUntil:"domcontentloaded"});
for(let i=0;i<6;i++){await p.waitForTimeout(10000);
  const s=await p.evaluate(()=>{const c=document.querySelector("canvas");return c?{w:c.width,h:c.height}:{none:1}});
  console.log(`${(i+1)*10}s`,JSON.stringify(s),"refused:",refused,"404s:",f404,"done:",done);}
await p.screenshot({path:"tools/tmp/2hot-direct.png"});
await b.close();
