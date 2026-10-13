function onCreate()
	-- background shit
	makeLuaSprite('deathrun map', 'stages/garrys mod/deathrun map', -310, 30);

	addLuaSprite('deathrun map', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end