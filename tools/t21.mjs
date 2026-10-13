import { chromium } from "playwright-core";
const b=await chromium.launch({headless:true});
const p=await (await b.newContext()).newPage();
await p.setViewportSize({width:1400,height:900});
await p.goto("http://127.0.0.1:8642/mods.html",{waitUntil:"domcontentloaded"});
await p.waitForSelector('a[href*="play.html"]',{timeout:15000});
await p.waitForTimeout(3000);
await p.screenshot({path:"tools/tmp/mods2.png"});
await b.close();
