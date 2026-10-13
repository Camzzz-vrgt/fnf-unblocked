function onCreate()
	makeLuaSprite('yofbstage', 'yofbstage', -1400, -350);
	setLuaSpriteScrollFactor('yofbstage', 0.8, 0.8);
	scaleObject('yofbstage', 0.6, 0.6);

	makeLuaSprite('black','black', -500, -500);
	setLuaSpriteScrollFactor('black', 0, 0);
	scaleObject('black', 10, 10);
	addLuaSprite('black', true);

	addLuaSprite('yofbstage', false);
	
	close(true);
end