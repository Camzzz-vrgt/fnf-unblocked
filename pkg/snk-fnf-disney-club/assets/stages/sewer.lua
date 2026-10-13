function onCreate()
	makeAnimatedLuaSprite('fg', 'stages/sewers/water', 0, 0);
	addAnimationByPrefix('fg', 'anim', 'war', 24, true);
	setLuaSpriteScrollFactor('fg', 1, 1);
	scaleObject('fg', 2.2, 2.2)
	makeAnimatedLuaSprite('bg', 'stages/sewers/bg', 0, 0);
	addAnimationByPrefix('bg', 'otherAnim', 'bg', 24, true);
	setLuaSpriteScrollFactor('bg', 1, 1);
	scaleObject('bg', 2.2, 2.2)
	addLuaSprite('bg', false);
	addLuaSprite('fg', false);
	close(true); 
end