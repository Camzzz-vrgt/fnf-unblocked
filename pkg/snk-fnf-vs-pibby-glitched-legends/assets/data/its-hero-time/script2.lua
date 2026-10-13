
function onStepHit()
    if curStep == 128 then
		makeAnimatedLuaSprite('animatedicon', 'icons/animatedbenicon', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('animatedicon', 'normal', 'ben_n instancia ',24, true)
		addAnimationByPrefix('animatedicon', 'losing', 'ben_l instancia ', 24, true)
		addAnimationByPrefix('animatedicon', 'winning', 'ben_w instancia ', 24, true)
		setScrollFactor('animatedicon', 0, 0)
		setObjectCamera('animatedicon', 'other') -- either is under the health bar or nothing
		addLuaSprite('animatedicon', true)
                setObjectOrder('animatedicon', 99)
		objectPlayAnimation('animatedicon', 'normal', false)

end
end