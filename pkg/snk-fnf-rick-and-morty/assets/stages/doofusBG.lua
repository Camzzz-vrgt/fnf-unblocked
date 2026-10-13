function onCreate()
	-- background shit
	makeLuaSprite('doofusBG', 'doofusBG', -600, -300);
	setScrollFactor('doofusBG', 1, 1);

	addLuaSprite('doofusBG', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

