function onCreate()
	
	makeLuaSprite('tcstage', 'tcstage', 200, -450);
	setLuaSpriteScrollFactor('tcstage', 1, 1);
	scaleObject('tcstage', 0.6, 0.6);

	makeLuaSprite('wire', 'wire', 1800, -150);
	setLuaSpriteScrollFactor('wire', 1.25, 1.25);
	scaleObject('wire', 0.9, 0.9);

	addLuaSprite('tcstage', false);
	addLuaSprite('wire', true);
	
	close(true);
end