function onCreate()
    makeLuaSprite('back', 'stages/gif_BG2_background', -200, 0);
    setLuaSpriteScrollFactor('back',  0.95, 0.95);
    scaleObject('back', 6, 6);
    setProperty('back.antialiasing', false);
    addLuaSprite('back', false)

    makeLuaSprite('chairs', 'stages/gif_BG2_foreground', -200, 60);
    setLuaSpriteScrollFactor('chairs', 0.95, 0.95);
    scaleObject('chairs', 6, 6);
    setProperty('chairs.antialiasing', false);
    addLuaSprite('chairs', true);
    close(true);

end