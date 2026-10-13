function onCreate()
    if not lowQuality then--lmao a 109 frames animated bg
        makeAnimatedLuaSprite('binary unlike kit', 'stages/gif_BG3_codes', 25, 100);--nb rights slayyyy
        setLuaSpriteScrollFactor('binary unlike kit',  0.95, 0.95);
        scaleObject('binary unlike kit', 2.5, 2.5);
        setProperty('binary unlike kit.antialiasing', false);

        addLuaSprite('binary unlike kit', false);
        luaSpriteAddAnimationByPrefix('binary unlike kit', 'Anim', 'codes_brokenbg', 30, true);
        close(true);
    else--maluma baby
        makeLuaSprite('noQuality', 'stages/gif_BG3_noQualitycodes', 25, 100);
        setLuaSpriteScrollFactor('noQuality',  0.95, 0.95);
        scaleObject('noQuality', 2.5, 2.5);
        setProperty('noQuality.antialiasing', false);

        addLuaSprite('noQuality', false);
        close(true);
    end
end