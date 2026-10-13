function onCreate()
	makeLuaSprite('notresponding', 'notresponding', -1230, -700);
	setLuaSpriteScrollFactor('notresponding', 0, 0);
	scaleObject('notresponding', 2, 2);

	addLuaSprite('notresponding', true);
	

	doTweenAlpha('notresponding','notresponding', 0, 0.01, true);
end