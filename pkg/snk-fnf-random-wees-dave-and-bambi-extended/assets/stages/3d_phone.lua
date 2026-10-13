function onCreate()
	-- background shit
	makeAnimatedLuaSprite('bg phone', 'bg phone', -1700, -900);
	luaSpriteAddAnimationByPrefix('bg phone', 'bg phone','bg phone pos', 24, true);
	setScrollFactor('bg phone', 0.9, 0.9);
	scaleObject('bg phone', 2.5, 2.5);
	
	addLuaSprite('bg phone', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end