cx = -400;
cy = -100;

function onCreate()
    local hx = -900 / 4;
    local hy = -400 / 4;
    cx = -900 + hx;
    cy = -400 + hy;

    makeLuaSprite('dark', 'dark', cx, cy)
    --addGlitchEffect('dark', 2, 2)
    setProperty('background.offset.x', hx);
    setProperty('background.offset.y', hy);
    setProperty('background.antialiasing', true);
    setProperty('background.alpha', 3.5);

    makeLuaSprite('rbg', 'dark', cx, cy)
    setProperty('rbg.offset.x', hx);
    setProperty('rbg.offset.y', hy);
    setProperty('rbg.antialiasing', true);

    addLuaSprite('rbg', false) 
    addLuaSprite('background', false) 
    makeLuaSprite('frontground', 'lol', -400, -100)
    addLuaSprite('frontground', false)

    makeLuaSprite('over', '', 0, 0)
    setProperty('over.scale.x', 150);
    setProperty('over.scale.y', 150);
    setProperty('over.alpha', 0.1);
    --setBlendMode('over', 'darken');
    setScrollFactor('over', 0, 0)
    addLuaSprite('over', true)
end
fr = 0
function onUpdate(elapsed)
    fr = fr + elapsed;

    setProperty('background.scale.x', (2 + math.cos(fr) / 4) * 2)
    setProperty('background.scale.y', (2 + math.cos(fr + 1) / 4) * 2)

    setProperty('rbg.scale.x', 2 + math.cos(fr*2) / 2)
    setProperty('rbg.scale.y', 2 + math.cos(fr*2 + 2) / 2)
    setProperty('rbg.angle', math.sin(fr*3) * 8);
    setProperty('rbg.x', cx + math.sin(fr*3) * 200);
    setProperty('rbg.y', cy + math.cos(fr*3) * 200);
end
