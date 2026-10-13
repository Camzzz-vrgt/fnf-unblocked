function onCreate()
	makeLuaSprite('gfstage', 'gfstage', -350, -350);
	setLuaSpriteScrollFactor('gfstage', 1, 1);
	scaleObject('gfstage', 0.75, 0.75);

	makeLuaSprite('blacc','black', -500, -500);
	setLuaSpriteScrollFactor('blacc', 0, 0);
	scaleObject('blacc', 10, 10);


	addLuaSprite('blacc', true);
	addLuaSprite('gfstage', false);

end