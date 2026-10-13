
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('doll1', 'doll1', -650, 600);
	setScrollFactor('doll1', 1.0, 1.0);
	scaleObject('doll1', 1.3, 1.3);

	makeLuaSprite('doll2', 'doll2', -650, 600);
	setScrollFactor('doll2', 1.0, 1.0);
	scaleObject('doll2', 1.3, 1.3);

	makeLuaSprite('doll3', 'doll3', -350, 900);
	setScrollFactor('doll3', 1.2, 1.2);
	scaleObject('doll3', 1.3, 1.3);

	makeLuaSprite('doll4', 'doll4', -650, 600);
	setScrollFactor('doll4', 1.0, 1.0);
	scaleObject('doll4', 1.3, 1.3);

	makeLuaSprite('doll5', 'doll5', -650, 600);
	setScrollFactor('doll5', 1.0, 1.0);
	scaleObject('doll5', 1.3, 1.3);

	makeLuaSprite('doll6', 'doll6', -650, 600);
	setScrollFactor('doll6', 1.0, 1.0);
	scaleObject('doll6', 1.3, 1.3);

	makeLuaSprite('doll7', 'doll7', -650, 600);
	setScrollFactor('doll7', 1.0, 1.0);
	scaleObject('doll7', 1.3, 1.3);

	makeLuaSprite('doll8', 'doll8', -650, 600);
	setScrollFactor('doll8', 1.0, 1.0);
	scaleObject('doll8', 1.3, 1.3);

	makeLuaSprite('doll9', 'doll9', -650, 600);
	setScrollFactor('doll9', 1.0, 1.0);
	scaleObject('doll9', 1.3, 1.3);

	addLuaSprite('doll1', false);
      addLuaSprite('doll2', false);
      addLuaSprite('doll3', false);
	addLuaSprite('doll4', false);
	addLuaSprite('doll5', false);
	addLuaSprite('doll6', true);
	addLuaSprite('doll7', true);
      addLuaSprite('doll8', true);
      addLuaSprite('doll9', false);
end