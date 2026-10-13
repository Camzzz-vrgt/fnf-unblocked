
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	--setProperty('defaultCamZoom',0.5)
	makeLuaSprite('bartop','',0,-30)
	makeGraphic('bartop',1280,100,'000000')
	addLuaSprite('bartop',true)
	setObjectCamera('bartop','hud')
	setScrollFactor('bartop',0,0)

	makeLuaSprite('barbot','',0,650)
	makeGraphic('barbot',1280,100,'000000')
	addLuaSprite('barbot',true)
	setScrollFactor('barbot',0,0)
	setObjectCamera('barbot','hud')

	makeLuaSprite('whitevoid', 'snowforest/whitevoid', -580, 0);
	scaleObject('whitevoid', 1, 1);
	setScrollFactor('whitevoid', 1, 1);
		
	makeLuaSprite('snow', 'snowforest/snow', -580, 0);
	scaleObject('snow', 1, 1);
	setScrollFactor('snow', 1, 1);
	setObjectOrder('snow', 6);
	setProperty('snow.alpha', 0.5);


	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('frozenscreen', 'snowforest/frozenscreen', -400, -300);
		setScrollFactor('frozenscreen', 0, 0);
		scaleObject('frozenscreen', 1, 1.1);
	setObjectOrder('frozenscreen', 8);
	setBlendMode('frozenscreen', 'add');

		makeAnimatedLuaSprite('blizzardsnow', 'snowforest/blizzardsnow',  -580, 0)
	addAnimationByPrefix('blizzardsnow', 'snowing', 'snowing', 24, true)
		setScrollFactor('blizzardsnow', 0.9, 0.9);
		scaleObject('blizzardsnow', 2, 2);
	setObjectOrder('blizzardsnow', 7);

		makeAnimatedLuaSprite('blizzardtrees', 'snowforest/blizzardtrees',  -340, 200)
	addAnimationByPrefix('blizzardtrees', 'trees', 'trees', 24, true)
		setScrollFactor('blizzardtrees', 0.9, 0.9);
		scaleObject('blizzardtrees', 3.2, 3.2);

	end

	addLuaSprite('whitevoid', false);
	addLuaSprite('blizzardtrees', false);
	addLuaSprite('treesnow', false);
	addLuaSprite('snow', false);
	addLuaSprite('overlaysnow', true);

	--addLuaSprite('blizzardsnow', true);
	--addLuaSprite('frozenscreen', true);
end