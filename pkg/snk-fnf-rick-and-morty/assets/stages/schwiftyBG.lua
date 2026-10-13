function onCreate()
	-- background shit
	makeLuaSprite('schwiftyBG', 'schwiftyBG', -600, -300);
	setScrollFactor('schwiftyBG', 1, 1);

	addLuaSprite('schwiftyBG', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
