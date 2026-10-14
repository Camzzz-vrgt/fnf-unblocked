const {chromium}=require('playwright-core');
(async()=>{
const b=await chromium.launch({args:['--disable-blink-features=AutomationControlled','--host-resolver-rules=MAP faketest.local 127.0.0.1']});
const p=await (await b.newContext()).newPage();
await p.addInitScript(()=>{
  const L=(n,v)=>console.log('NAVTRAP '+n+': '+String(v).slice(0,150));
  try{window.open=function(){L('window.open',arguments[0]+' '+arguments[1]);return null}}catch(e){}
  try{window.close=function(){L('window.close','');}}catch(e){}
  try{history.back=function(){L('history.back','')}}catch(e){}
  try{history.go=function(){L('history.go','')}}catch(e){}
  try{document.open=function(){L('document.open','')};document.write=function(){L('document.write','')};document.writeln=function(){L('document.writeln','')}}catch(e){}
  try{HTMLFormElement.prototype.submit=function(){L('form.submit',this.action)}}catch(e){}
  try{HTMLFormElement.prototype.requestSubmit=function(){L('form.requestSubmit',this.action)}}catch(e){}
  const oc=HTMLAnchorElement.prototype.click;
  try{HTMLAnchorElement.prototype.click=function(){L('a.click',this.href);return oc.apply(this,arguments)}}catch(e){}
  // location.assign/replace might be on Location.prototype
  for(const n of ['assign','replace','reload']){
    try{const d=Object.getOwnPropertyDescriptor(Location.prototype,n);
      if(d&&d.writable!==false){const o=Location.prototype[n];
        Location.prototype[n]=function(){L('location.'+n,arguments[0]);debugger;return o.apply(this,arguments)};
        console.log('NAVTRAP wrapped location.'+n)}
      else console.log('NAVTRAP location.'+n+' not wrappable',JSON.stringify(d&&d.writable))}catch(e){console.log('NAVTRAP location.'+n+' err '+e.message)}}
});
p.on('console',m=>{const t=m.text();if(t.startsWith('NAVTRAP'))console.log(t)});
p.on('framenavigated',f=>{if(f===p.mainFrame())console.log('NAV->',f.url().slice(0,80))});
await p.goto('http://faketest.local:8690/pkg/snk-fnf-animania/index.html',{waitUntil:'domcontentloaded',timeout:60000}).catch(e=>console.log('goto',e.message));
await p.waitForTimeout(15000);
console.log('final:',p.url().slice(0,60));
await b.close();
process.exit(0)})();
