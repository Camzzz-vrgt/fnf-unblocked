function onCreate()
	-- background shit
	makeLuaSprite('cara', 'cara', -50, -200);
	setScrollFactor('cara', 1.0, 1.0);
	scaleObject('cara', 1.6, 1.6);
	
	addLuaSprite('cara', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end