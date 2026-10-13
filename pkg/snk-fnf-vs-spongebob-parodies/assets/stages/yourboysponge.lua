function onCreate()
	-- background shit
	makeLuaSprite('jellyfish fields', 'stages/your boy sponge/jellyfish fields', -190, -90);
	scaleObject('jellyfish fields', 1.5, 1.5);

	makeLuaSprite('sea skys', 'stages/your boy sponge/sea skys', -190, -90);
	addLuaSprite('sea skys', false);
	setScrollFactor('sea skys', 0.4, 0.4);
	scaleObject('sea skys', 1.5, 1.5);

	makeLuaSprite('back grass', 'stages/your boy sponge/back grass', -190, -90);
	addLuaSprite('back grass', false);
	setScrollFactor('back grass', 0.7, 0.7);
	scaleObject('back grass', 1.5, 1.5);

	addLuaSprite('sea skys', false);
	addLuaSprite('back grass', false);
	addLuaSprite('jellyfish fields', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end