import { chromium } from "playwright-core";
import fs from "fs";
const base="http://127.0.0.1:8642";
const slugs=["snk-fnf-another-friday-night","snk-fnf-character-test-playground","snk-fnf-character-test-playground-2","snk-fnf-character-test-playground-3","snk-fnf-character-test-playground-4","snk-fnf-miku-sing-retry-now","snk-fnf-spooky-mix","snk-fnf-vs-brazilian-miku","snk-vs-flippy","snk-fnf-vs-jeffy","snk-vs-oswald","snk-fnf-vs-velma","snk-the-blueballs-incident","snk-friday-night-fever","snk-friday-night-funkin-soft","snk-friday-night-funkin-with-parappa","snk-fnf-skeleton-bros","snk-fnf-web-attack-murder-drones","snk-funkin-at-freddy-vs-afton"];
const b=await chromium.launch({headless:true,args:["--autoplay-policy=no-user-gesture-required"]});
const ctx=await b.newContext();
for(const slug of slugs){
  const p=await ctx.newPage();
  const f4=[],errs=[];let ref=0;
  p.on("response",r=>{if(r.status()>=400)f4.push(r.status()+" "+r.url().split("8642")[1].slice(-65))});
  p.on("requestfailed",()=>ref++);
  p.on("pageerror",e=>errs.push(String(e).slice(0,60)));
  try{
    await p.goto(`${base}/games/${slug}/`,{waitUntil:"domcontentloaded",timeout:20000});
    let c=false;try{await p.locator("canvas").first().waitFor({timeout:15000});c=true}catch{}
    await p.waitForTimeout(4000);
    console.log(slug,"canvas:"+c,"404:"+f4.length,"ref:"+ref,"err:"+errs.length);
    f4.slice(0,4).forEach(f=>console.log("   ",f));
  }catch(e){console.log(slug,"NAV FAIL",String(e).slice(0,70))}
  await p.close();
}
await b.close();
