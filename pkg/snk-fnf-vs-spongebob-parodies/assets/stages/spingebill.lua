function onCreate()
	-- background shit
	makeLuaSprite('spingebill_bg', 'stages/spingebill/spingebill_bg', -1100, -800);
	setScrollFactor('spingebill_bg', 0.7, 0.7);
	
	makeLuaSprite('spingebill_bg_floor', 'stages/spingebill/spingebill_bg_floor', -1100, -800);

	makeLuaSprite('spingebill_bg_lighting', 'stages/spingebill/spingebill_bg_lighting', -1100, -800);

	addLuaSprite('spingebill_bg', false);
	addLuaSprite('spingebill_bg_floor', false);
	addLuaSprite('spingebill_bg_lighting', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end