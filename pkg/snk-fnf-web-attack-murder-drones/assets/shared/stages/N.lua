
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('N1', 'N1', -650, 600);
	setScrollFactor('N1', 1.0, 1.0);
	scaleObject('N1', 1.1, 1.1);

	makeLuaSprite('N2', 'N2', -650, 900);
	setScrollFactor('N2', 1.0, 1.0);
	scaleObject('N2', 1.1, 1.1);

	makeLuaSprite('N3', 'N3', -650, 900);
	setScrollFactor('N3', 1.1, 1.1);
	scaleObject('N3', 1.1, 1.1);

	makeLuaSprite('N4', 'N4', -650, 600);
	setScrollFactor('N4', 1.0, 1.0);
	scaleObject('N4', 1.1, 1.1);

	makeLuaSprite('N5', 'N5', -650, 600);
	setScrollFactor('N5', 1.0, 1.0);
	scaleObject('N5', 1.1, 1.1);

	makeLuaSprite('N6', 'N6', -650, 600);
	setScrollFactor('N6', 1.0, 1.0);
	scaleObject('N6', 1.1, 1.1);

	makeLuaSprite('N7', 'N7', -650, 600);
	setScrollFactor('N7', 1.0, 1.0);
	scaleObject('N7', 1.1, 1.1);

     makeAnimatedLuaSprite('Lluvia', 'Lluvia', -650, 600);
	setScrollFactor('Lluvia', 0.9, 0.9);
	scaleObject('Lluvia', 1.1, 1.1);


	addLuaSprite('N1', false);
	addLuaSprite('N2', false);
	addLuaSprite('N3', false);
	addLuaSprite('N4', false);
	addLuaSprite('N5', false);
	addLuaSprite('N6', false);
	addLuaSprite('Lluvia', true);
       addAnimationByPrefix('Lluvia', 'lluvia', 'lluvia', 24, true);
       addLuaSprite('N7', true);
end