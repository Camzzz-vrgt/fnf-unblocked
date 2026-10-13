function onCreate()
	addHaxeLibrary('FlxBackdrop', 'flixel.addons.display');

	-500 = -500;
	-700 = -700;
	scale = 1.2;

	makeLuaSprite('Sky', 'backstreet/Sky', -500, -700);
	setScrollFactor('Sky', 0, 0);
	scaleObject('Sky', 1.2, 1.2);
	addLuaSprite('Sky', false);

	makeLuaSprite('BGCity', 'backstreet/BGCity', -500, -700);
	setScrollFactor('BGCity', 0.2, 0.9);
	scaleObject('BGCity', 1.2, 1.2);
	addLuaSprite('BGCity', false);

	makeLuaSprite('Road', 'backstreet/Road', -500, -700);
	setScrollFactor('Road', 1, 1);
	scaleObject('Road', 1.2, 1.2);
	addLuaSprite('Road', false);

	makeLuaSprite('LeftBuildings', 'backstreet/LeftBuildings', -500, -700);
	setScrollFactor('LeftBuildings', 1, 1);
	scaleObject('LeftBuildings', 1.2, 1.2);
	addLuaSprite('LeftBuildings', false);

	makeLuaSprite('Signs', 'backstreet/Signs', -500, -700);
	setScrollFactor('Signs', 1, 1);
	scaleObject('Signs', 1.2, 1.2);
	addLuaSprite('Signs', false);

	makeLuaSprite('RightBuildings', 'backstreet/RightBuildings', -500, -700);
	setScrollFactor('RightBuildings', 1, 1);
	scaleObject('RightBuildings', 1.2, 1.2);
	addLuaSprite('RightBuildings', false);

	makeAnimatedLuaSprite('MovingPieces', 'backstreet/MovingPieces', -500, -700 + 445);
	addAnimationByPrefix('MovingPieces', 'idle', 'TogaAnim', 24, true);
	playAnim('MovingPieces', 'idle');
	scaleObject('MovingPieces', 1.2, 1.2);
	addLuaSprite('MovingPieces', false);
	setScrollFactor('MovingPieces', 1, 1);

	makeLuaSprite('black', '', -100, -100);
	makeGraphic('black', 1280*2, 720*2, '000000');
	setScrollFactor('black', 0, 0);
	screenCenter('black');
	setProperty('black.alpha', 0.0001);
	addLuaSprite('black', false);
end