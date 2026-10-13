
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	makeLuaSprite('tree back', 'nudeforest/tree back', -650, -350);
	scaleObject('tree back', 1, 1);
	setScrollFactor('tree back', 1.2, 1);
	
	makeLuaSprite('tree', 'nudeforest/tree', -650, -350);
	scaleObject('tree', 1, 1);
	setScrollFactor('tree', 1.1, 1);
	
	makeLuaSprite('grass', 'nudeforest/grass', -650, -350);
	setScrollFactor('grass', 1, 1);
	scaleObject('grass', 1, 1);

	makeAnimatedLuaSprite('Rave', 'Nudeforest/Rave',  -650, -380)
	addAnimationByPrefix('Rave', 'flash', 'flash', 24, true)
	setScrollFactor('Rave', 1.1, 1.1);
	scaleObject('Rave', 2, 2);
	setObjectOrder('Rave', 0);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	end

	addLuaSprite('rave', false);
	addLuaSprite('tree back', false);
	addLuaSprite('tree', false);
	addLuaSprite('grass', false);
end