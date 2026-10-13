function onCreate()
	-- background shit
	makeAnimatedLuaSprite('shit', 'shit', -1100, -900);
	luaSpriteAddAnimationByPrefix('shit', 'shit','s shi', 18, true);
	setScrollFactor('shit', 0.9, 0.9);
	scaleObject('shit', 3.0, 3.0);
	
	addLuaSprite('shit', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end