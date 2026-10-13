function onCreate()
		
	makeLuaSprite('skyrocks','skyrocks',-580,400)
	addLuaSprite('skyrocks',false)
	setLuaSpriteScrollFactor('skyrocks', 0.15, 0.9);

	makeLuaSprite('rocks','rocks',0,400)
	addLuaSprite('rocks',false)
	setLuaSpriteScrollFactor('rocks', 1, 0.9);

	makeLuaSprite('lights2', 'lights2', 0, 650);
	addLuaSprite('lights2', true);
	setLuaSpriteScrollFactor('light2s', 4, 1.8);
	scaleObject('lights2', 0.9, 0.7);

	makeLuaSprite('ruido', 'ruido', -500, -400);
	addLuaSprite('ruido', true);
	setLuaSpriteScrollFactor('ruido', 0, 0);

	close(true)
end
