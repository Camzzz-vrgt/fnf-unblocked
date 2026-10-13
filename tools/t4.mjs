import { chromium } from "playwright-core";
const b = await chromium.launch({ headless: true });
const p = await (await b.newContext()).newPage();
const logs=[];
p.on("console",m=>{if(m.type()==="error")logs.push(m.text().slice(0,140))});
p.on("pageerror",e=>logs.push("PE:"+String(e).slice(0,140)));
await p.goto("http://127.0.0.1:8642/play.html?g=snk-fnf-2hot-bf-mix",{waitUntil:"domcontentloaded"});
await p.waitForTimeout(1200);
await p.click("#gate-play");
await p.waitForTimeout(20000);
const st = await p.evaluate(()=>{
  const f=document.querySelector("iframe"); const w=f&&f.contentWindow; const d=f&&f.contentDocument;
  const c=d&&d.querySelector("canvas");
  let actx=null;
  try{ const AC=w.AudioContext||w.webkitAudioContext; if(w.lime&&w.lime.$defaultApplication){} }catch(e){}
  try{ actx = w.lime && lime.app && lime.app.audio ? lime.app.audio.context.state : "n/a"; }catch(e){ actx="err"; }
  return {src:f.src, docReady:d.readyState, canvas:!!c,
          webgl: c? !!(c.getContext("webgl2")||c.getContext("webgl")||c.getContext("experimental-webgl")) : null,
          twod: c? !!c.getContext("2d") : null,
          actx};
});
console.log(JSON.stringify(st,null,1));
console.log("LOGS:"); logs.slice(0,10).forEach(l=>console.log(" ",l));
await b.close();
