function onCreate()
	-- background 
	makeAnimatedLuaSprite('lvl23', 'levels/lvl23', 0, 0);
	addLuaSprite('lvl23', false)
	scaleObject('lvl23', 9, 9);
	addAnimationByPrefix('lvl23', 'idle', 'idle', 3, true);

	makeAnimatedLuaSprite('lvl21', 'levels/lvl21', 0, 0);
	addLuaSprite('lvl21', false)
	scaleObject('lvl21', 9, 9);
	addAnimationByPrefix('lvl21', 'idle', 'idle', 7, true);

	makeAnimatedLuaSprite('lvl24', 'levels/lvl24', 0, 0);
	addLuaSprite('lvl24', true)
	scaleObject('lvl24', 9, 9);
	addAnimationByPrefix('lvl24', 'idle', 'idle', 7, true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end