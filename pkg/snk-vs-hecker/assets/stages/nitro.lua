function onCreate()
	-- background shit
	makeLuaSprite('nitrobg', 'bgs/nitrobg', -1400, -650);
	setScrollFactor('nitrobg', 0, 0);
	scaleObject('nitrobg', 0.91, 0.91);

	addLuaSprite('nitrobg', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end