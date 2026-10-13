function onCreate()
	-- background shit
	makeLuaSprite('com', 'com', -400, -100);
	setScrollFactor('com', 1.0, 1.0);
	scaleObject('com', 0.60, 0.60);
	
	
	makeAnimatedLuaSprite('firros', 'firros', -300, -20);
	luaSpriteAddAnimationByPrefix('firros', 'firros','firros d idi', 24, true);
	setScrollFactor('firros', 1.0, 1.0);
	scaleObject('firros', 0.50, 0.50);
	
	
	addLuaSprite('com', false);
	addLuaSprite('firros', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end