
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
	
	-- background shit
	makeLuaSprite('Sky', 'CrystalLake/Sky', -700, -275);
	scaleObject('Sky', 1.8, 1.8);
	setScrollFactor('Sky', 1, 1.2);
	
	makeLuaSprite('Lake Deck', 'CrystalLake/Lake Deck', -750, -150);
	scaleObject('Lake Deck', 1, 1);
	setScrollFactor('Lake Deck', 0.9, 0.9);
	
	makeLuaSprite('Forest', 'CrystalLake/Forest', -750, -275);
	scaleObject('Forest', 1, 1);
	setScrollFactor('Forest', 0.75, 0.5);
	
	makeLuaSprite('Lake Deck Light', 'CrystalLake/Lake Deck Light', -750, -150);
	scaleObject('Lake Deck Light', 1, 1);
	setScrollFactor('Lake Deck Light', 0.9, 0.9);
	setBlendMode('Lake Deck Light', 'add');
	setObjectOrder('Lake Deck Light', 11);
	
	makeLuaSprite('Water', 'CrystalLake/Water', -750, -150);
	setScrollFactor('Water', 0.9, 0.9);
	scaleObject('Water', 1, 1);
	
	makeLuaSprite('Front Surface 1', 'CrystalLake/Front Surface 1', -750, -150);
	scaleObject('Front Surface 1', 1, 1);
	setScrollFactor('Front Surface 1', 1.1, 1);
	setObjectOrder('Front Surface 1', 5);
	
	makeLuaSprite('Front Surface 2', 'CrystalLake/Front Surface 2', -750, -150);
	scaleObject('Front Surface 2', 1, 1);
	setScrollFactor('Front Surface 2', 1.1, 1);
	setObjectOrder('Front Surface 2', 5);

	makeLuaSprite('overlay 1', 'CrystalLake/overlay 1', -700, -275);
	scaleObject('overlay 1', 1, 1);
	setScrollFactor('overlay 1', 0.9, 0.9);
	setBlendMode('overlay 1', 'multiply');

	makeLuaSprite('overlay 2', 'CrystalLake/overlay 2', -700, -275);
	scaleObject('overlay 2', 1, 1);
	setScrollFactor('overlay 2', 0.9, 0.9);

	makeLuaSprite('overlay 3', 'CrystalLake/overlay 3', -700, -275);
	scaleObject('overlay 3', 1, 1);
	setScrollFactor('overlay 3', 0.9, 0.9);
	setBlendMode('overlay 3', 'add');
	setObjectOrder('overlay 3', 11);

	makeLuaSprite('overlay 4', 'CrystalLake/overlay 4', -700, -275);
	scaleObject('overlay 4', 1, 1);
	setScrollFactor('overlay 4', 0.9, 0.9);
	setBlendMode('overlay 4', 'multiply');
	setObjectOrder('overlay 4', 4);

	makeLuaSprite('ambientLight', 'CrystalLake/ambientLight', -700, -275);
	scaleObject('ambientLight', 1.8, 1.8);
	setScrollFactor('ambientLight', 0.9, 0.9);
	setBlendMode('ambientLight', 'add');
	setObjectOrder('ambientLight', 11);

	makeLuaSprite('ambientLight2', 'CrystalLake/ambientLight2', -700, -275);
	scaleObject('ambientLight2', 1.8, 1.8);
	setScrollFactor('ambientLight2', 0.9, 0.9);
	setBlendMode('ambientLight2', 'add');
	setObjectOrder('ambientLight2', 11);

	makeLuaSprite('fog', 'CrystalLake/fog', -700, -275);
	scaleObject('fog', 1.8, 1.8);
	setScrollFactor('fog', 1, 1.2);

	makeLuaSprite('lightAdd', 'CrystalLake/lightAdd', -700, -275);
	scaleObject('lightAdd', 1.8, 1.8);
	setScrollFactor('lightAdd', 0.9, 0.9);
	setBlendMode('lightAdd', 'add');
	setObjectOrder('lightAdd', 11);

	makeLuaSprite('overlayDark', 'CrystalLake/overlayDark', -700, -275);
	scaleObject('overlayDark', 1.8, 1.8);
	setScrollFactor('overlayDark', 0.9, 0.9);
	setBlendMode('overlayDark', 'overlay');
	setObjectOrder('overlayDark', 11);

	

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('stagelight_left', 'stage_light', -125, -100);
		setScrollFactor('stagelight_left', 0.9, 0.9);
		scaleObject('stagelight_left', 1.1, 1.1);
		
		makeLuaSprite('stagelight_right', 'stage_light', 1225, -100);
		setScrollFactor('stagelight_right', 0.9, 0.9);
		scaleObject('stagelight_right', 1.1, 1.1);
		setProperty('stagelight_right.flipX', true); --mirror sprite horizontally

		makeLuaSprite('stagecurtains', 'stagecurtains', -500, -300);
		setScrollFactor('stagecurtains', 1.3, 1.3);
		scaleObject('stagecurtains', 0.9, 0.9);
	end

	addLuaSprite('Sky', false);
	addLuaSprite('Forest', false);
	addLuaSprite('Water', false);
	addLuaSprite('Lake Deck', false);
	addLuaSprite('Lake Deck Light', false);
	addLuaSprite('Front Surface 1', false);
	addLuaSprite('Front Surface 2', false);
	addLuaSprite('overlay 1', true);
	addLuaSprite('overlay 2', true);
	addLuaSprite('overlay 3', false);
	addLuaSprite('overlay 4', false);
	addLuaSprite('ambientLight', true);
	addLuaSprite('ambientLight2', true);
	addLuaSprite('fog', false);
	addLuaSprite('lightAdd', true);
	addLuaSprite('overlayDark', true);


	--addLuaSprite('stagelight_left', false);
	--addLuaSprite('stagelight_right', false);
	--addLuaSprite('stagecurtains', false);
end