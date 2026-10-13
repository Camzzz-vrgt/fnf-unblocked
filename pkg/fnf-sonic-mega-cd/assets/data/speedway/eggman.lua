function onCreate()
    makeAnimatedLuaSprite('eggman', 'metallicdouble/eggdude', -1200, 0);
    addAnimationByPrefix('eggman', 'idle', 'eggdude howgayporneffectstheplayboymagazinemonopoly', 12, true)
    scaleObject('eggman', 1.4, 1.4)
    objectPlayAnimation('eggman', 'idle', false)
    doTweenX('eggmangozoom', 'eggman', 1700, 9, 'linear');
    runTimer('eggman1', 20, 1);
    addLuaSprite('eggman', false);
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'eggman1' then
    setProperty("eggman.x", 1700)
    scaleObject('eggman', -1.4, 1.4)
    doTweenX('eggmangozoomback', 'eggman', -1200, 9, 'linear');
    end
end

function onTweenCompleted(tag)
	if tag == 'eggmangozoomback' then
	setProperty("eggman.x", -1200)
	doTweenX('eggmangozoom', 'eggman', 1700, 9, 'linear');
    scaleObject('eggman', 1.4, 1.4)
    runTimer('eggman1', 20, 1);
    end
end

function onUpdate(tag)
	if tag == ('eggmangozoomback') then
    setProperty("eggman.x", -1200)
    doTweenX('eggmangozoom', 'eggman', 1700, 9, 'linear');
    runTimer('eggman1', 20, 1);
end
end