function onCreate()
	-- background shit
	makeLuaSprite('amanda', 'amanda', -150, -100);
	setScrollFactor('amanda', 0.9, 0.9);

	addLuaSprite('amanda', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end