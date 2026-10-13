import { chromium } from "playwright-core";
const b = await chromium.launch({headless:true,args:["--autoplay-policy=no-user-gesture-required"]});
for(const slug of ["snk-fnf-vs-brazilian-miku","snk-fnf-another-friday-night"]){
  const p=await (await b.newContext()).newPage();
  const errs=[];const f4=[];
  p.on("pageerror",e=>errs.push(String(e).slice(0,100)));
  p.on("response",r=>{if(r.status()>=400)f4.push(r.status()+" "+r.url().slice(-60))});
  await p.goto(`http://127.0.0.1:8642/games/${slug}/`,{waitUntil:"domcontentloaded",timeout:20000}).catch(e=>errs.push("nav"));
  await p.waitForTimeout(18000);
  const st=await p.evaluate(()=>({url:location.href.slice(-50),canvas:document.querySelectorAll("canvas").length,lime:typeof window.lime}));
  console.log(slug,JSON.stringify(st),"errs:",errs.slice(0,3),"404:",f4.slice(0,3));
  await p.close();
}
await b.close();
