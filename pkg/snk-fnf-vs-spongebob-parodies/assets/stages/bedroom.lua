function onCreate()
	-- background shit
	makeLuaSprite('master bedroom', 'stages/paranormal/master bedroom', -300, -370);
	scaleObject('master bedroom', 1.7, 1.7);

	makeLuaSprite('floor', 'stages/paranormal/floor', -300, -170);
	scaleObject('floor', 1.7, 1.7);

	addLuaSprite('floor', false);
	addLuaSprite('master bedroom', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end