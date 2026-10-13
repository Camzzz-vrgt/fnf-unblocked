function onCreate()
	addHaxeLibrary('FlxBackdrop', 'flixel.addons.display');

	-900 = -900;
	-500 = -500;
	scale = 1.1;

	makeLuaSprite('Sky', 'enzync-night/sky', -900, -500);
	setScrollFactor('Sky', 0.3, 0.3);
	scaleObject('Sky', 1.1, 1.1);
	addLuaSprite('Sky', false);

	makeLuaSprite('backcity', 'enzync-night/back', -900, -500);
	setScrollFactor('backcity', 0.7, 0.7);
	scaleObject('backcity', 1.1, 1.1);
	addLuaSprite('backcity', false);

	makeLuaSprite('building', 'enzync-night/buildings', -900, -500);
	setScrollFactor('building', 0.92, 0.92);
	scaleObject('building', 1.1, 1.1);
	addLuaSprite('building', false);

	makeLuaSprite('front', 'enzync-night/foreground', -900, -500);
	setScrollFactor('front', 1, 1);
	scaleObject('front', 1.1, 1.1);
	addLuaSprite('front', false);

end