#!/usr/bin/env python3
"""Build single-file.html and single-file.svg — the whole site in one file.

Everything external resolves to raw.githubusercontent.com:
  https://rawcdn.githack.com/Camzzz-vrgt/fnf-unblocked/main/<path>

Games whose packages are committed under pkg/<slug>/ (see pack-games.py)
launch by fetching the staged wrapper html, rebasing it onto the CDN pkg
dir, and writing it into a new tab. A fetch/XHR/src shim reassembles
>19MB files that pack-games split into .partNN chunks. Games not in the
repo fall back to GAME_HOST (configurable in settings or localStorage
key fnf-game-host).

  python tools/build-singlefile.py
"""
import io
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
SITE = os.path.dirname(HERE)

CDN = "https://rawcdn.githack.com/Camzzz-vrgt/fnf-unblocked/main/"
GAME_HOST_DEFAULT = "http://127.0.0.1:8642"


def read(name):
    return io.open(os.path.join(SITE, name), encoding="utf-8").read()


def rewrite_js(js):
    """Relative asset/data strings -> CDN-absolute."""
    js = js.replace('"assets/', 'CDN+"assets/')
    js = js.replace("'assets/", "CDN+'assets/")
    js = js.replace('"data/', 'CDN+"data/')
    return js


def rewrite_css(css):
    return re.sub(r'url\(["\']?assets/', 'url("' + CDN + 'assets/', css)


# ---------------------------------------------------------------- markup

HOME = """
  <section id="view-home" class="view">
    <header class="brand">
      <a href="#/credits" data-nav><img src="__CDN__assets/fnf-unblocked.png" alt="Friday Night Funkin'" /></a>
      <a class="by" href="https://gtag.pro/camzzz" target="_blank" rel="noopener">BY CAMZZZ</a>
    </header>
    <a class="settings-fab" href="#/settings" data-nav title="Settings"><img src="__CDN__assets/settings.png" alt="" /></a>
    <main class="menu">
      <a class="menu-col" href="#/play/friday-night-funkin" data-nav>
        <img class="hero-logo" src="__CDN__assets/FNF_logo.webp" alt="Friday Night Funkin'" />
      </a>
      <a class="menu-col" href="#/mods" data-nav>
        <img class="hero-logo" src="__CDN__assets/modstext.png" alt="Mods" />
      </a>
    </main>
    <button id="dl-fab" title="Download the single-file build">DL</button>
    <a class="discord-fab" href="https://discord.gg/kSVynDwX9f" target="_blank" rel="noopener" title="Join the Discord">
      <img src="__CDN__assets/discord.png" alt="Discord" />
    </a>
  </section>
"""

MODS = """
  <section id="view-mods" class="view">
    <header class="topbar">
      <a class="back" href="#/home" data-nav aria-label="Back"></a>
      <img class="topbar-logo" src="__CDN__assets/modstext.png" alt="Mods" />
      <span id="game-count" class="game-count"></span>
      <input id="search" type="search" placeholder="search mods..." autocomplete="off" />
    </header>
    <main id="grid" class="grid" aria-live="polite"></main>
    <p id="empty" class="empty hidden">no mods match that search</p>
  </section>
"""

PLAY = """
  <section id="view-play" class="view">
    <div id="gate">
      <div id="gate-bg"></div>
      <div id="gate-inner">
        <img id="gate-cover" alt="" />
        <div id="gate-name">Loading…</div>
        <button id="gate-play">CLICK TO PLAY</button>
      </div>
    </div>
    <div class="play-fab"><button id="btn-back" class="back" title="Back" aria-label="Back"></button></div>
  </section>
"""

SETTINGS = """
  <section id="view-settings" class="view">
    <header class="topbar">
      <a class="back" href="#/home" data-nav aria-label="Back"></a>
      <span class="topbar-title">Settings</span>
    </header>
    <main class="panel-wrap">
      <section class="panel">
        <h2>Audio</h2>
        <label class="opt"><input type="checkbox" id="set-bgm" /> <span>background music</span></label>
        <label class="opt"><span>music volume</span><input type="range" id="set-bgm-vol" min="0" max="100" /></label>
        <label class="opt"><input type="checkbox" id="set-sfx" /> <span>menu sound effects</span></label>
        <label class="opt"><span>sfx volume</span><input type="range" id="set-sfx-vol" min="0" max="100" /></label>
      </section>
      <section class="panel">
        <h2>Tab Cloaking</h2>
        <p class="hint">disguises this tab's title + icon on every page</p>
        <label class="opt"><span>disguise tab as</span>
          <select id="set-cloak">
            <option value="">off</option>
            <option value="docs">Google Docs</option>
            <option value="classroom">Google Classroom</option>
            <option value="gmail">Gmail</option>
          </select>
        </label>
      </section>
      <section class="panel">
        <h2>Game Host</h2>
        <p class="hint">games not bundled on the cdn load from here instead</p>
        <label class="opt"><span>host url</span>
          <input id="set-host" type="text" placeholder="__GAME_HOST__" style="flex:1;background:var(--bg2);color:var(--ink);border:2px solid rgba(255,255,255,.15);border-radius:8px;padding:6px 10px;font-size:15px" />
        </label>
      </section>
    </main>
  </section>
"""

CREDITS = """
  <section id="view-credits" class="view">
    <header class="topbar">
      <a class="back" href="#/home" data-nav aria-label="Back"></a>
      <span class="topbar-title">Credits</span>
    </header>
    <main class="panel-wrap">
      <section class="panel">
        <h2>Games</h2>
        <div class="credit-row">
          <strong><a href="https://www.snokido.com" target="_blank" rel="noopener">Snokido</a></strong>
          <span>all games &amp; mods</span>
        </div>
      </section>
    </main>
  </section>
"""

DL_MODAL = """
  <div id="dl-modal" class="hidden">
    <div class="dl-card">
      <div class="dl-title">download the site</div>
      <p class="dl-hint">one file — open it anywhere, everything streams from the cdn</p>
      <button class="dl-row" data-dl="single-file.html"><span>single-file.html</span><em>web page</em></button>
      <button class="dl-row" data-dl="single-file.svg"><span>single-file.svg</span><em>svg document</em></button>
      <button id="dl-close">close</button>
    </div>
  </div>
"""

EXTRA_CSS = """
body { display: block; }
.view { display: none; min-height: 100%; }
.view.on { display: block; }
#view-home.on { display: flex; flex-direction: column; min-height: 100vh; }
#dl-fab {
  position: fixed; bottom: 18px; right: 18px; z-index: 15;
  width: 72px; height: 72px; border-radius: 18px;
  font-family: "FNF", sans-serif; font-size: 30px; color: var(--ink);
  background: var(--panel); border: 3px solid #000; cursor: pointer;
  box-shadow: 4px 4px 0 rgba(0,0,0,.5);
  transition: transform .12s ease, box-shadow .12s ease;
}
#dl-fab:hover { transform: translateY(-5px) scale(1.08);
  box-shadow: 4px 8px 0 rgba(0,0,0,.5), 0 0 22px rgba(49,176,209,.7); color: var(--blue); }
#dl-modal {
  position: fixed; inset: 0; z-index: 60;
  background: rgba(10, 6, 18, .8);
  display: flex; align-items: center; justify-content: center;
}
#dl-modal.hidden { display: none; }
.dl-card {
  background: var(--panel); border: 3px solid #000; border-radius: 14px;
  padding: 22px 24px; width: min(92vw, 420px);
  box-shadow: 6px 6px 0 rgba(0,0,0,.45);
  display: flex; flex-direction: column; gap: 10px;
}
.dl-title { font-family: "FNF", sans-serif; font-size: 30px; letter-spacing: 2px;
  text-transform: uppercase; text-shadow: 2px 2px 0 #000; }
.dl-hint { color: var(--dim); font-family: "FNF", sans-serif; font-size: 14px;
  letter-spacing: 1px; margin-bottom: 6px; }
.dl-row {
  display: flex; justify-content: space-between; align-items: baseline; gap: 12px;
  background: var(--bg2); border: 2px solid rgba(255,255,255,.14); border-radius: 10px;
  padding: 12px 14px; cursor: pointer; color: var(--ink);
}
.dl-row span { font-family: "FNF", sans-serif; font-size: 18px; letter-spacing: 1px; }
.dl-row em { color: var(--dim); font-style: normal; font-size: 13px; }
.dl-row:hover { border-color: var(--blue); }
.dl-row:hover span { color: var(--blue); }
#dl-close {
  margin-top: 4px; align-self: flex-end;
  background: var(--panel); border: 2px solid rgba(255,255,255,.14);
  color: var(--ink); border-radius: 8px; padding: 8px 16px;
  font-family: "FNF", sans-serif; font-size: 16px; letter-spacing: 1px;
  cursor: pointer;
}
#dl-close:hover { border-color: var(--pink); color: var(--pink); }
"""

# ------------------------------------------------------------ chunk shim
# Injected at the top of every game doc written by the launcher. Reads
# chunks.json (sync, pre-script), then reassembles .partNN files for
# fetch(), XHR and media/image src=.
CHUNK_SHIM = r"""
(function(){
  var CH;
  try{var x=new XMLHttpRequest();x.open("GET","chunks.json",false);x.send();
      if(x.status>=200&&x.status<300)CH=JSON.parse(x.responseText);}catch(e){}
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
    return key(u)&&CH[key(u)]
      ?blob(u).then(function(b){return new Response(b)})
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
        function fin(ev){self._onreadystatechange&&self._onreadystatechange();
          self._onload&&self._onload({type:"load",target:self})}
        if(rt==="arraybuffer")b.arrayBuffer().then(function(a){
          self.$response=a;self.$responseText="";fin()});
        else if(rt==="blob"){self.$response=b;self.$responseText="";fin()}
        else if(rt==="json")b.text().then(function(t){
          try{self.$response=JSON.parse(t)}catch(e){self.$response=null}
          self.$responseText=t;fin()});
        else b.text().then(function(t){self.$response=t;self.$responseText=t;fin()});
      }).catch(function(e){self.$status=0;
        self._onerror&&self._onerror({type:"error",target:self})})};
  };
  function srcPatch(proto,prop){
    var d=Object.getOwnPropertyDescriptor(proto,prop);
    if(!d||!d.set)return;
    Object.defineProperty(proto,prop,{configurable:true,enumerable:d.enumerable,
      get:d.get?function(){return d.get.call(this)}:undefined,
      set:function(v){var k=key(v);
        if(k&&CH[k]){var t=this;blob(v).then(function(b){
          d.set.call(t,URL.createObjectURL(b))});}
        else d.set.call(this,v)}})}
  srcPatch(HTMLMediaElement.prototype,"src");
  srcPatch(HTMLImageElement.prototype,"src");
})();
"""

# -------------------------------------------------------------- app js

APP_JS = r"""
"use strict";
// CDN + GAME_HOST_DEFAULT are declared by the generator prelude.
const gameHost = () =>
  (window.FNFSettings && FNFSettings.get("game-host", "")) || GAME_HOST_DEFAULT;

/* ---------- hash router ---------- */
const VIEWS = { home:"view-home", mods:"view-mods", play:"view-play",
                settings:"view-settings", credits:"view-credits" };
const TITLES = { home:"FNF", mods:"Browse Mods — FNF", play:"Play — FNF",
                 settings:"Settings — FNF", credits:"Credits — FNF" };
let playSlug = null;

function parseHash() {
  const h = location.hash.replace(/^#\/?/, "");
  const [name, arg] = h.split("/");
  return [VIEWS[name] ? name : "home", arg ? decodeURIComponent(arg) : null];
}
function show(name) {
  for (const id of Object.values(VIEWS))
    document.getElementById(id).classList.remove("on");
  document.getElementById(VIEWS[name]).classList.add("on");
  document.body.className =
    { home:"home", mods:"mods-page", play:"play-page",
      settings:"sub-page", credits:"sub-page" }[name];
  document.title = TITLES[name];
  if (window.FNFSettings) FNFSettings.applyCloak();
  if (name === "mods") ensureGrid();
  if (name === "play" && playSlug) openGate(playSlug);
  const bgm = window.__bgm;
  if (bgm) {
    if (name === "play") bgm.pause();
    else if (window.FNFSettings && FNFSettings.bgmOn() &&
             sessionStorage.getItem("fnf-bgm-on") === "1")
      bgm.play().catch(() => {});
  }
  scrollTo(0, 0);
}
addEventListener("hashchange", () => {
  const [name, arg] = parseHash();
  if (name === "play") playSlug = arg;
  show(name);
});
addEventListener("click", e => {
  const a = e.target.closest("a[data-nav]");
  if (!a) return;
  e.preventDefault();
  location.hash = a.getAttribute("href");
  if (/^#\/play\//.test(location.hash) && window.__bgm) __bgm.pause();
});

/* ---------- mods grid ---------- */
let games = null, repoSet = new Set();
async function ensureGrid() {
  if (games) return;
  const [g, r] = await Promise.all([
    fetch(CDN + "data/games.json").then(r => r.json()).catch(() => []),
    fetch(CDN + "data/repo-games.json").then(r => r.json()).catch(() => []),
  ]);
  games = g; repoSet = new Set(r);
  document.getElementById("game-count").textContent = games.length + " games";
  render(games);
}
function render(list) {
  const grid = document.getElementById("grid");
  const empty = document.getElementById("empty");
  grid.innerHTML = "";
  empty.classList.toggle("hidden", list.length > 0);
  for (const g of list) {
    const a = document.createElement("a");
    a.className = "card" + (g.base ? " card-base" : "");
    a.href = "#/play/" + encodeURIComponent(g.slug);
    a.setAttribute("data-nav", "");
    const art = document.createElement("div");
    art.className = "card-art";
    if (g.cover) {
      const img = document.createElement("img");
      img.src = CDN + g.cover + "?v=4";
      img.alt = ""; img.loading = "lazy";
      img.onerror = () => art.classList.add("no-img");
      art.appendChild(img);
    } else art.classList.add("no-img");
    const span = document.createElement("span");
    span.className = "card-fallback"; span.textContent = g.name;
    art.appendChild(span);
    const label = document.createElement("div");
    label.className = "card-name"; label.textContent = g.name;
    a.append(art, label); grid.appendChild(a);
  }
}
document.addEventListener("input", e => {
  if (e.target.id !== "search" || !games) return;
  const q = e.target.value.trim().toLowerCase();
  render(q ? games.filter(g => g.name.toLowerCase().includes(q)) : games);
});

/* ---------- play gate + launcher ---------- */
function openGate(slug) {
  document.getElementById("gate-name").textContent = "Loading…";
  const g = games && games.find(x => x.slug === slug);
  if (g) {
    document.title = g.name + " — FNF";
    document.getElementById("gate-name").textContent = g.name;
    if (g.cover) {
      document.getElementById("gate-cover").src = CDN + g.cover + "?v=4";
      document.getElementById("gate-bg").style.backgroundImage =
        `url("${CDN}${g.cover}?v=4")`;
    }
  }
}

const SHIM = __SHIM__;

function prepGame(html, slug) {
  const base = `<base href="${CDN}pkg/${slug}/">`;
  if (/<base[^>]*>/i.test(html))
    html = html.replace(/<base[^>]*>/i, base);
  else
    html = html.replace(/<head[^>]*>/i, m => m + base);
  // run the chunk reassembly shim before any game script
  html = html.replace(/<base[^>]*>/i,
    m => m + `<script>${SHIM.replace(/__SLUG__/g, slug).replace(/__CDN__/g, CDN)}<\/script>`);
  // back button closes the game tab (site lives in the opener tab)
  html = html.replace(/back\.href=root\+"mods\.html";/,
                      'back.href="javascript:window.close()";');
  return html;
}

async function launchGame(slug) {
  let w = null;
  try { w = window.open("about:blank", "_blank"); } catch (e) {}
  if (!games) await ensureGrid();
  if (repoSet.has(slug)) {
    try {
      const url = CDN + "games/" + encodeURIComponent(slug) + "/index.html";
      const html = await (await fetch(url)).text();
      const out = prepGame(html, slug);
      const t = w || window;
      t.document.open(); t.document.write(out); t.document.close();
      return;
    } catch (e) { /* fall through to host */ }
  }
  const u = gameHost() + "/games/" + encodeURIComponent(slug) + "/";
  if (w) w.location.href = u; else location.href = u;
}
document.addEventListener("click", e => {
  if (e.target.id === "gate-play" || e.target.id === "gate" ||
      e.target.id === "gate-bg") {
    if (window.__bgm) __bgm.pause();
    launchGame(playSlug || "friday-night-funkin");
  }
  if (e.target.id === "btn-back") location.hash = "#/mods";
});

/* ---------- settings bindings ---------- */
function bind(id, key, val) {
  const el = document.getElementById(id);
  if (!el) return;
  el.value = FNFSettings.get(key, val);
  if (el.type === "checkbox") el.checked = el.value === "1";
  el.addEventListener(el.type === "range" ? "input" : "change", () =>
    FNFSettings.set(key, el.type === "checkbox" ? (el.checked ? "1" : "0")
                                              : el.value));
}

/* ---------- download popup ---------- */
function dl(name) {
  fetch(CDN + name).then(r => r.blob()).then(b => {
    const a = document.createElement("a");
    a.href = URL.createObjectURL(b);
    a.download = name;
    a.click();
    setTimeout(() => URL.revokeObjectURL(a.href), 5000);
  }).catch(() => window.open(CDN + name, "_blank"));
}
document.addEventListener("click", e => {
  const dlBtn = e.target.closest("#dl-fab");
  if (dlBtn) document.getElementById("dl-modal").classList.remove("hidden");
  const row = e.target.closest(".dl-row");
  if (row) dl(row.getAttribute("data-dl"));
  if (e.target.id === "dl-close" || e.target.id === "dl-modal")
    document.getElementById("dl-modal").classList.add("hidden");
});

/* ---------- boot ---------- */
bind("set-bgm", "bgm", "1");
bind("set-bgm-vol", "bgm-vol", "55");
bind("set-sfx", "sfx", "1");
bind("set-sfx-vol", "sfx-vol", "100");
bind("set-cloak", "cloak", "");
bind("set-host", "game-host", "");
{ const [name, arg] = parseHash();
  if (name === "play") playSlug = arg;
  show(name); }
"""

# ---------------------------------------------------------------- build

def build_html():
    css = rewrite_css(read("style.css")) + EXTRA_CSS
    js = "\n".join([
        "const CDN=" + json.dumps(CDN) + ";\n" +
        "const GAME_HOST_DEFAULT=" + json.dumps(GAME_HOST_DEFAULT) + ";",
        rewrite_js(read("settings.js")),
        rewrite_js(read("bgm.js")),
        rewrite_js(read("sfx.js")),
        APP_JS.replace("__SHIM__", json.dumps(CHUNK_SHIM)),
    ])
    markup = (HOME + MODS + PLAY + SETTINGS + CREDITS + DL_MODAL) \
        .replace("__CDN__", CDN).replace("__GAME_HOST__", GAME_HOST_DEFAULT)
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>FNF</title>
  <link rel="icon" type="image/png" href="{CDN}assets/favicon.png" />
  <style>{css}</style>
</head>
<body>
{markup}
<script>
{js}
</script>
</body>
</html>
"""


def build_svg(html):
    """Same app as an .svg document: a foreignObject canvas populated by a
    bootstrap script (svg docs are XML — DOMParser gives us real HTML
    nodes; scripts inside the string are eval'd by hand)."""
    m = re.search(r"<style>(.*?)</style>", html, re.S)
    css = m.group(1)
    b = re.search(r"<body>\s*(.*?)\s*<script>", html, re.S)
    body = b.group(1)
    j = re.search(r"<script>\s*(.*?)\s*</script>\s*</body>", html, re.S)
    js = j.group(1)
    boot = """
var H=%s, C=%s, J=%s, CDN=%s;
var XHTML="http://www.w3.org/1999/xhtml";
/* xml docs create namespace-less elements from createElement — force xhtml
   so img/audio/etc actually render + behave */
var _ce=document.createElement.bind(document);
document.createElement=function(t){return document.createElementNS(XHTML,t)};
window.Image=function(){return document.createElementNS(XHTML,"img")};
window.Audio=function(u){var a=document.createElementNS(XHTML,"audio");
  if(u)a.src=u;return a};
/* ORB blocks no-cors media/font/img loads inside an svg document, so every
   CDN subresource goes through fetch() (cors) -> blob url instead. */
function blobify(u){
  if(typeof u!=="string"||u.indexOf(CDN)!==0)return Promise.resolve(null);
  return fetch(u).then(function(r){return r.blob()})
    .then(function(b){return URL.createObjectURL(b)});
}
function srcPatch(proto,prop){
  var d=Object.getOwnPropertyDescriptor(proto,prop);
  if(!d||!d.set)return;
  Object.defineProperty(proto,prop,{configurable:true,enumerable:d.enumerable,
    get:d.get?function(){return d.get.call(this)}:undefined,
    set:function(v){
      if(typeof v==="string"&&v.indexOf(CDN)===0){
        var t=this;
        blobify(v).then(function(u){if(u)d.set.call(t,u)});
      } else d.set.call(this,v)}})}
srcPatch(HTMLImageElement.prototype,"src");
srcPatch(HTMLMediaElement.prototype,"src");
/* css url() refs -> blob urls, then mount */
var urls=[],re=/url\\("([^"]+)"\\)/g,m;
while((m=re.exec(C)))if(m[1].indexOf(CDN)===0)urls.push(m[1]);
Promise.all(urls.map(function(u){return blobify(u)})).then(function(bs){
  urls.forEach(function(u,i){if(bs[i])C=C.split(u).join(bs[i])});
  var d=new DOMParser().parseFromString(H,"text/html");
  var fo=document.getElementById("fo");
  var head=document.createElementNS("http://www.w3.org/1999/xhtml","head");
  var st=document.createElementNS("http://www.w3.org/1999/xhtml","style");
  st.textContent=C; head.appendChild(st);
  var body=document.createElementNS("http://www.w3.org/1999/xhtml","body");
  while(d.body.firstChild)body.appendChild(d.body.firstChild);
  fo.appendChild(head); fo.appendChild(body);
  if(!document.head)Object.defineProperty(document,"head",{value:head});
  if(!document.body)Object.defineProperty(document,"body",{value:body});
  try{(new Function(J)).call(window)}catch(e){document.title="err:"+e}
});
""" % (json.dumps(body), json.dumps(css), json.dumps(js), json.dumps(CDN))
    return f"""<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" style="position:fixed;inset:0">
<foreignObject id="fo" x="0" y="0" width="100%" height="100%"/>
<script><![CDATA[{boot}]]></script>
</svg>
"""


def main():
    html = build_html()
    with io.open(os.path.join(SITE, "single-file.html"), "w",
                 encoding="utf-8") as f:
        f.write(html)
    with io.open(os.path.join(SITE, "single-file.svg"), "w",
                 encoding="utf-8") as f:
        f.write(build_svg(html))
    print("wrote single-file.html + single-file.svg")


if __name__ == "__main__":
    main()
