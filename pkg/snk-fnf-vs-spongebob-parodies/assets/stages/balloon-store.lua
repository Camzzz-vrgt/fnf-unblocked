function onCreate()
	-- background shit
	makeLuaSprite('balloon store', 'stages/balloon store/balloon store', -600, -300);
	setScrollFactor('balloon store', 0.9, 0.9);
	scaleObject('balloon store', 1.1, 1.1);
	addLuaSprite('balloon store', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end