function onCreate()
	-- background shit
	makeLuaSprite('elasticBG', 'elasticBG', -600, -300);
	setScrollFactor('elasticBG', 1, 1);

	addLuaSprite('elasticBG', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

