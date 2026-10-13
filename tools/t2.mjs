import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await (await b.newContext()).newPage();
const errs=[]; p.on("pageerror",e=>errs.push(String(e).slice(0,100)));
await p.goto("http://127.0.0.1:8642/play.html?g=snk-fnf-2hot-bf-mix",{waitUntil:"domcontentloaded"});
await p.waitForTimeout(1500);
await p.click("#playGate, .gate, button", {timeout:5000}).catch(async()=>{ await p.mouse.click(640,400); });
await p.waitForTimeout(15000);
const st = await p.evaluate(()=>{
  const f=document.querySelector("iframe");
  const inner=f&&f.contentDocument;
  return {frameSrc:f&&f.src, canvas: inner? inner.querySelectorAll("canvas").length : -1};
});
console.log(JSON.stringify(st),"errs:",errs.slice(0,4));
await p.screenshot({path:"tools/tmp/2hot-play.png"});
await b.close();
