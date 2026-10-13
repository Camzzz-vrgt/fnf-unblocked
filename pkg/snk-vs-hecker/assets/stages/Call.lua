function onCreate()
	-- background shit
	makeLuaSprite('callbg', 'bgs/callbg', -470, -280);
	setScrollFactor('callbg', 0, 0);
	scaleObject('callbg', 0.96, 0.96);

	addLuaSprite('callbg', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end