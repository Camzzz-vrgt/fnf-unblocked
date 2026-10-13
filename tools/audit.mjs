import { chromium } from "playwright-core";
import fs from "fs";
const base="http://127.0.0.1:8642";
const games=JSON.parse(fs.readFileSync("data/games.json","utf8")).map(g=>g.slug).filter(s=>s.startsWith("snk-"));
const results={};
const b=await chromium.launch({headless:true,args:["--autoplay-policy=no-user-gesture-required"]});
const ctx=await b.newContext();
async function test(slug){
  const p=await ctx.newPage();
  const r={f404:[],refused:0,errs:0,canvas:false};
  p.on("response",x=>{if(x.status()>=400)r.f404.push(x.status()+" "+x.url().split("8642")[1].slice(-70))});
  p.on("requestfailed",()=>r.refused++);
  p.on("pageerror",()=>r.errs++);
  try{
    await p.goto(`${base}/games/${slug}/`,{waitUntil:"domcontentloaded",timeout:20000});
    try{await p.locator("canvas").first().waitFor({timeout:15000});r.canvas=true;}catch{}
    await p.waitForTimeout(4000);
    r.url=p.url();
  }catch(e){r.nav=String(e).slice(0,80)}
  await p.close();
  results[slug]=r;
  console.log(slug,"canvas:"+r.canvas,"404:"+r.f404.length,"ref:"+r.refused,"err:"+r.errs);
}
const CONC=4;
for(let i=0;i<games.length;i+=CONC){
  await Promise.all(games.slice(i,i+CONC).map(test));
  fs.writeFileSync("tools/tmp/audit.json",JSON.stringify(results,null,1));
}
console.log("DONE",Object.keys(results).length);
await b.close();
