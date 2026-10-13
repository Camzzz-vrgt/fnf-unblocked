
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('J1', 'J1', -650, 600);
	setScrollFactor('J1', 1.0, 1.0);
	scaleObject('J1', 1.1, 1.1);

	makeLuaSprite('J6', 'J6', -650, 600);
	setScrollFactor('J6', 1.0, 1.0);
	scaleObject('J6', 1.1, 1.1);

	makeLuaSprite('J7', 'J7', -350, 900);
	setScrollFactor('J7', 1.2, 1.2);
	scaleObject('J7', 1.1, 1.1);

	makeLuaSprite('J2', 'J2', -650, 600);
	setScrollFactor('J2', 1.0, 1.0);
	scaleObject('J2', 1.1, 1.1);

	makeLuaSprite('J3', 'J3', -650, 600);
	setScrollFactor('J3', 1.0, 1.0);
	scaleObject('J3', 1.1, 1.1);

	makeLuaSprite('J4', 'J4', -650, 600);
	setScrollFactor('J4', 1.0, 1.0);
	scaleObject('J4', 1.1, 1.1);

	makeLuaSprite('J5', 'J5', -650, 600);
	setScrollFactor('J5', 1.0, 1.0);
	scaleObject('J5', 1.1, 1.1);

	makeLuaSprite('J8', 'J8', -650, 600);
	setScrollFactor('J8', 1.0, 1.0);
	scaleObject('J8', 1.1, 1.1);

	addLuaSprite('J1', false);
      addLuaSprite('J6', false);
      addLuaSprite('J7', false);
	addLuaSprite('J2', false);
	addLuaSprite('J3', false);
	addLuaSprite('J4', true);
	addLuaSprite('J5', true);
      addLuaSprite('J8', true);
end