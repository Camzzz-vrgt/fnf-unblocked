import { chromium } from "playwright-core";
import fs from "node:fs";
const games = JSON.parse(fs.readFileSync("data/games.json","utf8"));
const slugs = games.filter(g=>g.slug.startsWith("snk-")).map(g=>g.slug);
const out = {};
const b = await chromium.launch({headless:true, args:["--autoplay-policy=no-user-gesture-required"]});
const W = 6;
await Promise.all(Array.from({length:W}, async (_,w) => {
  const p = await (await b.newContext()).newPage();
  for (let i=w; i<slugs.length; i+=W) {
    const slug = slugs[i];
    const errs=[];
    const h = (e)=>errs.push(String(e).slice(0,120));
    p.on("pageerror",h);
    try {
      await p.goto(`http://127.0.0.1:8642/games/${slug}/`,{waitUntil:"commit",timeout:15000});
      await p.waitForTimeout(12000);
      const s = await p.evaluate(()=>({c:document.querySelectorAll("canvas").length, lime:typeof lime, u:location.href.includes("about:")?"blank":"ok"})).catch(()=>({}));
      out[slug] = {...s, err: errs[0]||null};
    } catch(e) { out[slug] = {navfail:1, err:String(e).slice(0,80)}; }
    p.off("pageerror",h);
    console.log(slug, JSON.stringify(out[slug]).slice(0,110));
    fs.writeFileSync("data/boot-audit.json", JSON.stringify(out,null,1));
  }
}));
console.log("DONE", Object.keys(out).length);
await b.close();
