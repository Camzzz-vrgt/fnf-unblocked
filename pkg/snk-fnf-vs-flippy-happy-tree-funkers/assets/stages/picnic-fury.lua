function onCreate()
	-- background shit
	makeLuaSprite('sky', 'htf/sky', -950, -450);
	setScrollFactor('sky', 0.9, 0.9);
	
	makeLuaSprite('grass', 'htf/grass', -1050, -450);
	setScrollFactor('grass', 1, 1);
	--scaleObject('grass', 1.1, 1.1);
	
	makeLuaSprite('russellDead', 'htf/deadAsHell', -250, 650);
    setScrollFactor('russellDead', 1, 1);
	scaleObject('russellDead', 0.9, 0.9);

	makeLuaSprite('flish', 'htf/shadow', 240, 850);
	setScrollFactor('flish', 1, 1);
	scaleObject('flish', 1.4, 1);

	makeLuaSprite('bsh', 'htf/shadow', 900, 810);
	setScrollFactor('bsh', 1, 1);

	makeLuaSprite('gsh', 'htf/shadow', 650, 690);
	setScrollFactor('gsh', 1, 1);
	scaleObject('gsh', 0.9, 0.9);

	makeLuaSprite('flash', 'htf/shadow', -50, 800);
	setScrollFactor('flash', 1, 1);
	scaleObject('flash', 1, 1.7);

	makeLuaSprite('theblack', 'htf/cooloutline', 0, 0);
	setProperty('theblack.alpha', '0');
	setObjectCamera('theblack', 'other');

	makeAnimatedLuaSprite('thered', 'htf/Red_Pulse', 0, 0);
	addAnimationByPrefix('thered', 'idle', 'Red Pulsing', 24, false);
	setGraphicSize('thered', 1280, 720);
	objectPlayAnimation('thered', 'idle');
	setProperty('thered.alpha', '0');
	setObjectCamera('thered', 'other');
	
	addLuaSprite('sky', false);
	addLuaSprite('grass', false);
	addLuaSprite('flash', false);
	addLuaSprite('flish', false);
	addLuaSprite('bsh', false);
	addLuaSprite('gsh', false);
	addLuaSprite('russellDead', false);
	addLuaSprite('theblack', true);
	addLuaSprite('thered', true);
	
	
end

function onBeatHit()
	objectPlayAnimation('thered', 'idle', true);
end
