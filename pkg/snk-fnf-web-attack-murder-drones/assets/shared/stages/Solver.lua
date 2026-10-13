
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('cyn1', 'cyn1', -650, 600);
	setScrollFactor('cyn1', 1.0, 1.0);
	scaleObject('cyn1', 1.5, 1.5);

	makeLuaSprite('cyn2', 'cyn2', -650, 500);
	setScrollFactor('cyn2', 1.0, 1.0);
	scaleObject('cyn2', 1.5, 1.5);

	makeLuaSprite('cyn3', 'cyn3', -650, 600);
	setScrollFactor('cyn3', 1.0, 1.0);
	scaleObject('cyn3', 1.5, 1.5);

	makeLuaSprite('cyn4', 'cyn4', -650, 600);
	setScrollFactor('cyn4', 1.0, 1.0);
	scaleObject('cyn4', 1.5, 1.5);

	makeLuaSprite('cyn5', 'cyn5', -650, 650);
	setScrollFactor('cyn5', 1.0, 1.0);
	scaleObject('cyn5', 1.5, 1.5);

	makeLuaSprite('cyn6', 'cyn6', -650, 600);
	setScrollFactor('cyn6', 1.0, 1.0);
	scaleObject('cyn6', 1.5, 1.5);

	makeLuaSprite('cyn', 'cyn', -650, 600);
	setScrollFactor('cyn', 1.0, 1.0);
	scaleObject('cyn', 1.5, 1.5);

	makeLuaSprite('cyn0', 'cyn0', -650, 600);
	setScrollFactor('cyn0', 1.0, 1.0);
	scaleObject('cyn0', 1.5, 1.5);

	makeLuaSprite('stagehuggy02', 'stagehuggy02', -650, 600);
	setScrollFactor('stagehuggy02', 1.0, 1.0);
	scaleObject('stagehuggy02', 1.5, 1.5);

	addLuaSprite('cyn0', false);
      addLuaSprite('cyn1', false);
      addLuaSprite('cyn2', false);
	addLuaSprite('cyn3', false);
	addLuaSprite('cyn4', false);
	addLuaSprite('cyn5', false);
	addLuaSprite('cyn6', true);
      addLuaSprite('cyn', false);
      addLuaSprite('stagehuggy02', true);
end