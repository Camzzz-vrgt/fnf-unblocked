
function onStepHit()
    if curStep == 767 then
		makeAnimatedLuaSprite('animatedicon', 'icons/twinsanimated', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('animatedicon', 'normal', 'dipper_n instancia ',24, true)
		addAnimationByPrefix('animatedicon', 'losing', 'dipper_l instancia ', 24, true)
		addAnimationByPrefix('animatedicon', 'winning', 'dipper_w instancia ', 24, true)
		setScrollFactor('animatedicon', 0, 0)
		setObjectCamera('animatedicon', 'other') -- either is under the health bar or nothing
		addLuaSprite('animatedicon', false)
                setObjectOrder('animatedicon', 99)
		objectPlayAnimation('animatedicon', 'normal', false)


end
end