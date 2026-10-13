// BGM: starts on first click anywhere, loops, keeps position across pages.
// Menus only — never plays on the play page (game audio wins).
// Volume + on/off come from settings.js (FNFSettings).
(() => {
  const audio = new Audio("assets/bgm.mp3");
  window.__bgm = audio;
  audio.loop = true;

  const inGame = () => document.body.classList.contains("play-page");
  const cfg = () => window.FNFSettings;
  const sync = () => {
    audio.volume = cfg() ? cfg().bgmVol() : 0.55;
    if (inGame() || (cfg() && !cfg().bgmOn())) audio.pause();
  };
  sync();
  addEventListener("fnf-set", sync);

  try {
    const t = parseFloat(sessionStorage.getItem("fnf-bgm-t") || "0");
    if (t > 0) audio.currentTime = t;
    if (!inGame() && sessionStorage.getItem("fnf-bgm-on") === "1" &&
        (!cfg() || cfg().bgmOn())) {
      audio.play().catch(() => {});
    }
  } catch (_) {}

  addEventListener("pointerdown", () => {
    if (inGame() || !audio.paused || (cfg() && !cfg().bgmOn())) return;
    audio.play().then(() => {
      try { sessionStorage.setItem("fnf-bgm-on", "1"); } catch (_) {}
    }).catch(() => {});
  });
  addEventListener("beforeunload", () => {
    try { sessionStorage.setItem("fnf-bgm-t", String(audio.currentTime)); } catch (_) {}
  });
})();
