const fs=require('fs');
const src=fs.readFileSync('pkg/snk-fnf-animania/Funkin.js','utf8');
// All methods on the GatePulse object (_0x55eb4b) and on backend_Sk internal (_0x454858)
for(const obj of ['_0x55eb4b','_0x454858']){
  const re=new RegExp(obj.replace(/\$/g,'\\$')+"\\[['\"]([\\w$]+)['\"]\\]\\s*=\\s*function",'g');
  let m;console.log('=== methods on',obj);
  while(m=re.exec(src)){
    const after=src.slice(m.index+m[0].length,m.index+m[0].length+45);
    console.log(' ',m[1],'@',m.index, after.trimStart().startsWith('return')?'[dead]':'[LIVE]');
  }
}
// GatePulse call sites with encoded names: find all backend_GatePulse[...] usages
let i=-1,c=0;
while((i=src.indexOf('backend_GatePulse[',i+1))>=0&&c<20){
  console.log('GP call @'+i, JSON.stringify(src.slice(i,i+120).replace(/\r?\n/g,' ')));
  c++;
}
