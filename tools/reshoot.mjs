import { chromium } from "playwright-core";
import { writeFileSync } from "node:fs";
const base="http://127.0.0.1:8642";
const slugs=process.argv.slice(2);
for (const slug of slugs){
  let browser;
  try{
    browser=await chromium.launch({headless:true,args:["--autoplay-policy=no-user-gesture-required"]});
    const page=await (await browser.newContext({viewport:{width:1280,height:720}})).newPage();
    await page.goto(`${base}/games/${slug}/`,{waitUntil:"domcontentloaded",timeout:30000});
    await page.locator("canvas").first().waitFor({timeout:30000}).catch(()=>{});
    // let the preloader run through, then walk past warnings/disclaimers
    await page.waitForTimeout(20000);
    await page.mouse.click(640,360); // focus canvas so keys land
    await page.waitForTimeout(1500);
    const shots=[];
    for(let step=0;step<5;step++){
      const buf=await page.screenshot();
      shots.push({buf,score:buf.length+step*8000}); // later + bigger = better
      await page.keyboard.press("Enter").catch(()=>{});
      await page.waitForTimeout(6000);
    }
    shots.sort((a,b)=>b.score-a.score);
    writeFileSync(`covers/raw/${slug}.png`,shots[0].buf);
    console.log(slug,"picked ~"+Math.round(shots[0].buf.length/1024)+"KB");
  }catch(e){console.log("FAIL",slug,String(e).slice(0,100))}
  await browser.close().catch(()=>{});
}
console.log("done");
