import { chromium } from "playwright-core";
import fs from "node:fs";
const games = JSON.parse(fs.readFileSync("data/games.json","utf8"));
const slugs = games.filter(g=>g.slug.startsWith("snk-")).map(g=>g.slug);
const old = JSON.parse(fs.readFileSync("data/boot-audit.json","utf8"));
const redo = slugs.filter(s => !old[s] || (old[s].err||"").includes("page.goto") || (old[s].err||"").includes("CONNECTION_REFUSED"));
console.log("retrying", redo.length);
const b = await chromium.launch({headless:true, args:["--autoplay-policy=no-user-gesture-required"]});
const W = 2;
await Promise.all(Array.from({length:W}, async (_,w) => {
  const p = await (await b.newContext()).newPage();
  for (let i=w; i<redo.length; i+=W) {
    const slug = redo[i];
    const errs=[]; const h=e=>errs.push(String(e).slice(0,120));
    p.on("pageerror",h);
    try {
      await p.goto(`http://127.0.0.1:8642/games/${slug}/`,{waitUntil:"commit",timeout:15000});
      await p.waitForTimeout(12000);
      const s = await p.evaluate(()=>({c:document.querySelectorAll("canvas").length, lime:typeof lime, u:location.href.includes("about:")?"blank":"ok"})).catch(()=>({}));
      old[slug] = {...s, err: errs[0]||null};
    } catch(e) { old[slug] = {navfail:1, err:String(e).slice(0,80)}; }
    p.off("pageerror",h);
    fs.writeFileSync("data/boot-audit.json", JSON.stringify(old,null,1));
    console.log(slug, JSON.stringify(old[slug]).slice(0,100));
  }
}));
console.log("DONE");
await b.close();
