function onCreate()
	makeLuaSprite('pupstage', 'pupstage', -1720, -800);
	setLuaSpriteScrollFactor('pupstage', 1, 1);
	scaleObject('pupstage', 0.78, 0.78);

	addLuaSprite('pupstage', false);
	
	close(true);
end