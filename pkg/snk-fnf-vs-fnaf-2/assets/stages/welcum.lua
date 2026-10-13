function onCreate()
	makeLuaSprite('welcumstage', 'welcumstage', -500, -400);
	setLuaSpriteScrollFactor('welcumstage', 1, 1);
	scaleObject('welcumstage', 2, 2);


	addLuaSprite('welcumstage', false);
	
	close(true);
end