const fs=require('fs');
const src=fs.readFileSync('pkg/friday-night-funkin/Funkin.js.bak','utf8');
// show processQueue def + requestLimit + queue add/drain sites
let i=src.indexOf('processQueue: function');
console.log('processQueue @'+i);
console.log(src.slice(i,i+900).replace(/\s+/g,' '));
i=src.indexOf('requestLimit');
console.log('--- requestLimit @'+i);
console.log(src.slice(i-200,i+200).replace(/\s+/g,' '));
// the load() backend fn that issues XHR
i=src.indexOf(',load: function(uri,progress,readyStateChange');
if(i<0)i=src.indexOf('load: function(uri,progress');
console.log('--- backend load @'+i);
console.log(src.slice(i,i+1500).replace(/\s+/g,' '));
