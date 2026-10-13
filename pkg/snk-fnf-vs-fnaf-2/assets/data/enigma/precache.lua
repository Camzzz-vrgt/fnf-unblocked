function onCreate()
	makeAnimatedLuaSprite('staticpurp', 'staticpurp', 0, 0);
	setObjectCamera('staticpurp', 'hud')
	scaleObject('staticpurp', 1, 1);

	addAnimationByPrefix('staticpurp','staticpurp','idle',24,true);

	addLuaSprite('staticpurp', true);
	

	doTweenAlpha('staticpurp','staticpurp', 0, 0.01, true);

	makeLuaSprite('shadowstageglitch', 'shadowstageglitch', 0, 0);
	setObjectCamera('shadowstageglitch', 'hud')
	scaleObject('shadowstageglitch', 1, 1);

	addLuaSprite('shadowstageglitch', true);
	

	doTweenAlpha('shadowstageglitch','shadowstageglitch', 0, 0.01, true);
end