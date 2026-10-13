function onCreate()
	-- background shit
	makeLuaSprite('snowsix', 'snowsix', -600, -300); 
	setScrollFactor('snowsix', 0.3, 0.3);

	makeLuaSprite('snowfive', 'snowfive', -500, -300);
	setScrollFactor('snowfive', 0.5, 0.5);
      scaleObject('snowfive', 0.9, 0.9);

	makeLuaSprite('snowfour', 'snowfour', -600, -300);
	setScrollFactor('snowfour', 0.6, 0.6);

	makeLuaSprite('snowthree', 'snowthree', -600, -300);
	setScrollFactor('snowthree', 0.8, 0.8);

	makeLuaSprite('snowtwo', 'snowtwo', -600, -300);
	setScrollFactor('snowtwo', 0.9, 0.9);

	makeLuaSprite('snowone', 'snowone', -600, -300);
	setScrollFactor('snowone', 1.0, 1.0);

	makeAnimatedLuaSprite('snowfall','snowfall', -50, -80)
	addAnimationByPrefix('snowfall', 'idle', 'idle', 24, true)
	objectPlayAnimation('snowfall','idle',false)
	setObjectCamera('snowfall', 'HUD')
	scaleObject('snowfall', 1.1, 1.1);

	makeLuaSprite('blueframe', 'blueframe', 0, 0);
	setScrollFactor('blueframe', 1.0, 1.0);
	setObjectCamera('blueframe', 'HUD')

	addLuaSprite('snowsix', false);
	addLuaSprite('snowfive', false);
	addLuaSprite('snowfour', false);
	addLuaSprite('snowthree', false);
	addLuaSprite('snowtwo', false);
	addLuaSprite('snowone', false);
	addLuaSprite('snowfall', true);
	addLuaSprite('blueframe', true)
end