// nav.js — SPA-style navigation: swaps page content instead of unloading, so
// audio (bgm loop, confirm stings) keeps playing across "page" changes.
(() => {
  if (!window.DOMParser || !window.fetch || !history.pushState) return;

  // external scripts keep a single global instance — inline page scripts get
  // re-run per navigation, wrapped so their const/let don't collide on revisits.
  // Set is refreshed at nav time: scripts after nav.js aren't in the DOM yet
  // when this file first executes.
  const loaded = new Set();
  const snapshot = () => {
    for (const s of document.scripts)
      if (s.src) loaded.add(new URL(s.src).pathname);
  };

  const runScripts = scripts => {
    for (const s of scripts) {
      if (s.src) {
        const src = new URL(s.getAttribute("src"), location.href).pathname;
        if (loaded.has(src)) continue;
        loaded.add(src);
        const el = document.createElement("script");
        el.src = src;
        document.body.appendChild(el);
      } else {
        const el = document.createElement("script");
        el.textContent = "(()=>{" + s.textContent + "\n})()";
        document.body.appendChild(el);
      }
    }
  };

  const go = async (url, push = true) => {
    try {
      const html = await (await fetch(url)).text();
      const doc = new DOMParser().parseFromString(html, "text/html");
      const scripts = [...doc.querySelectorAll("script")]; // grab BEFORE move
      snapshot();
      document.title = doc.title;
      document.body.className = doc.body.className;
      document.body.replaceChildren(...doc.body.childNodes);
      if (push) history.pushState(null, "", url);
      scrollTo(0, 0);
      runScripts(scripts);
      if (window.FNFSettings) FNFSettings.applyCloak();
      // bgm ducks out on the play page (game audio wins), resumes elsewhere
      const bgm = window.__bgm;
      if (bgm) {
        if (document.body.classList.contains("play-page")) bgm.pause();
        else if (window.FNFSettings && FNFSettings.bgmOn() &&
                 sessionStorage.getItem("fnf-bgm-on") === "1") {
          bgm.play().catch(() => {});
        }
      }
    } catch (_) {
      location.href = url; // fetch failed — fall back to a real navigation
    }
  };

  addEventListener("click", e => {
    const a = e.target.closest("a[href]");
    if (!a || a.target === "_blank" || a.hasAttribute("download") ||
        e.defaultPrevented || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey) return;
    const url = new URL(a.href, location.href);
    if (url.origin !== location.origin) return;
    if (url.pathname === location.pathname && url.hash) return; // same-page anchor
    e.preventDefault();
    // cut the music the moment a game is clicked, not after the swap
    if (/play\.html$/.test(url.pathname) && window.__bgm) __bgm.pause();
    go(url.href);
  });

  addEventListener("popstate", () => go(location.href, false));
})();
