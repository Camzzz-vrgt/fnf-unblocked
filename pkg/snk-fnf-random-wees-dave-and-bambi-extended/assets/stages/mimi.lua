function onCreate()
	-- background shit

	makeLuaSprite('ala', 'ala', -300, -100);
	setScrollFactor('ala', 1.0, 1.0);
	scaleObject('ala', 0.8, 0.8);
	

	addLuaSprite('ala', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end