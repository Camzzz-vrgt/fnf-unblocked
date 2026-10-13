
function onStepHit()
    if curStep == 1954 then
		makeAnimatedLuaSprite('animatedicon', 'icons/timiconanimated', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('animatedicon', 'normal', 'tim_n',24, true)
		addAnimationByPrefix('animatedicon', 'losing', 'tim_l', 24, true)
		addAnimationByPrefix('animatedicon', 'winning', 'tim_w', 24, true)
		setScrollFactor('animatedicon', 0, 0)
		setObjectCamera('animatedicon', 'other') -- either is under the health bar or nothing
		addLuaSprite('animatedicon', false)
                setObjectOrder('animatedicon', 99)
		objectPlayAnimation('animatedicon', 'normal', false)
end
end