import { chromium } from "playwright-core";
const b = await chromium.launch({headless:true,args:["--autoplay-policy=no-user-gesture-required"]});
for(const slug of ["fnf-baddies-nightmare","fnf-cycles-encore","fnf-ben-drowned"]){
  const p=await (await b.newContext()).newPage();
  const errs=[];const f4=[];let ref=0;
  p.on("pageerror",e=>errs.push(String(e).slice(0,80)));
  p.on("response",r=>{if(r.status()>=400)f4.push(r.status()+" "+r.url().slice(-60))});
  p.on("requestfailed",()=>ref++);
  await p.goto(`http://127.0.0.1:8642/games/${slug}/`,{waitUntil:"domcontentloaded",timeout:30000}).catch(e=>errs.push("nav:"+e));
  await p.waitForTimeout(40000);
  await p.keyboard.press("Enter").catch(()=>{});
  await p.waitForTimeout(4000);
  await p.keyboard.press("Enter").catch(()=>{});
  await p.waitForTimeout(3000);
  await p.screenshot({path:`tools/tmp/${slug}.png`});
  console.log(slug,"| errs:",errs.length,"404:",f4.length,"ref:",ref,f4.slice(0,3),errs.slice(0,2));
  await p.close();
}
await b.close();
