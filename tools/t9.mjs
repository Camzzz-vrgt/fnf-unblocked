import { chromium } from "playwright-core";
const exe="C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe";
const b = await chromium.launch({ headless:false, executablePath:exe, args:["--autoplay-policy=no-user-gesture-required","--window-position=2000,100","--window-size=900,700"] });
const p = await (await b.newContext()).newPage();
let pending=new Set(), refused=0;
p.on("request",r=>pending.add(r.url()));
p.on("requestfinished",r=>pending.delete(r.url()));
p.on("requestfailed",r=>{pending.delete(r.url());refused++});
await p.goto("http://127.0.0.1:8642/games/snk-fnf-2hot-bf-mix/",{waitUntil:"domcontentloaded"});
for(const w of [10000,20000,20000]){
  await p.waitForTimeout(w);
  const s=await p.evaluate(()=>{
    const out={};
    try{out.state=window.flixel&&flixel.FlxG&&flixel.FlxG.game&&flixel.FlxG.game._state?flixel.FlxG.game._state.__class__.__name__:"?";}catch(e){out.stateErr=1}
    try{out.lime=typeof lime!=="undefined"; out.stage=!!(lime&&lime.app&&lime.app.current);}catch(e){}
    return out;});
  console.log(JSON.stringify(s),"pend:",pending.size,[...pending].slice(-4).map(u=>u.slice(-50)),"ref:",refused);}
await p.screenshot({path:"tools/tmp/2hot-edge2.png"});
await b.close();
