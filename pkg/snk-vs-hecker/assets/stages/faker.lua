function onCreate()
	-- background shit
	makeLuaSprite('rekcehbg', 'bgs/rekcehbg', -860, -650);
	setScrollFactor('rekcehbg', 0, 0);
	scaleObject('rekcehbg', 0.93, 0.93);

	addLuaSprite('rekcehbg', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end