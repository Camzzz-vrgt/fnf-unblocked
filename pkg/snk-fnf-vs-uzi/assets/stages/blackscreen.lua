function onCreate()
	-- background shit
	makeLuaSprite('blackscreen', 'blackscreen', -600, -300); 
	setScrollFactor('blackscreen', 0.3, 0.3);
	setObjectCamera('blackscreen', 'HUD');
	scaleObject('blackscreen', 1.5, 1.5);

	addLuaSprite('blackscreen', false)
end