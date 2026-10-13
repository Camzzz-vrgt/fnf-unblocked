function onCreate()
	-- background shit
	makeLuaSprite('space', 'space', -640, -370);
	setScrollFactor('space', 1.3, 1.3);
	scaleObject('space', 1.6, 1.6);

	makeLuaSprite('globe', 'globe', -800, -400);
	setScrollFactor('globe', 0.9, 0.9);
	scaleObject('globe', 1.5, 1.5);

	makeLuaSprite('fast', 'fast', -530, -500);
	setScrollFactor('fast', 0.7, 0.7);
	scaleObject('fast', 1.5, 1.5);

	addLuaSprite('space', false);
	addLuaSprite('globe', false);
	addLuaSprite('fast', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end