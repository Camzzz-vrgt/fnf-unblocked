function onCreate()

	makeLuaSprite('sky', 'bgs/lawn/sky', -900, -300);
	setLuaSpriteScrollFactor('sky', 0.01, 0.01);
	scaleObject('sky', 4, 4);

	makeLuaSprite('mountains', 'bgs/lawn/mountains', -900, -285);
	setLuaSpriteScrollFactor('mountains', 0.4, 0.4);
	scaleObject('mountains', 4, 4);

	makeLuaSprite('castle', 'bgs/lawn/castle', -900, -600);
	setLuaSpriteScrollFactor('castle', 0.8, 0.8);
	scaleObject('castle', 2, 2);

	makeLuaSprite('lawn', 'bgs/lawn/lawn', -900, -600);
	scaleObject('lawn', 2, 2);
	
	makeLuaSprite('flare', 'bgs/lawn/flare', -900, -600);
	scaleObject('flare', 4, 4);
	
	makeLuaSprite('bush', 'bgs/lawn/bush', -900, 140);
	scaleObject('bush', 4, 4);
	
	addLuaSprite('sky', false);
	addLuaSprite('mountains', false);
	addLuaSprite('castle', false);
	addLuaSprite('lawn', false);
	addLuaSprite('flare', true);
	addLuaSprite('bush', true);
end