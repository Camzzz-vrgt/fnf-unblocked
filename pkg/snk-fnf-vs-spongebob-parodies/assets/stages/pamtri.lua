function onCreate()
	-- background shit
	makeLuaSprite('pamtri bg', 'stages/pamtri/pamtri bg', -800, -600);
	scaleObject('pamtri bg', 2.4, 2.4);

	addLuaSprite('pamtri bg', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end