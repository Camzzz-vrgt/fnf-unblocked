function onCreate()
	-- background shit
	makeLuaSprite('FARBACK', 'stages/sickpants/FARBACK', -910, -500);
	setScrollFactor('FARBACK', 0.7, 0.7);
	scaleObject('FARBACK', 1.7, 1.7);

	makeLuaSprite('Road', 'stages/sickpants/Road', -910, -500);
	scaleObject('Road', 1.5, 1.5);

	makeLuaSprite('Sidewalk', 'stages/sickpants/Sidewalk', -910, -800);
	scaleObject('Sidewalk', 1.5, 1.5);

	makeLuaSprite('Sand', 'stages/sickpants/Sand', -910, -500);
	scaleObject('Sand', 1.5, 1.5);

	makeLuaSprite('Houses', 'stages/sickpants/Houses', -1470, -500);
	scaleObject('Houses', 1.5, 1.5);

	makeLuaSprite('Path', 'stages/sickpants/Path', -1470, -800);
	scaleObject('Path', 1.5, 1.5);

	makeLuaSprite('Bus-Stop-sign', 'stages/sickpants/Bus-Stop-sign', -1500, -500);
	setScrollFactor('Bus-Stop-sign', 0.8, 0.8);
	scaleObject('Bus-Stop-sign', 1.5, 1.5);

        makeAnimatedLuaSprite('sickgf','stages/sickpants/hotGF',150,-510)addAnimationByPrefix('sickgf','bop','gfSHARKidle',15,true)
        objectPlayAnimation('sickgf','bop',false)
	scaleObject('sickgf', 1.0, 1.0);

	addLuaSprite('FARBACK', false);

	addLuaSprite('Sand', false);

	addLuaSprite('Path', false);

	addLuaSprite('Houses', false);

	addLuaSprite('Road', false);

	addLuaSprite('Sidewalk', false);

	addLuaSprite('Bus-Stop-sign', false);

	addLuaSprite('sickgf', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end