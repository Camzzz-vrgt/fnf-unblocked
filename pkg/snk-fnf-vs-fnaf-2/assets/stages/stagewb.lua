function onCreate()
	makeLuaSprite('wbstage', 'wbstage', -800, -700);
	setLuaSpriteScrollFactor('wbstage', 1, 1);
	scaleObject('wbstage', 0.9, 0.9);

	makeLuaSprite('arcade', 'arcade', 1600, 80);
	setLuaSpriteScrollFactor('arcade', 1.2, 1.2);
	scaleObject('arcade', 1.1, 1.1);

	makeLuaSprite('balloons', 'balloons', -600, 0);
	setLuaSpriteScrollFactor('balloons', 0.9, 0.9);
	scaleObject('balloons', 1.3, 1.3);


	addLuaSprite('wbstage', false);
	addLuaSprite('arcade', true);
	addLuaSprite('balloons', true);
	
	close(true);
end