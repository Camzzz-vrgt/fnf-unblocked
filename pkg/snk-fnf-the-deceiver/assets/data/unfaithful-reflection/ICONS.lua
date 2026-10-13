function onCreatePost()
	makeAnimatedLuaSprite('gficon', 'icons/girlfraud', 0, 0)
	addAnimationByPrefix('gficon', 'normal', 'normal', 24, true)
	addAnimationByPrefix('gficon', 'loss', 'loss', 24, true)
	addLuaSprite('gficon')
	setObjectCamera('gficon', 'hud')
	setObjectOrder('gficon', getObjectOrder('iconP2'))
	playAnim('gficon', 'normal')
	setProperty('gficon.visible', false)
end

function onBeatHit()
	if curBeat == 132 then
		setProperty('iconP2.visible', false)
		setProperty('gficon.visible', true)
	end
end

function onUpdatePost(elapsed)
	setProperty('gficon.angle', getProperty('iconP2.angle'))
	setProperty('gficon.x', getProperty('iconP2.x'))
	setProperty('gficon.y', getProperty('iconP2.y'))
	setProperty('gficon.scale.x', getProperty('iconP2.scale.x'))
	setProperty('gficon.scale.y', getProperty('iconP2.scale.y'))

	if getProperty('health') > 1.6 then
		playAnim('gficon', 'loss')
	else
		playAnim('gficon', 'normal')
	end
end