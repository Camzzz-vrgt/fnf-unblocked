#!/usr/bin/env python3
"""Inject the chunk-reassembly shim + nav overlay into every
pkg/<slug>/index.html so the page can be navigated to directly on the
CDN (no about:blank/document.write needed).

Shim must run before the game script tag; overlay goes at end of body.
Idempotent — skips pages already patched.

  python tools/inject-pkg-shim.py            all pkg dirs
  python tools/inject-pkg-shim.py <slug...>  specific games
"""
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
SITE = os.path.dirname(HERE)
PKG = os.path.join(SITE, "pkg")
MARK = "/* fnf-cdn-shim */"
OMARK = "fnf-nav-overlay"

SHIM = r"""<script>/* fnf-cdn-shim */
(function(){
  var CH=__CHUNKS__;
  if(!CH)return;
  var PM="/pkg/__SLUG__/";
  function key(u){try{
    var r=new URL(typeof u==="string"?u:(u&&u.url)||"",document.baseURI);
    var i=r.pathname.indexOf(PM);
    return i>=0?decodeURIComponent(r.pathname.slice(i+PM.length)):null;
  }catch(e){return null}}
  function part(u,i){return u+".part"+(i<10?"0":"")+i}
  function blob(u){var n=CH[key(u)],ps=[];
    for(var i=0;i<n;i++)ps.push(fetch(part(u,i)).then(function(r){
      if(!r.ok)throw new Error("part "+r.status);return r.blob()}));
    return Promise.all(ps).then(function(a){return new Blob(a)})}
  var of=window.fetch&&window.fetch.bind(window);
  if(of)window.fetch=function(u,o){
    var k=key(u);
    return k&&CH[k]?blob(u).then(function(b){return new Response(b)})
                   :of(u,o)};
  var X=window.XMLHttpRequest;
  window.XMLHttpRequest=function(){
    var r=new X(),self=this;self._u=null;self._c=false;
    ["onreadystatechange","onload","onloadstart","onloadend","onprogress",
     "onerror","onabort","ontimeout"].forEach(function(ev){
      Object.defineProperty(self,ev,{
        set:function(f){self["_"+ev]=f;
          r[ev]=function(){if(!self._c&&f)f.apply(self,arguments)}},
        get:function(){return self["_"+ev]}})});
    ["status","statusText","readyState","response","responseText",
     "responseXML","upload","timeout","withCredentials","responseType",
     "responseURL"].forEach(function(p){
      Object.defineProperty(self,p,{
        get:function(){return self._c?self["$"+p]:r[p]},
        set:function(v){self["$"+p]=v;
          try{if(p!=="status"&&p!=="statusText"&&p!=="readyState"&&
               p!=="response"&&p!=="responseText"&&p!=="responseXML"&&
               p!=="responseURL")r[p]=v}catch(e){}}})});
    self.open=function(m,u){self._u=u;self._c=!!(key(u)&&CH[key(u)]);
      if(!self._c)r.open.apply(r,arguments)};
    self.setRequestHeader=function(){if(!self._c)
      r.setRequestHeader.apply(r,arguments)};
    self.getResponseHeader=function(){return self._c?null:
      r.getResponseHeader.apply(r,arguments)};
    self.getAllResponseHeaders=function(){return self._c?"":
      r.getAllResponseHeaders.apply(r,arguments)};
    self.abort=function(){if(!self._c)r.abort()};
    self.send=function(){
      if(!self._c)return r.send.apply(r,arguments);
      blob(self._u).then(function(b){
        self.$readyState=4;self.$status=200;self.$statusText="OK";
        var rt=self.$responseType||self.responseType||"";
        function fin(){self._onreadystatechange&&self._onreadystatechange();
          self._onload&&self._onload({type:"load",target:self})}
        if(rt==="arraybuffer")b.arrayBuffer().then(function(a){
          self.$response=a;self.$responseText="";fin()});
        else if(rt==="blob"){self.$response=b;self.$responseText="";fin()}
        else b.text().then(function(t){
          self.$response=self.$responseText=t;fin()});
      }).catch(function(){
        self.$readyState=4;self.$status=404;
        self._onreadystatechange&&self._onreadystatechange();
        self._onerror&&self._onerror({type:"error",target:self})});
    };
    return self;
  };
})();
</script>"""

OVERLAY = r"""<style>
.fnf-nav{position:fixed;top:10px;right:10px;z-index:99999;display:flex;gap:8px}
.fnf-nav button{width:44px;height:44px;border-radius:10px;border:0;cursor:pointer;
  background:rgba(15,12,24,.72);color:#fff;font-size:19px;opacity:.45;
  transition:opacity .15s}
.fnf-nav button:hover{opacity:1}
</style>
<div class="fnf-nav" id="fnf-nav-overlay">
  <button onclick="window.close()" title="Close tab">&#8592;</button>
  <button onclick="(document.fullscreenElement?document.exitFullscreen():document.documentElement.requestFullscreen())()" title="Fullscreen">&#9938;</button>
</div>"""


def inject(path, slug):
    s = io.open(path, encoding="utf-8", errors="replace").read()
    cj = os.path.join(os.path.dirname(path), "chunks.json")
    chunks = io.open(cj, encoding="utf-8").read().strip() \
        if os.path.isfile(cj) else "null"
    shim = SHIM.replace("__SLUG__", slug).replace("__CHUNKS__", chunks)
    if MARK in s:  # replace existing shim block
        s = re.sub(r"<script>/\* fnf-cdn-shim \*/.*?</script>", shim,
                   s, count=1, flags=re.S)
        io.open(path, "w", encoding="utf-8").write(s)
        return True
    if re.search(r"<head[^>]*>", s, re.I):
        s = re.sub(r"(<head[^>]*>)", r"\1\n" + shim, s, count=1,
                   flags=re.I)
    else:
        s = shim + s
    if OMARK not in s:
        if re.search(r"</body>", s, re.I):
            s = re.sub(r"</body>", OVERLAY + "\n</body>", s, count=1,
                       flags=re.I)
        else:
            s += OVERLAY
    io.open(path, "w", encoding="utf-8").write(s)
    return True


def main():
    slugs = sys.argv[1:] or sorted(os.listdir(PKG))
    n = 0
    for slug in slugs:
        p = os.path.join(PKG, slug, "index.html")
        if not os.path.isfile(p):
            print(f"! {slug}: no index.html")
            continue
        if inject(p, slug):
            n += 1
    print(f"patched {n} pkg index.html files")


if __name__ == "__main__":
    main()
