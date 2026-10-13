function onCreate()
	-- background 
	makeAnimatedLuaSprite('castle1', 'levels/castle1', 0, 0);
	addLuaSprite('castle1', false)
	scaleObject('castle1', 9, 9);
	addAnimationByPrefix('castle1', 'idle', 'idle', 7, true);

	makeAnimatedLuaSprite('ToadGuardiaR', 'levels/ToadGuardiaR', 200, 750);
	addLuaSprite('ToadGuardiaR', false)
	scaleObject('ToadGuardiaR', 9, 9);
	addAnimationByPrefix('ToadGuardiaR', 'idle', 'idle', 7, true);

	makeAnimatedLuaSprite('ToadGuardiaA', 'levels/ToadGuardiaA', 1500, 750);
	addLuaSprite('ToadGuardiaA', false)
	scaleObject('ToadGuardiaA', 9, 9);
	addAnimationByPrefix('ToadGuardiaA', 'idle', 'idle', 7, true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end