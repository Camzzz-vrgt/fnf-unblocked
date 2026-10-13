function onCreate()
	makeLuaSprite('wfstage', 'wfstage', -700, -250);
	setLuaSpriteScrollFactor('wfstage', 1, 1);
	scaleObject('wfstage', 0.4, 0.4);

	makeLuaSprite('blacc','black', -500, -500);
	setLuaSpriteScrollFactor('blacc', 0, 0);
	scaleObject('blacc', 10, 10);
	addLuaSprite('blacc', true);

	addLuaSprite('wfstage', false);
	
	close(true);
end