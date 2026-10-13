function onCreate()
	-- background shit
	makeLuaSprite('snailalley01', 'snailalley01', -600, -300);
	setScrollFactor('snailalley01', 0.9, 0.9);

	addLuaSprite('snailalley01', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end