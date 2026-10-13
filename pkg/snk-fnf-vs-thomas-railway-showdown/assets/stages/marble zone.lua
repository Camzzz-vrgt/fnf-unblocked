function onCreate()
	-- background shit
	setProperty('camGame.visible', false)
	makeLuaSprite('floor', 'marble zone/floor', -600, -400);
	setScrollFactor('floor', 1.0, 1.0);
	scaleObject('floor', 2, 2);

	makeLuaSprite('heat', 'marble zone/heat', -600, -400);
	setScrollFactor('heat', 0.9, 0.9);
	scaleObject('heat', 2, 2);

	makeLuaSprite('forest', 'marble zone/forest', -700, -400);
	setScrollFactor('forest', 1.1, 1.1);
	scaleObject('forest', 2.2, 2.2);

	makeLuaSprite('hills', 'marble zone/hills', -700, -400);
	setScrollFactor('hills', 1.2, 1.2);
	scaleObject('hills', 2.2, 2.2);

	makeLuaSprite('sky', 'marble zone/sky', -700, -400);
	setScrollFactor('sky', 1.3, 1.3);
	scaleObject('sky', 2.2, 2.2);

        makeAnimatedLuaSprite('tv lines','effects/tv lines', 0, 0)
        addAnimationByPrefix('tv lines','idle','idle',24,true)
	setObjectCamera('tv lines', 'other');
        setScrollFactor('tv lines', 0, 0)

	addLuaSprite('sky', false);
	addLuaSprite('hills', false);
	addLuaSprite('forest', false);
	addLuaSprite('floor', false);
	addLuaSprite('heat', true);
	addLuaSprite('tv lines', true);
end