function onCreate()
	-- background shit
	makeLuaSprite('feolol', 'feolol', -800, -300);
	setScrollFactor('feolol', 0.4, 0.4);
	scaleObject('feolol', 1.2, 1.2);
	
	makeLuaSprite('piso xd', 'piso xd', -800, 700);
	setScrollFactor('piso xd', 1.0, 1.0);
	scaleObject('piso xd', 1.2, 1.2);

	makeLuaSprite('efevt', 'efevt', -800, -300);
	setScrollFactor('efevt', 1.0, 1.0);
	scaleObject('efevt', 1.2, 1.2);

	makeLuaSprite('añe', 'añe', -800, -750);
	setScrollFactor('añe', 1.0, 1.0);
	scaleObject('añe', 1.2, 1.2);

	addLuaSprite('feolol', false);
	addLuaSprite('añe', false);
	addLuaSprite('piso xd', false);
	addLuaSprite('efevt', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end