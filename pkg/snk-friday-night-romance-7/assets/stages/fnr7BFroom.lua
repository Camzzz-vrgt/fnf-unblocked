function onCreate()

    -- create: black tv
    makeLuaSprite('ra7-blackTV', 'ra7-black', 200, 680)
    addLuaSprite('ra7-blackTV')
    setLuaSpriteScrollFactor('ra7-blackTV', 0.95, 0.95);
    scaleObject('ra7-blackTV', 0.12, 0.38);
    setObjectOrder('ra7-blackTV', 1)

    makeLuaSprite('ra7-blackTV2', 'ra7-black', 260, 680)
    addLuaSprite('ra7-blackTV2')
    setLuaSpriteScrollFactor('ra7-blackTV2', 0.95, 0.95);
    scaleObject('ra7-blackTV2', 0.12, 0.32);
    setObjectOrder('ra7-blackTV2', 1)



    --background
    makeLuaSprite('back', 'stages/FNR7bfroom', -200, 0);
    setLuaSpriteScrollFactor('back',  0.95, 0.95);
    scaleObject('back', 1, 1);
    addLuaSprite('back', false)

    --bfshadow
    makeLuaSprite('backshadow', 'stages/FNR7bfroomshadow', 1300, 950);
    setLuaSpriteScrollFactor('backshadow',  0.95, 0.95);
    scaleObject('backshadow', 1, 1);
    addLuaSprite('backshadow', false)

    --animatedTV
    makeAnimatedLuaSprite('consoleTV', 'stages/FNR7bfroomTV', 0, 600);
    luaSpriteAddAnimationByPrefix('consoleTV', 'Anim', 'FNR7bfroomconsole', 30, true);
    setLuaSpriteScrollFactor('consoleTV', 0.95, 0.95);
    scaleObject('consoleTV', 0.7, 0.7);
    addLuaSprite('consoleTV', true);
  
    --staticTV
    makeAnimatedLuaSprite('consoleTVs', 'stages/FNR7bfroomTV', 0, 600);
    luaSpriteAddAnimationByPrefix('consoleTVs', 'Anim', 'FNR7bfroomconsole', 0, true);
    setLuaSpriteScrollFactor('consoleTVs', 0.95, 0.95);
    scaleObject('consoleTVs', 0.7, 0.7);
    addLuaSprite('consoleTVs', true);
    setProperty('consoleTVs.alpha', 0)

    --roomlight
    makeAnimatedLuaSprite('roomlights', 'stages/FNR7bfroom-lights', -300, 100);
    luaSpriteAddAnimationByPrefix('roomlights', 'Anim', 'FNR7bfroomlights', 10, true);
    setLuaSpriteScrollFactor('roomlights',  0.95, 0.95);
    scaleObject('roomlights', 2500, 1500);
    addLuaSprite('roomlights', true)
    setProperty('roomlights.alpha', 0.3)

    -- create: black fg
    makeLuaSprite('ra7-blackFG', 'ra7-black', -300, 0)
    addLuaSprite('ra7-blackFG', true)
    scaleObject('ra7-blackFG', 6, 6);
    
    --close(true);

end




function onBeatHit()
end