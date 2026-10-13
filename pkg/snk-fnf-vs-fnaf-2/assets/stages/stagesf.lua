function onCreate()
	makeLuaSprite('shadowstage1', 'shadowstage1', -700, -500);
	setLuaSpriteScrollFactor('shadowstage1', 1, 1);
	scaleObject('shadowstage1', 0.7, 0.7);

	makeLuaSprite('black','black', -500, -500);
	setLuaSpriteScrollFactor('black', 0, 0);
	scaleObject('black', 10, 10);
	addLuaSprite('black', true);

	addLuaSprite('shadowstage1', false);

	
	close(true);
end