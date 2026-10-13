function onCreate()
	makeAnimatedLuaSprite('static2', 'static2', -1230, -700);
	setLuaSpriteScrollFactor('static2', 0, 0);
	setObjectCamera('static2', 'hud')
	addAnimationByPrefix('static2','static2','idle',24,true);
	scaleObject('static2', 1, 1);

	addLuaSprite('static2', true);
	

	doTweenAlpha('static2','static2', 0, 0.01, true);
end