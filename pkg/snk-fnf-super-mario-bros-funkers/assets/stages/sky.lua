function onCreate()
	-- background 
	makeAnimatedLuaSprite('lvl32', 'levels/lvl32', 0, 0);
	addLuaSprite('lvl32', false)
	scaleObject('lvl32', 9, 9);
	addAnimationByPrefix('lvl32', 'idle', 'idle', 9, true);

	makeAnimatedLuaSprite('lvl3', 'levels/lvl3', 0, 0);
	addLuaSprite('lvl3', false)
	scaleObject('lvl3', 9, 9);
	addAnimationByPrefix('lvl3', 'idle', 'idle', 7, true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end