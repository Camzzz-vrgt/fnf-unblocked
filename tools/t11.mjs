import { chromium } from "playwright-core";
const b = await chromium.launch({ headless:true, args:["--autoplay-policy=no-user-gesture-required"] });
const p = await (await b.newContext()).newPage();
const errs=[]; p.on("pageerror",e=>errs.push(String(e).slice(0,90)));
await p.goto("http://127.0.0.1:8642/games/snk-fnf-2hot-bf-mix/",{waitUntil:"domcontentloaded"});
await p.waitForTimeout(20000);
const s=await p.evaluate(()=>{
  const o={};
  o.limeKeys = window.lime?Object.keys(lime).slice(0,30):null;
  o.appKeys = window.lime&&lime.app?Object.keys(lime.app).slice(0,30):null;
  const c=document.querySelector("canvas");
  o.canvasParent = c?{tag:c.parentElement.tagName,id:c.parentElement.id,cls:c.parentElement.className}:null;
  o.cw=c?c.width:0; o.ch=c?c.height:0;
  return o;});
console.log(JSON.stringify(s,null,1)); console.log("errs:",errs);
await b.close();
