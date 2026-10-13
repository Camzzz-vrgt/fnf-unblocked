function onCreate()
	-- background shit
	makeLuaSprite('bgam', 'bgam', -600, -300);
	setScrollFactor('bgam', 0.9, 0.9);

	addLuaSprite('bgam', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end