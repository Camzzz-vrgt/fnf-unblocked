function onCreate()
	-- background shit
	makeLuaSprite('nightsky', 'nightsky', -970, -270);
	setScrollFactor('nightsky', 1.1, 1.1);
	scaleObject('nightsky', 1.2, 1.2);

	makeLuaSprite('bg', 'bg', -730, -400);
	setScrollFactor('bg', 0.8, 0.8);
	scaleObject('bg', 1.1, 1.1);

	makeLuaSprite('house', 'house', -710, -410);
	setScrollFactor('house', 0.9, 0.9);
	scaleObject('house', 1.1, 1.1);

	makeLuaSprite('sidewalk', 'sidewalk', -600, -540);
	setScrollFactor('sidewalk', 1.0, 1.0);
	scaleObject('sidewalk', 1.2, 1.2);

	addLuaSprite('nightsky', false);
	addLuaSprite('bg', false);
	addLuaSprite('house', false);
	addLuaSprite('sidewalk', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end