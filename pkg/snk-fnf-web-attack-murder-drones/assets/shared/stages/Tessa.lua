
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('tessa 1', 'tessa 1', -650, 600);
	setScrollFactor('tessa 1', 1.0, 1.0);
	scaleObject('tessa 1', 1.2, 1.2);

	makeLuaSprite('tessa 2', 'tessa 2', -650, 600);
	setScrollFactor('tessa 2', 0.8, 0.8);
	scaleObject('tessa 2', 1.2, 1.2);

	makeLuaSprite('tessa 3', 'tessa 3', -650, 600);
	setScrollFactor('tessa 3', 0.8, 0.8);
	scaleObject('tessa 3', 1.2, 1.2);

	makeLuaSprite('tessa 4', 'tessa 4', -650, 600);
	setScrollFactor('tessa 4', 1.0, 1.0);
	scaleObject('tessa 4', 1.2, 1.2);

	makeLuaSprite('tessa 5', 'tessa 5', -650, 600);
	setScrollFactor('tessa 2', 1.0, 1.0);
	scaleObject('tessa 5', 1.2, 1.2);


	addLuaSprite('tessa 5', false);
      addLuaSprite('tessa 4', true);
      addLuaSprite('tessa 3', true);
	addLuaSprite('tessa 2', true);
	addLuaSprite('tessa 1', true);
end