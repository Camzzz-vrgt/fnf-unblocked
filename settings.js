// Site settings — persisted in localStorage, applied on every page.
// Pages dispatch "fnf-set" on window after changing a value so live
// things (bgm volume, sfx mute) react instantly.
(() => {
  const K = "fnf-set-";
  const get = (k, d) => { try { const v = localStorage.getItem(K + k); return v === null ? d : v; } catch (_) { return d; } };
  const set = (k, v) => {
    try { localStorage.setItem(K + k, String(v)); } catch (_) {}
    dispatchEvent(new Event("fnf-set"));
  };

  const CLOAKS = {
    docs:      { title: "Google Docs",      icon: "https://ssl.gstatic.com/docs/documents/images/kix-favicon7.ico" },
    classroom: { title: "Google Classroom", icon: "https://ssl.gstatic.com/classroom/ic_product_classroom_144.png" },
    gmail:     { title: "Gmail",            icon: "https://ssl.gstatic.com/ui/v1/icons/mail/rfr/gmail.ico" },
  };

  // tab cloak: swap title + favicon so the tab looks like something else.
  // remembers the originals so turning the cloak off restores them.
  let origTitle = null, origIcon = undefined;
  const applyCloak = () => {
    if (origTitle === null) {
      origTitle = document.title;
      const l = document.querySelector("link[rel~='icon']");
      origIcon = l ? l.href : undefined;
    }
    const c = CLOAKS[get("cloak", "")];
    let link = document.querySelector("link[rel~='icon']");
    if (!link) { link = document.createElement("link"); link.rel = "icon"; document.head.appendChild(link); }
    if (c) { document.title = c.title; link.href = c.icon; }
    else {
      document.title = origTitle;
      if (origIcon) link.href = origIcon; else link.remove();
    }
  };

  window.FNFSettings = {
    get, set, applyCloak, CLOAKS,
    bgmOn:  () => get("bgm", "1") === "1",
    bgmVol: () => Math.min(1, Math.max(0, parseFloat(get("bgm-vol", "15")) / 100)),
    sfxOn:  () => get("sfx", "1") === "1",
    sfxVol: () => Math.min(1, Math.max(0, parseFloat(get("sfx-vol", "100")) / 100)),
  };
  applyCloak();
  addEventListener("fnf-set", applyCloak);
})();
