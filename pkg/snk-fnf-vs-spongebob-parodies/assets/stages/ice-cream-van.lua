function onCreate()
	-- background shit
	makeLuaSprite('bg city', 'stages/ice cream/bg city', -320, 100);
	
	makeLuaSprite('truck inside', 'stages/ice cream/truck inside', -680, 100);

	makeLuaSprite('truck wall', 'stages/ice cream/truck wall', -700, -100);

        makeAnimatedLuaSprite('bfandgf','ice cream/bf_and_gf_truck',-100,230)addAnimationByPrefix('bfandgf','bop','bf and gf',24,true)
        objectPlayAnimation('bfandgf','bop',false)

	addLuaSprite('truck wall', false);
	addLuaSprite('bg city', false);
	addLuaSprite('bfandgf', false);
	addLuaSprite('truck inside', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end