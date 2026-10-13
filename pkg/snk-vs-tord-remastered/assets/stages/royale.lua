function onCreate()
	-- background shit
	makeLuaSprite('tordback', 'tordback', -630, -300);
	setScrollFactor('tordback', 0.9, 0.9);
    addLuaSprite('tordback', false);

    makeLuaSprite('Z', 'zero', 0, -1000);
    addLuaSprite('Z', false);
    scaleObject('Z', .2, .2);

    makeLuaSprite('F', 'fade', -900, -400);
    addLuaSprite('F', true);
	setProperty('F.alpha', 0);
    scaleObject('F', 9, 9);
   
    makeLuaSprite('N', 'ninja', -1000, -480);
    addLuaSprite('N', true);
    scaleObject('N', .9, .9);
	setProperty('N.alpha', 0);

    makeLuaSprite('S', 'Storm', -200, 300);
    addLuaSprite('S', true);
    scaleObject('S', 3, 3);
	setProperty('S.alpha', 0);
end

function onStepHit()
    if curStep == 831 then
	setProperty('F.alpha', 1); -- Makes the fade effect appear (usheear rfiafioaiofs)
    end
    if curStep == 831 then
	setProperty('S.alpha', 1); -- Makes the fade effect appear (usheear rfiafioaiofs)
    end
    if curStep == 831 then
function onBeatHit()
    health = getProperty('health')
    if getProperty('health') > 0 then
        setProperty('health', health- 0.030);
    end
end
    end
    if curStep == 864 then
		doTweenY('StormY', 'S', 800, 2, 'bounceinout'); -- Makes the base go to side
    end
    if curStep == 1600 then
    health = getProperty('health')
    if getProperty('health') > 0 then
        setProperty('health', health- 0.010);
    end
end
    if curStep == 864 then
		doTweenY('StormY', 'S', 800, 2, 'bounceinout'); -- Makes the base go to side
    end
end