import { chromium } from "playwright-core";
import fs from "node:fs";
const bad = JSON.parse(fs.readFileSync("tools/_badlist_raw.txt","utf8"));
const old = JSON.parse(fs.readFileSync("data/boot-audit.json","utf8"));
const b = await chromium.launch({headless:true, args:["--autoplay-policy=no-user-gesture-required"]});
const W = 2;
await Promise.all(Array.from({length:W}, async (_,w) => {
  const p = await (await b.newContext()).newPage();
  for (let i=w; i<bad.length; i+=W) {
    const slug = bad[i];
    const errs=[]; const h=e=>errs.push(String(e).slice(0,120));
    p.on("pageerror",h);
    try {
      await p.goto(`http://127.0.0.1:8642/games/${slug}/`,{waitUntil:"commit",timeout:20000});
      await p.waitForTimeout(16000);
      const s = await p.evaluate(()=>({c:document.querySelectorAll("canvas").length, lime:typeof lime, u:location.href.includes("about:")?"blank":"ok"})).catch(()=>({}));
      old[slug] = {...s, err: errs[0]||null, retry:2};
    } catch(e) { old[slug] = {navfail:1, err:String(e).slice(0,80), retry:2}; }
    p.off("pageerror",h);
    fs.writeFileSync("data/boot-audit.json", JSON.stringify(old,null,1));
    console.log(slug, JSON.stringify(old[slug]).slice(0,100));
  }
}));
console.log("DONE");
await b.close();
