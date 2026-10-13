import { chromium } from "playwright-core";
const b=await chromium.launch({headless:true});
const p=await (await b.newContext()).newPage();
await p.goto("http://127.0.0.1:8642/mods.html");
const r=await p.evaluate(()=>{
  const out={};
  out.wloc=Object.getOwnPropertyDescriptor(window,"location");
  try{Object.defineProperty(window,"location",{value:{hostname:"w8.snokido.com",href:"x"}});out.defProp="ok";}catch(e){out.defProp=String(e).slice(0,80)}
  out.nowHostname=window.location.hostname;
  const o=Object.getOwnPropertyDescriptor(window,"location");
  // try Location.prototype override
  try{
    const orig=Object.getOwnPropertyDescriptor(Location.prototype,"hostname");
    out.locProto=orig;
    Object.defineProperty(Location.prototype,"hostname",{get(){return "w8.snokido.com"}});
    out.spoofed=location.hostname;
  }catch(e){out.protoErr=String(e).slice(0,100)}
  return JSON.stringify(out,null,1).slice(0,1200);
});
console.log(r);
await b.close();
