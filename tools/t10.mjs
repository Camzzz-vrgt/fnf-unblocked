import { chromium } from "playwright-core";
const b = await chromium.launch({ headless:true, args:["--autoplay-policy=no-user-gesture-required"] });
const p = await (await b.newContext()).newPage();
const errs=[]; p.on("pageerror",e=>errs.push(String(e).slice(0,90)));
await p.goto("http://127.0.0.1:8642/games/snk-fnf-2hot-bf-mix/",{waitUntil:"domcontentloaded"});
for(let i=1;i<=15;i++){
  await p.waitForTimeout(10000);
  const s=await p.evaluate(()=>{
    try{
      const app=window.lime&&lime.app&&lime.app.current;
      const stage=app&&app.stage;
      let pre=null;
      if(stage&&stage.stageChildren){for(let i=0;i<stage.stageChildren.length;i++){const c=stage.stageChildren.get(i); if(c&&c.__class__&&/Preloader/.test(c.__class__.__name__))pre={p:c.percent!=null?c.percent:"?"};}}
      return {app:!!app,pre,children:stage?stage.stageChildren.length:0};
    }catch(e){return {e:String(e).slice(0,80)}}});
  console.log(i*10+"s",JSON.stringify(s),"errs:",errs.length);
  if(s.app&&!s.pre)break;
}
await p.screenshot({path:"tools/tmp/2hot-final.png"});
console.log("errors:",errs.slice(0,6));
await b.close();
