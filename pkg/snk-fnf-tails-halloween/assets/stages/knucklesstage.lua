function onCreate()
	-- background shit
	makeLuaSprite('broken', 'broken', -1320, -400);
	setScrollFactor('broken', 1.0, 1.0);
	scaleObject('broken', 1.2, 1.2);

	makeLuaSprite('bigmountain', 'bigmountain', -590, -400);
	setScrollFactor('bigmountain', 0.8, 0.8);
	scaleObject('bigmountain', 1.2, 1.2);

	makeLuaSprite('knucklesnight', 'knucklesnight', -570, -270);
	setScrollFactor('knucklesnight', 0.7, 0.7);
	scaleObject('knucklesnight', 1.2, 1.2);

	makeLuaSprite('master', 'master', -560, -300);
	setScrollFactor('master', 1.0, 1.0);
	scaleObject('master', 1.1, 1.1);

	addLuaSprite('knucklesnight', false);
	addLuaSprite('bigmountain', false);
	addLuaSprite('broken', false);
	addLuaSprite('master', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end