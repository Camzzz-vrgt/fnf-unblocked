function onCreate()
	-- background shit
	makeLuaSprite('negros lol', 'negros lol', -800, -300);
	setScrollFactor('negros lol', 0.4, 0.4);
	scaleObject('negros lol', 9.2, 9.2);


	addLuaSprite('negros lol', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end