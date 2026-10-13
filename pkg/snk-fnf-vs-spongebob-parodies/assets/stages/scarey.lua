function onCreate()
	-- background shit
	makeLuaSprite('scareyBG', 'stages/SCARY!/scareyBG', -900, -300);
	setScrollFactor('scareyBG', 0.6, 0.6);

	makeLuaSprite('scareyFloor', 'stages/SCARY!/scareyFloor', -650, -900);

	addLuaSprite('scareyBG', false);
	addLuaSprite('scareyFloor', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end