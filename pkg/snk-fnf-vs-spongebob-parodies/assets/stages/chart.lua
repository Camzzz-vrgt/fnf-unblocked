function onCreate()
	-- background shit
	makeLuaSprite('chart', 'stages/chart', -800, -300);
	setScrollFactor('chart', 0.9, 0.9);
	scaleObject('chart', 2.0, 2.0);
	
	addLuaSprite('chart', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end