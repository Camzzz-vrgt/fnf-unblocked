import { chromium } from "playwright-core";
const b = await chromium.launch({ headless:true, args:["--autoplay-policy=no-user-gesture-required"] });
const p = await (await b.newContext()).newPage();
p.on("pageerror",e=>{console.log("PE:",e.stack?e.stack.split("\n").slice(0,4).join(" | "):"", "\n  msg:", String(e).slice(0,300))});
p.on("console",m=>{if(m.type()==="error")console.log("CE:",m.text().slice(0,200))});
await p.goto("http://127.0.0.1:8642/games/snk-fnf-2hot-bf-mix/",{waitUntil:"domcontentloaded"});
await p.waitForTimeout(25000);
await b.close();
