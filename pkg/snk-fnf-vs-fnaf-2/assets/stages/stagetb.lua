function onCreate()
	makeLuaSprite('tbstage', 'tbstage', -800, -600);
	setLuaSpriteScrollFactor('tbstage', 1, 1);
	scaleObject('tbstage', 0.7, 0.7);

	makeLuaSprite('presents', 'presents', 1770, 450);
	setLuaSpriteScrollFactor('presents', 1.2, 1.2);
	scaleObject('presents', 0.6, 0.6);

	addLuaSprite('tbstage', false);
	addLuaSprite('presents', true);
	
	close(true);
end