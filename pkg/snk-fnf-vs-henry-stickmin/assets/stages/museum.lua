function onCreate()

    makeLuaSprite('Inside', 'museum/museum_1', -830, -300);
	setProperty('Inside.alpha', 1);
	scaleObject('Inside', 0.8, 0.8);
	addLuaSprite('Inside', false);

    makeLuaSprite('Stuff', 'museum/museum_2', -830, -300);
	setProperty('Stuff.alpha', 1);
	scaleObject('Stuff', 0.8, 0.8);
	addLuaSprite('Stuff', true);

    makeLuaSprite('Outside', 'museum/museum_3', -830, -900);
	setProperty('Outside.alpha', 0);
	scaleObject('Outside', 0.8, 0.8);
	addLuaSprite('Outside', false);
end