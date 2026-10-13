function onCreate()
	-- background shit
	makeLuaSprite('bambi farm', 'bambi farm', -600, -600);
	setScrollFactor('bambi farm', 1.0, 1.0);
	scaleObject('bambi farm', 1.40, 1.40);
	

	addLuaSprite('bambi farm', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end