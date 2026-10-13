
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('Dead_Drone', 'Dead_Drone', -650, 600);
	setScrollFactor('Dead_Drone', 0.9, 0.9);
	scaleObject('Dead_Drone', 1.1, 1.1);

	makeLuaSprite('luz', 'luz', -650, 600);
	setScrollFactor('luz', 0.9, 0.9);
	scaleObject('luz', 1.1, 1.1);

       makeAnimatedLuaSprite('Lluvia', 'Lluvia', -650, 600);
	setScrollFactor('Lluvia', 0.9, 0.9);
	scaleObject('Lluvia', 1.1, 1.1);

	makeLuaSprite('Sky', 'Sky', -650, 600);
	setScrollFactor('Sky', 0.9, 0.9);
	scaleObject('Sky', 1.1, 1.1);

	makeLuaSprite('Clouds', 'Clouds', -650, 600);
	setScrollFactor('Clouds', 0.9, 0.9);
	scaleObject('Clouds', 1.1, 1.1);

	makeLuaSprite('City', 'City', -650, 600);
	setScrollFactor('City', 0.9, 0.9);
	scaleObject('City', 1.1, 1.1);

	makeLuaSprite('buildings', 'buildings', -650, 600);
	setScrollFactor('buildings', 0.9, 0.9);
	scaleObject('buildings', 1.1, 1.1);

	makeLuaSprite('Floor', 'Floor', -650, 600);
	setScrollFactor('Floor', 0.9, 0.9);
	scaleObject('Floor', 1.1, 1.1);

	makeLuaSprite('XD', 'XD', -650, 600);
	setScrollFactor('XD', 0.9, 0.9);
	scaleObject('XD', 1.1, 1.1);


	addLuaSprite('Dead_Drone', true);
	addLuaSprite('luz', true);

	addLuaSprite('Lluvia', true);
       addAnimationByPrefix('Lluvia', 'lluvia', 'lluvia', 24, true);
	addLuaSprite('Sky', false);
	addLuaSprite('Clouds', false);
	addLuaSprite('City', false);
	addLuaSprite('buildings', false);
       addLuaSprite('Floor', false);
       addLuaSprite('XD', false);
end