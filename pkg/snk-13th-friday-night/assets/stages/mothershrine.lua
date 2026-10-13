
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	makeLuaSprite('shrine', 'Mothershrine/shrine', -620, -90);
	scaleObject('shrine', 1, 1);
	setScrollFactor('shrine', 1, 1);
	setObjectOrder('shrine', 5);
		
	makeLuaSprite('head', 'Mothershrine/head', -620, -90);
	scaleObject('head', 1, 1);
	setScrollFactor('head', 1, 1);
	setObjectOrder('head', 6);

	makeLuaSprite('light', 'Mothershrine/light', -620, -90);
	scaleObject('light', 1, 1);
	setScrollFactor('light', 1, 1);
	setObjectOrder('light', 7);
	setBlendMode('overlay', 'add');


	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('overlay', 'Mothershrine/overlay', -400, -300);
		setScrollFactor('overlay', 0, 0);
		scaleObject('overlay', 1, 1.1);
	setObjectOrder('overlay', 8);
	setBlendMode('overlay', 'multiply');

		makeAnimatedLuaSprite('candles', 'Mothershrine/candles',  -220, 610)
	addAnimationByPrefix('candles', 'candlelight', 'candlelight', 24, true)
		setScrollFactor('candles', 1, 1);
		scaleObject('candles', 1, 1);
	setObjectOrder('candles', 8);
	setBlendMode('candles', 'add');

	end

	addLuaSprite('shrine', true);
	addLuaSprite('head', true);

	--addLuaSprite('overlay', true);
	--addLuaSprite('candles', true);
end