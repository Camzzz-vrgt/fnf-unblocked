function onCreate()
	-- background shit

	makeLuaSprite('castle', 'stages/64/bg', -400, 0);
	scaleObject('castle', 3, 3)
	setScrollFactor('castle', 0.5, 0.5)

	makeLuaSprite('floor', 'stages/64/stage', -400, 0);
	scaleObject('floor', 3, 3)
	
	addLuaSprite('castle', false);
	addLuaSprite('floor', false)
	
	close(true);
end