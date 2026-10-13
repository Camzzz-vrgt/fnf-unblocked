function onEvent(name,value1,value2)
	if name == 'mensajes' then
        LaY = getRandomInt(50, 500)
        LaX = getRandomInt(91, 1070)
		
		windowName = getRandomInt(1, 1000)
		makeAnimatedLuaSprite(windowName, 'error_popups', LaX, LaY)addAnimationByPrefix(windowName, 'theopen', 'idle', 24, false)
		objectPlayAnimation(windowName, 'theopen', false)
		setProperty( windowName..'.antialiasing', false);
		setObjectCamera(windowName, 'camOther')
		addLuaSprite(windowName, true)
		setProperty(windowName..'.alpha', 0.6)
	end	
end