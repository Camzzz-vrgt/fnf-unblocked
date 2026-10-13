function onCreate()

	makeLuaSprite('BoxingBG', 'boxingnight2', -500, 500);
	addLuaSprite('BoxingBG',false)
	setLuaSpriteScrollFactor('BoxingBG', 0.02, 0.9);

	makeLuaSprite('buildings', 'buildings', -400, 500);
	addLuaSprite('buildings',false)
	setLuaSpriteScrollFactor('buildings', 0.2, 0.9);

	makeLuaSprite('BoxingRound', 'boxingnight3', 0, 500);
	addLuaSprite('BoxingRound',false)
	setLuaSpriteScrollFactor('boxingnight3', 1, 0.9);

	makeLuaSprite('lights', 'lights', 500, 800);
	addLuaSprite('lights', true);
	setLuaSpriteScrollFactor('lights', 2, 1.8);

	makeLuaSprite('ruido', 'ruido', -500, -400);
	addLuaSprite('ruido', true);
	setLuaSpriteScrollFactor('ruido', 0, 0);

	close(true)
end