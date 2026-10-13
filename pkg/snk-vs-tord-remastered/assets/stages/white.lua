function onCreate()
	-- background shit
	makeLuaSprite('bg', 'commie/white', -500, -300);
	scaleObject('bg', 1, 1);

	addLuaSprite('bg', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end