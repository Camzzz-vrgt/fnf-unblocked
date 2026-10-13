function onCreate()
    setProperty('skipCountdown', true)
	makeLuaSprite('shed', 'melting/HOLY SHIT A SHED', -600, -500);
	setScrollFactor('shed', 1.0, 1.0);
	scaleObject('shed', 1.1, 1.1);

	makeLuaSprite('windows', 'melting/WINDOWS', -600, -500);
	setScrollFactor('windows', 1.0, 1.0);
	scaleObject('windows', 1.1, 1.1);

	makeLuaSprite('window shine', 'melting/window shine idk', -600, -500);
	setScrollFactor('window shine', 1.0, 1.0);
	scaleObject('window shine', 1.1, 1.1);

        makeAnimatedLuaSprite('boiler text','melting/boiler text', -10, -300)
        addAnimationByPrefix('boiler text','idle','idle',24,true)
        addAnimationByPrefix('boiler text','fire','fire',24,true)
        addAnimationByPrefix('boiler text','eyes','eyes',24,true)
        addAnimationByPrefix('boiler text','extinguish','extinguish',24,true)
        objectPlayAnimation('boiler text','idle',false)
	setObjectCamera('boiler text', 'hud');
        setScrollFactor('boiler text', 0, 0)
	scaleObject('boiler text', 0.65, 0.65);

        makeAnimatedLuaSprite('static','effects/static', -0, 0)
        addAnimationByPrefix('static','idle','idle',24,true)
	setObjectCamera('static', 'hud');
        setScrollFactor('static', 0, 0)

	makeLuaSprite('intro card', 'melting/intro card', -70, -130);
	setObjectCamera('intro card', 'hud');
        setScrollFactor('intro card', 0, 0)
	scaleObject('intro card', 0.3, 0.3);

	makeLuaSprite('smoke 1', 'melting/smoke/smoke 1', -600, -500);
	setScrollFactor('smoke 1', 1.2, 1.2);
	scaleObject('smoke 1', 1.1, 1.1);

	makeLuaSprite('smoke 2', 'melting/smoke/smoke 2', -600, -500);
	setScrollFactor('smoke 2', 1.2, 1.2);
	scaleObject('smoke 2', 1.1, 1.1);

	makeLuaSprite('smoke 3', 'melting/smoke/smoke 3', -600, -500);
	setScrollFactor('smoke 3', 1.2, 1.2);
	scaleObject('smoke 3', 1.1, 1.1);

	makeLuaSprite('smoke 4', 'melting/smoke/smoke 4', -600, -500);
	setScrollFactor('smoke 4', 1.2, 1.2);
	scaleObject('smoke 4', 1.1, 1.1);

	makeLuaSprite('smoke 5', 'melting/smoke/smoke 5', -600, -500);
	setScrollFactor('smoke 5', 1.2, 1.2);
	scaleObject('smoke 5', 1.1, 1.1);

	makeLuaSprite('boiler gameover', 'melting/boilergameover', -90, -330);
	setObjectCamera('boiler gameover', 'hud');
        setScrollFactor('boiler gameover', 0, 0)
	scaleObject('boiler gameover', 0.3, 0.3);

	setProperty('smoke 1.visible', false)
	setProperty('smoke 2.visible', false)
	setProperty('smoke 3.visible', false)
	setProperty('smoke 4.visible', false)
	setProperty('smoke 5.visible', false)
	setProperty('boiler text.visible', false)
	setProperty('intro card.visible', true)
	setProperty('boiler gameover.visible', false)
	setProperty('static.visible', true)

	addLuaSprite('shed', false);
	addLuaSprite('windows', false);
	addLuaSprite('window shine', false);
	addLuaSprite('smoke 1', true);
	addLuaSprite('smoke 2', true);
	addLuaSprite('smoke 3', true);
	addLuaSprite('smoke 4', true);
	addLuaSprite('smoke 5', true);
	addLuaSprite('boiler text', true);
	addLuaSprite('intro card', true);
	addLuaSprite('static', true);
	addLuaSprite('boiler gameover', true);
	close(true);
end

function onGameOverStart()
	-- You died! Called every single frame your health is lower (or equal to) zero
	--return Function_Stop
	setScrollFactor(getPropertyFromClass('GameOverSubstate', 'boyfriend'), 0, 0)
	return Function_Continue;
end