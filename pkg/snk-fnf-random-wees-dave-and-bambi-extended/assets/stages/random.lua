function onCreate()
	-- background shit
	makeLuaSprite('random', 'random', -1500, -600);
	setScrollFactor('random', 0.1, 0.1);
	scaleObject('random', 0.90, 0.90);
	
	makeLuaSprite('plaoe', 'plaoe', -4300, -1100);
	setScrollFactor('plaoe', 1.0, 1.0);
	scaleObject('plaoe', 5.0, 4.0);
	
	

	addLuaSprite('random', false);
	addLuaSprite('plaoe', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end