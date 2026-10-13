function onCreate()
	-- background shit
	makeLuaSprite('discord', 'bgs/discordbg', -380, -240);
	setScrollFactor('discord', 0, 0);
	scaleObject('discord', 0.91, 0.91);

	addLuaSprite('discord', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end