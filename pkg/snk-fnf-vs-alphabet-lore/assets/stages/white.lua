function onCreate()
	-- background shit
	makeLuaSprite('Z', 'Z', -600, -300);
	setLuaSpriteScrollFactor('Z', 0.9, 0.9);

	addLuaSprite('Z', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end