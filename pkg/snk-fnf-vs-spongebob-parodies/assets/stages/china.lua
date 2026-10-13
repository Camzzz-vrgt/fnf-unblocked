function onCreate()
	-- background shit
	makeLuaSprite('sky', 'stages/china/sky', -770, -450);
	setScrollFactor('sky', 0.7, 0.7);

	makeLuaSprite('dragons', 'stages/china/dragons', -770, -450);
	setScrollFactor('dragons', 0.6, 0.6);

	makeLuaSprite('ground', 'stages/china/ground', -770, -150);
	setScrollFactor('ground', 0.8, 0.8);

	makeLuaSprite('building', 'stages/china/building', -770, -140);
	setScrollFactor('building', 0.9, 0.9);

	makeLuaSprite('road', 'stages/china/road', -770, -90);

	makeLuaSprite('sidewalk', 'stages/china/sidewalk', -770, -90);

	addLuaSprite('sky', false);
	addLuaSprite('dragons', false);
	addLuaSprite('ground', false);
	addLuaSprite('building', false);
	addLuaSprite('road', false);
	addLuaSprite('sidewalk', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end