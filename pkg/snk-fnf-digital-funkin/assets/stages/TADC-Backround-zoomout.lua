function onCreate()
	-- background shit
	makeLuaSprite('TADC', 'TADC', -450, -900);
	setLuaSpriteScrollFactor('TADC', 1, 1);
	
	addLuaSprite('TADC', false);
	scaleObject('TADC', 0.55, 0.55);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end