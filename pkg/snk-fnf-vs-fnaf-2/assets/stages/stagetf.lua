function onCreate()
	makeLuaSprite('tfstage', 'tfstage', -800, -600);
	setLuaSpriteScrollFactor('tfstage', 1, 1);
	scaleObject('tfstage', 1, 1);

	makeLuaSprite('presents', 'presents', -400, 300);
	setLuaSpriteScrollFactor('presents', 1.25, 1.25);
	scaleObject('presents', 0.8, 0.8);

	makeLuaSprite('table', 'table', 1550, 450);
	setLuaSpriteScrollFactor('table', 1.05, 1.05);
	scaleObject('table', 0.9, 0.9);

	makeLuaSprite('stars', 'stars', -400, -650);
	setLuaSpriteScrollFactor('stars', 1.2, 1.2);
	scaleObject('stars', 1.5, 1.5);


	addLuaSprite('tfstage', false);
	addLuaSprite('presents', true);
	addLuaSprite('table', true);
	addLuaSprite('stars', true);
	
	close(true);
end