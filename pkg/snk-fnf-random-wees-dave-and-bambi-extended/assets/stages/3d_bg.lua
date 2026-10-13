function onCreate()
	-- background shit
	makeAnimatedLuaSprite('3d bg', '3d bg', -1700, -900);
	luaSpriteAddAnimationByPrefix('3d bg', '3d bg',' rotation', 24, true);
	setScrollFactor('3d bg', 0.9, 0.9);
	scaleObject('3d bg', 2.5, 2.5);
	
	addLuaSprite('3d bg', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end