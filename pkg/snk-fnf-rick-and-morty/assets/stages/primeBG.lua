function onCreate()
	-- background shit
	makeLuaSprite('primeBG', 'primeBG', -600, -300);
	setScrollFactor('primeBG', 1, 1);

	addLuaSprite('primeBG', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

