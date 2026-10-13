function onCreate()
	-- background shit
	makeLuaSprite('5', '5', -800, -300);
	setScrollFactor('5', 0.4, 0.4);
	scaleObject('5', 1.2, 1.2);

	makeLuaSprite('4', '4', -800, -300);
	setScrollFactor('4', 0.4, 0.4);
	scaleObject('4', 1.2, 1.2);
	
	makeLuaSprite('3', '3', -800, -300);
	setScrollFactor('3', 0.4, 0.4);
	scaleObject('3', 1.2, 1.2);
	
	makeLuaSprite('2', '2', -800, -300);
	setScrollFactor('2', 1.0, 1.0);
	scaleObject('2', 1.2, 1.2);
	
	makeLuaSprite('1', '1', -800, -300);
	setScrollFactor('1', 1.0, 1.0);
	scaleObject('1', 1.2, 1.2);

	addLuaSprite('5', false);
	addLuaSprite('4', false);
	addLuaSprite('3', false);
	addLuaSprite('2', false);
	addLuaSprite('1', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end