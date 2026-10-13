function onCreate()
	-- background shit
	makeLuaSprite('stage', 'stages/purgatory/stage', -470, -200);
	scaleObject('stage', 1.2, 1.2);

	makeLuaSprite('crowed', 'stages/purgatory/crowed', -650, -300);
	setScrollFactor('crowed', 0.9, 0.9);
	scaleObject('crowed', 1.1, 1.1);


	addLuaSprite('stage', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end