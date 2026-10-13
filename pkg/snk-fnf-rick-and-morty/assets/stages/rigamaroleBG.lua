function onCreate()
	-- background shit
	makeLuaSprite('rigamaroleBG', 'rigamaroleBG', -600, -300);
	setScrollFactor('rigamaroleBG', 1, 1);

	addLuaSprite('rigamaroleBG', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

