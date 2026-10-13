function onCreate()
	-- background shit
	makeLuaSprite('blackscreen', 'blackscreen', -600, -300); 
	setScrollFactor('blackscreen', 0.3, 0.3);
	setObjectCamera('blackscreen', 'HUD');
	scaleObject('blackscreen', 1.5, 1.5);

	makeAnimatedLuaSprite('uhoh','uhoh', 0, 0)
	addAnimationByPrefix('uhoh', 'idle', 'idle', 15, true)
	objectPlayAnimation('uhoh','idle',false)
	setObjectCamera('uhoh', 'HUD')
	scaleObject('uhoh', 1.0, 1.0);

	addLuaSprite('blackscreen', false)
	addLuaSprite('uhoh', false)
end