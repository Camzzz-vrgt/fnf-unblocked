function onCreate()
	-- background shit
	makeLuaSprite('stage ground', 'stages/wolfensponge/stage ground', -600, -100);
	setScrollFactor('stage ground', 0.9, 0.9);
	
	makeLuaSprite('grey sky', 'stages/wolfensponge/grey sky', -600, -200);
	setScrollFactor('grey sky', 0.2, 0.2);

	addLuaSprite('grey sky', false);
	addLuaSprite('stage ground', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end