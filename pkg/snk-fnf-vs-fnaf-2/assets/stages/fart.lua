function onCreate()
	makeLuaSprite('troll', 'troll', 50, -350);
	setLuaSpriteScrollFactor('troll', 1, 1);
	scaleObject('troll', 7, 7);


	addLuaSprite('troll', false);
	
	close(true);
end