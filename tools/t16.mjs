import { chromium } from "playwright-core";
const b = await chromium.launch({ headless:true });
const p = await (await b.newContext()).newPage();
await p.setViewportSize({width:1400,height:900});
await p.goto("http://127.0.0.1:8642/mods.html",{waitUntil:"domcontentloaded"});
await p.waitForSelector('a[href*="play.html"]',{timeout:15000});
await p.waitForTimeout(2500);
// find oversized elements in the grid
const bad = await p.evaluate(()=>{
  const out=[];
  document.querySelectorAll(".card").forEach(c=>{
    const r=c.getBoundingClientRect();
    if(r.width>420||r.height>420){
      const img=c.querySelector("img");
      out.push({name:c.querySelector(".card-name")?.textContent, w:Math.round(r.width),h:Math.round(r.height), imgW:img?.naturalWidth, imgH:img?.naturalHeight, src:img?.src});
    }
  });
  return out;
});
console.log("oversized cards:",JSON.stringify(bad,null,1));
// any element overlapping grid oddly?
await p.screenshot({path:"tools/tmp/mods.png",fullPage:false});
await b.close();
