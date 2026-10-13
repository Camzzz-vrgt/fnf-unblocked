function onCreate()
	precacheImage('sparkleeffect')

	makeAnimatedLuaSprite('sparkleeffect', 'sparkleeffect', 0, 0);
	setObjectCamera('sparkleeffect', 'hud')
	scaleObject('sparkleeffect', 0.66666, 0.66666);

	addAnimationByPrefix('sparkleeffect','sparkleeffect','idle',24,true);

	addLuaSprite('sparkleeffect', true);
	

	doTweenAlpha('sparkleeffect','sparkleeffect', 0, 0.01, true);
end