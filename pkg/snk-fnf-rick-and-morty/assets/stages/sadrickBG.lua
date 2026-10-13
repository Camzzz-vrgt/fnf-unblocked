function onCreate()
	-- background shit
	makeLuaSprite('sadrickBG', 'sadrickBG', -600, -300);
	setScrollFactor('sadrickBG', 1, 1);

	addLuaSprite('sadrickBG', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

