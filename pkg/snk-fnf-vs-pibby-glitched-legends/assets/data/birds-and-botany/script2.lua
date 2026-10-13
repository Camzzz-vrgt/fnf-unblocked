
function onStepHit()
    if curStep == 446 then
		makeAnimatedLuaSprite('animatedicon', 'icons/peabirdanimated', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('animatedicon', 'normal', 'pea_n instancia ',24, true)
		addAnimationByPrefix('animatedicon', 'losing', 'pea_l instancia ', 24, true)
		addAnimationByPrefix('animatedicon', 'winning', 'pea_w instancia ', 24, true)
		setScrollFactor('animatedicon', 0, 0)
		setObjectCamera('animatedicon', 'other') -- either is under the health bar or nothing
		addLuaSprite('animatedicon', false)
                setObjectOrder('animatedicon', 99)
		objectPlayAnimation('animatedicon', 'normal', false)
        makeAnimatedLuaSprite('survivoranimated','survivors/survivor_chuk',-690, 120)addAnimationByPrefix('survivoranimated','dance','chuk-survivor instancia ',25,true)
        objectPlayAnimation('survivoranimated','dance',true)
        setScrollFactor('survivoranimated', 1, 1);
        addLuaSprite('survivoranimated', false);
        scaleObject('survivoranimated', 1.2, 1.2);
        makeAnimatedLuaSprite('survivoranimated2','survivors/survivor_sunflower',100, 120)addAnimationByPrefix('survivoranimated2','dance','sunflower_s instancia ',25,true)
        objectPlayAnimation('survivoranimated2','dance',true)
        setScrollFactor('survivoranimated2', 1, 1);
        addLuaSprite('survivoranimated2', false);
        scaleObject('survivoranimated2', 1.2, 1.2);

end
end