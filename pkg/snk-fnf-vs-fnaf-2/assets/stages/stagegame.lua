function onCreate()

	makeLuaSprite('gamerstage3', 'gamerstage3', -1400, -350);
	setLuaSpriteScrollFactor('gamerstage3', 1, 1);
	scaleObject('gamerstage3', 0.45, 0.45);

	addLuaSprite('gamerstage3', false);

	makeAnimatedLuaSprite('mrhugsjump', 'mrhugsjump', -700, -50);
	setLuaSpriteScrollFactor('mrhugsjump', 1, 1);
	scaleObject('mrhugsjump', 0.5, 0.5);

	addAnimationByPrefix('mrhugsjump','mrhugsjump','idle',26,true);

	addLuaSprite('mrhugsjump', false);

	makeLuaSprite('gamerstage2', 'gamerstage2', -1400, -350);
	setLuaSpriteScrollFactor('gamerstage2', 1, 1);
	scaleObject('gamerstage2', 0.45, 0.45);
	setObjectOrder('gamerstage2', getObjectOrder('dadGroup') + 1)

	addLuaSprite('gamerstage2', false);

	makeLuaSprite('gamerstage', 'gamerstage', -1400, -350);
	setLuaSpriteScrollFactor('gamerstage', 1, 1);
	scaleObject('gamerstage', 0.45, 0.45);
	setObjectOrder('gamerstage', getObjectOrder('dadGroup') + 1)

	addLuaSprite('gamerstage', false);
	
	close(true);
end