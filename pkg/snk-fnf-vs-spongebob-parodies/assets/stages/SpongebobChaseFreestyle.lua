function onCreate()
	-- background shit
	makeLuaSprite('white', 'stages/holy tony/white', -600, -300);
	scaleObject('white', 2.1, 2.1);

	addLuaSprite('white', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end