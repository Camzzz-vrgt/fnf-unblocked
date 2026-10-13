import { chromium } from "playwright-core";
const b = await chromium.launch({headless:true,args:["--autoplay-policy=no-user-gesture-required"]});
const p=await (await b.newContext()).newPage();
await p.setViewportSize({width:1280,height:720});
await p.goto("http://127.0.0.1:8642/games/fnf-ben-drowned/",{waitUntil:"domcontentloaded",timeout:30000});
await p.locator("canvas").first().waitFor({timeout:30000}).catch(()=>{});
await p.waitForTimeout(20000);
// click the canvas to focus it, THEN press enter
await p.mouse.click(640,360);
await p.waitForTimeout(1000);
for(let i=0;i<4;i++){
  await p.keyboard.press("Enter");
  await p.waitForTimeout(5000);
  const sz=(await p.screenshot()).length;
  console.log("shot",i,"~"+Math.round(sz/1024)+"KB");
}
await p.screenshot({path:"tools/tmp/ben-final.png"});
await b.close();
