local stop1 = false
local stop2 = false

precacheImage('XenoTaunt')

function onCreate()
	makeLuaSprite('XenoTaunt', 'XenoTaunt', 300, 490)
	setProperty('XenoTaunt.antialiasing', false)
	scaleObject('XenoTaunt', 4, 4)
	addLuaSprite('XenoTaunt', false)
	setProperty('XenoTaunt.alpha', 0)
	setBlendMode('XenoTaunt', 'add')
	setObjectOrder('XenoTaunt', getObjectOrder('dadGroup')+6)
	
	makeLuaSprite('XenoTauntFlip', 'XenoTaunt', 520, 490)
	setProperty('XenoTauntFlip.antialiasing', false)
	scaleObject('XenoTauntFlip', 4, 4)
	addLuaSprite('XenoTauntFlip', false)
	setProperty('XenoTauntFlip.alpha', 0)
	setBlendMode('XenoTauntFlip', 'add')
	setObjectOrder('XenoTauntFlip', getObjectOrder('dadGroup')+6)
	setProperty('XenoTauntFlip.flipX', true)
end


function onEvent(name,value1,value2)
	if name == 'floatyboys' then
		if value1 == 'spook1' then
			setProperty('XenoTaunt.x', 100)
			doTweenX('spookie1', 'XenoTaunt', 300, 0.4, 'quintInOut')
			doTweenAlpha('alpha1', 'XenoTaunt', 0.75, 0.2, 'quintInOut')
			stop1 = true
		end
		if value1 == 'spook2' then
			setProperty('XenoTauntFlip.x', 720)
			doTweenX('spookie2', 'XenoTauntFlip', 520, 0.4, 'quintInOut')
			doTweenAlpha('alpha2', 'XenoTauntFlip', 0.75, 0.2, 'quintInOut')
		end
	end
end

function onTweenCompleted(tag, elapsed)
	if tag == 'alpha1' then
		doTweenAlpha('alpha2', 'XenoTaunt', 0, 0.2, 'quintInOut')
	end
	
	if tag == 'alpha2' then
		doTweenAlpha('alpha4', 'XenoTauntFlip', 0, 0.2, 'quintInOut')
	end
end