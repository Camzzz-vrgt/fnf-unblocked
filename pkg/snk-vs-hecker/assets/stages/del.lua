function onCreate()
	-- background shit
	makeLuaSprite('deletedbg', 'bgs/deletedbg', -1400, -650);
	setScrollFactor('deletedbg', 0, 0);
	scaleObject('deletedbg', 0.91, 0.91);

	addLuaSprite('deletedbg', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end