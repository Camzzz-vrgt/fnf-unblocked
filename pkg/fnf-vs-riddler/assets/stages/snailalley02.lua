function onCreate()
	-- background shit
	makeLuaSprite('snailalley02', 'snailalley02', -600, -300);
	setScrollFactor('snailalley02', 0.9, 0.9);

	addLuaSprite('snailalley02', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end