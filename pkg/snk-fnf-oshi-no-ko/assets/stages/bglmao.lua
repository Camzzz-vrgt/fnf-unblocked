function onCreate()

	makeAnimatedLuaSprite('animate','bglmao',100, 100)addAnimationByPrefix('animate','bglmao','bglmao',12,true)
        objectPlayAnimation('animate','bglmao',false)
        setScrollFactor('animate', 0.9, 0.9);

        addLuaSprite('animate', false);
end

     function onBeatHit()
     if curBeat == 2 then 
     makeLuaText('xd', 'demo build', 200, 50, 675);
     setTextSize('xd', 25)
     addLuaText('xd', true);
     end
     if curBeat == 232 then
     removeLuaText('xd')
     doTweenZoom('asf', 'camGame', 0.7, 1.5, 'cubeOut')
     cameraFlash(HUD, 'FF0000', 3,true)
     setProperty('scoreTxt.alpha', 0)
     setProperty('iconP1.alpha', 0)
     setProperty('iconP2.alpha', 0)
     setProperty('healthBar.alpha', 0)
     setProperty('healthBarBG.alpha', 0)
     end
     if curbeat ==  262 then
     setProperty('scoreTxt.alpha', 1)
     setProperty('iconP1.alpha', 1)
     setProperty('iconP2.alpha', 1)
     setProperty('healthBar.alpha', 1)
     setProperty('healthBarBG.alpha', 1)
     end
end