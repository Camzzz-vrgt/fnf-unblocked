function onPause()
    runTimer('pauseremove', 1.5);
    makeLuaSprite('pausesprite', 'santiagopauseasset', -360, -120); --wow... offsets matter!??!?!
    setScrollFactor('pausesprite', 0, 0);
    addLuaSprite('pausesprite', true);
    setProperty('healthBar.visible', false);
    setProperty('healthBarBG.visible', false);
    setProperty('iconP1.visible', false);
    setProperty('iconP2.visible', false);
    setProperty('playerStrums.visible', false);
    doTweenAlpha('hudalpha', 'camHUD', 0, 0.01, 'linear');
    return Function_Stop;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'pauseremove' then -- Timer completed, delete pause sprite
		removeLuaSprite('pausesprite', true);
        setProperty('healthBar.visible', true);
        setProperty('healthBarBG.visible', true);
        setProperty('iconP1.visible', true);
        setProperty('iconP2.visible', true);
        doTweenAlpha('hudalpha', 'camHUD', 1, 0.01, 'linear');
	end
end