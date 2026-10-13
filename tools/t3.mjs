import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await (await b.newContext()).newPage();
const errs=[]; p.on("pageerror",e=>errs.push(String(e).slice(0,100)));
await p.goto("http://127.0.0.1:8642/play.html?g=snk-fnf-2hot-bf-mix",{waitUntil:"domcontentloaded"});
await p.waitForTimeout(1200);
await p.click("#gate-play");
for (const w of [10000,15000,15000,15000]) {
  await p.waitForTimeout(w);
  const st = await p.evaluate(()=>{
    const f=document.querySelector("iframe"); const d=f&&f.contentDocument;
    const c=d&&d.querySelector("canvas");
    if(!c) return {src:f&&f.src, canvas:0};
    let nb=0;
    try{const x=c.getContext("2d"); if(x){const im=x.getImageData(0,0,Math.min(c.width,300),Math.min(c.height,300)).data; for(let i=0;i<im.length;i+=80){if(im[i]+im[i+1]+im[i+2]>30)nb++;}}}catch(e){nb=-1}
    return {w:c.width,h:c.height,nonblack:nb};
  });
  console.log(JSON.stringify(st),"errs:",errs.length);
}
await p.screenshot({path:"tools/tmp/2hot-late.png"});
await b.close();
