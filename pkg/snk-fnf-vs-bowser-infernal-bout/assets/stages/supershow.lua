function onCreate()
	-- background shit

	makeLuaSprite('sky', 'stages/supershow stage/sky', -700, -300);
	scaleObject('sky', 1.4, 1.4)

	makeLuaSprite('background', 'stages/supershow stage/background', -700, -300);
	scaleObject('background', 1.4, 1.4)

	makeLuaSprite('ground', 'stages/supershow stage/ground', -700, -300);
	scaleObject('ground', 1.4, 1.4)
	
	addLuaSprite('sky', false);
	addLuaSprite('background', false)
	addLuaSprite('ground', false)
	
	close(true);
end