import { chromium } from "playwright-core";
const b = await chromium.launch({ headless:true, args:["--autoplay-policy=no-user-gesture-required"] });
const p = await (await b.newContext()).newPage();
await p.addInitScript(()=>{
  window.__errs=[];
  window.addEventListener("unhandledrejection",e=>{__errs.push("rej:"+JSON.stringify(e.reason).slice(0,200))});
  const oe=window.onerror;
  window.onerror=(m,s,l,c,err)=>{__errs.push("err:"+m+" @"+(s||"").slice(-40)+":"+l+" "+(err&&err.stack||"").split("\n").slice(0,3).join("|"));};
});
p.on("response",r=>{if(r.status()>=400)console.log("HTTP",r.status(),r.url().slice(-90))});
await p.goto("http://127.0.0.1:8642/games/snk-fnf-2hot-bf-mix/",{waitUntil:"domcontentloaded"});
await p.waitForTimeout(30000);
const errs=await p.evaluate(()=>window.__errs||[]);
console.log("collected:",errs.slice(0,8));
await b.close();
