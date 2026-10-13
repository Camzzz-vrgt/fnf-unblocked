function onCreate()
	-- background shit
	makeLuaSprite('Circus di', 'Circus di', -600, -300);
	setLuaSpriteScrollFactor('Circus di', 1.0, 1.0);

	addLuaSprite('Circus di', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end