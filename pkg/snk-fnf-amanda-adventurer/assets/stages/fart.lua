function onCreate()
	-- background shit
	makeLuaSprite('dark', 'dark', -150, -100);
	setScrollFactor('dark', 0.9, 0.9);

	addLuaSprite('dark', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end