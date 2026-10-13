// Menu sound effects — hover ticks + confirm sting, FNF style.
// Autoplay-safe: sounds triggered before the first real click get blocked by
// the browser, which conveniently means the page stays silent until touched.
// Enabled/volume come from settings.js (FNFSettings).
(() => {
  const S = (n, v) => { const a = new Audio("assets/sfx/" + n); a._v = v; return a; };
  const hovers = [S("hover1.ogg", 0.5), S("hover2.ogg", 0.5), S("hover3.ogg", 0.5)];
  const confirm = S("confirmMenu.ogg", 0.9);
  const select = S("CS_select.ogg", 0.7);
  const typing = S("clickText.ogg", 0.6);
  const locked = S("CS_locked.ogg", 0.8);
  const onSfx = S("CS_confirm.ogg", 0.8);
  window.__sfx = { hovers, confirm, select, typing, locked, onSfx };
  let hi = 0, lastEl = null;

  const play = a => {
    const c = window.FNFSettings;
    if (c && !c.sfxOn()) return;
    a.volume = a._v * (c ? c.sfxVol() : 1);
    a.currentTime = 0;
    a.play().catch(() => {});
  };

  // tick when the cursor moves onto a card/link/button — cycles the 3 hover sfx
  addEventListener("mouseover", e => {
    const t = e.target.closest("a, button");
    if (!t || t === lastEl) return;
    lastEl = t;
    play(hovers[hi]);
    hi = (hi + 1) % hovers.length;
  });
  addEventListener("mouseout", e => {
    if (e.target.closest("a, button") === lastEl &&
        !(e.relatedTarget && e.relatedTarget.closest && e.relatedTarget.closest("a, button"))) {
      lastEl = null;
    }
  });

  // text-input tick — clickText while typing, like FNF's name entry
  addEventListener("keydown", e => {
    const t = e.target;
    if (t && (t.tagName === "INPUT" || t.tagName === "TEXTAREA") &&
        t.type !== "checkbox" && t.type !== "range") {
      play(typing);
    }
  });

  // confirm sting on activating anything clickable; light tick for back
  addEventListener("pointerdown", e => {
    const t = e.target.closest("a, button");
    if (!t) return;
    play(t.classList.contains("back") ? select : confirm);
  });

  // settings toggles — deny buzz when turning off, confirm when turning on;
  // light tick for select/slider changes (on release, not per-pixel)
  addEventListener("change", e => {
    const t = e.target;
    if (!t || !t.matches) return;
    if (t.type === "checkbox") play(t.checked ? onSfx : locked);
    else if (t.matches("select, input[type=range]")) play(select);
  });

  // navigation is in-place (nav.js) — the page never unloads, so stings play
  // out fully across transitions. No delay needed.
})();
