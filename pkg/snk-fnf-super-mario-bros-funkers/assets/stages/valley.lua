function onCreate()
	-- background 
	makeAnimatedLuaSprite('lvl12', 'levels/lvl12', 0, 0);
	addLuaSprite('lvl12', false)
	scaleObject('lvl12', 9, 9);
	addAnimationByPrefix('lvl12', 'idle', 'idle', 7, true);

	makeAnimatedLuaSprite('lvl1', 'levels/lvl1', 0, 0);
	addLuaSprite('lvl1', false)
	scaleObject('lvl1', 9, 9);
	addAnimationByPrefix('lvl1', 'idle', 'idle', 7, true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end