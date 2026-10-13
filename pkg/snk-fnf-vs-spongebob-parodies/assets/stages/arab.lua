function onCreate()
	-- background shit
	makeLuaSprite('ABAK bg', 'stages/ABAK/ABAK bg', -350, -100);
	scaleObject('ABAK bg', 1.1, 1.1);

	addLuaSprite('ABAK bg', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end