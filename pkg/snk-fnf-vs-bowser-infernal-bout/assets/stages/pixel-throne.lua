function onCreate()
	-- background shit

	makeAnimatedLuaSprite('bridge','stages/pixel-room/bridge', -1155, -150)
	scaleObject('bridge', 8, 8)
	setProperty('bridge.antialiasing', false)
	--addAnimationByPrefix('bridge','fall','bridge idle',24, false)
	
	addLuaSprite('bridge', false);
	
	close(true);
end