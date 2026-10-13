function onCreate()
	-- background shit
	makeLuaSprite('sky', 'htf/sky', -950, -450);
	setScrollFactor('sky', 0.9, 0.9);
	
	makeLuaSprite('grass', 'htf/grass', -1050, -450);
	setScrollFactor('grass', 1, 1);
	--scaleObject('grass', 1.1, 1.1);
	
	

	makeAnimatedLuaSprite('flakyRussell', 'htf/FlakyRussellBG2', -350, 450);
	addAnimationByPrefix('flakyRussell', 'idle', 'Flaky Russell jive russell mad', 24, false);
	objectPlayAnimation('flakyRussell', 'idle');
		
	makeAnimatedLuaSprite('flakyRussellW', 'htf/FlakyRussellBG2', -350, 450);
	addAnimationByPrefix('flakyRussellW', 'idle', 'Flaky Russell worried', 24, false);
	objectPlayAnimation('flakyRussellW', 'idle');
		
	makeAnimatedLuaSprite('fireworksB', 'htf/fireworks', -300, 0);
	addAnimationByPrefix('fireworksB', 'doThing', 'firework blue', 24, true);
	objectPlayAnimation('fireworksB', 'doThing');
    scaleObject('fireworksB', 0.8, 0.8);
		
    makeAnimatedLuaSprite('fireworksB2', 'htf/fireworks', 700, 100);
	addAnimationByPrefix('fireworksB2', 'doThing', 'firework blue', 24, true);
	objectPlayAnimation('fireworksB2', 'doThing');
    scaleObject('fireworksB', 0.8, 0.8);
		
	makeAnimatedLuaSprite('fireworksG', 'htf/fireworks', 500, 0);
	addAnimationByPrefix('fireworksG', 'doThing', 'firework gold', 24, true);
	objectPlayAnimation('fireworksG', 'doThing');
    scaleObject('fireworksG', 0.8, 0.8);
		
	makeAnimatedLuaSprite('fireworksG2', 'htf/fireworks', -200, 200);
	addAnimationByPrefix('fireworksG2', 'doThing', 'firework gold', 24, true);
	objectPlayAnimation('fireworksG2', 'doThing');
    scaleObject('fireworksG', 0.8, 0.8);
		
	makeAnimatedLuaSprite('fireworksP', 'htf/fireworks', 1450, 0);
	addAnimationByPrefix('fireworksP', 'doThing', 'firework pink', 24, true);
	objectPlayAnimation('fireworksP', 'doThing');
    scaleObject('fireworksP', 0.8, 0.8);
		
	makeAnimatedLuaSprite('fireworksP2', 'htf/fireworks', 900, 200);
	addAnimationByPrefix('fireworksP2', 'doThing', 'firework pink', 24, true);
	objectPlayAnimation('fireworksP2', 'doThing');
    scaleObject('fireworksP', 0.8, 0.8);
	   

	if dadName == 'flippy-minie' then
		makeLuaSprite('flish', 'htf/shadow', 240, 850);
		setScrollFactor('flish', 1, 1);
		scaleObject('flish', 1.4, 1);
	else
		makeLuaSprite('flish', 'htf/shadow', 245, 850);
		setScrollFactor('flish', 1, 1);
		scaleObject('flish', 1, 1);
	end
	
	makeLuaSprite('bsh', 'htf/shadow', 900, 810);
	setScrollFactor('bsh', 1, 1);

	makeLuaSprite('gsh', 'htf/shadow', 650, 690);
	setScrollFactor('gsh', 1, 1);
	scaleObject('gsh', 0.9, 0.9);

	makeLuaSprite('flash', 'htf/shadow', 20, 720);
	setScrollFactor('flash', 1, 1);
	scaleObject('flash', 1, 1);

	makeLuaSprite('rsh', 'htf/shadow', -350, 770);
	setScrollFactor('rsh', 1, 1);
	scaleObject('rsh', 1.4, 1);

	precacheImage('htf/flippy_flip_out');
	makeAnimatedLuaSprite('flipped-out', 'htf/flippy_flip_out', getCharacterX('dad'), getCharacterY('dad') + 260);
	addAnimationByPrefix('flipped-out', 'doThing', 'FLIPPY Flip Out', 24, false);
	objectPlayAnimation('flipped-out', 'doThing');
	setProperty('flipped-out.visible', false);

    precacheImage('htf/cooloutline');
	makeLuaSprite('theblack', 'htf/cooloutline', 0, 0);
	setProperty('theblack.alpha', '0');
	setObjectCamera('theblack', 'other');

    precacheImage('htf/Red_Pulse');
	makeAnimatedLuaSprite('thered', 'htf/Red_Pulse', 0, 0);
	addAnimationByPrefix('thered', 'idle', 'Red Pulsing', 24, false);
	setGraphicSize('thered', 1280, 720);
	objectPlayAnimation('thered', 'idle');
	setProperty('thered.alpha', '0');
	setObjectCamera('thered', 'other');

	addCharacterToList('flippy-minie', 'dad');

	addLuaSprite('sky', false);
	addLuaSprite('fireworksB', false);
	addLuaSprite('fireworksG', false);
	addLuaSprite('fireworksP', false);
	addLuaSprite('fireworksB2', false);
	addLuaSprite('fireworksG2', false);
	addLuaSprite('fireworksP2', false);
	addLuaSprite('grass', false);
	addLuaSprite('flash', false);
	addLuaSprite('rsh', false);
	addLuaSprite('flish', false);
	addLuaSprite('shadowmove', false);
	addLuaSprite('bsh', false);
	addLuaSprite('gsh', false);
	addLuaSprite('flakyRussell', false);
	addLuaSprite('flakyRussellW', false);
	addLuaSprite('flipped-out', true);
	addLuaSprite('theblack', true);
	addLuaSprite('thered', true);

	
	setProperty('flakyRussellW.visible', false);
	setProperty('fireworksB.visible', false);
	setProperty('fireworksG.visible', false);
	setProperty('fireworksP.visible', false);
	setProperty('fireworksB2.visible', false);
	setProperty('fireworksG2.visible', false);
	setProperty('fireworksP2.visible', false);
	
end

function onBeatHit()
	objectPlayAnimation('flakyRussell', 'idle', true);
	objectPlayAnimation('flakyRussellW', 'idle', true);
	objectPlayAnimation('thered', 'idle', true);
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == '1' then
			setProperty('flakyRussell.visible', true);
			setProperty('flakyRussellW.visible', false);
		end
		if value1 == 'move shadow' then
		    doTweenX('flishb2', 'flish.scale', 1.4, 0.4, 'circOut')
            doTweenX('flishb','flish',275,0.4,'circOut')
		end
		if value1 == '2' then
			setProperty('flakyRussell.visible', false);
			setProperty('flakyRussellW.visible', true);
		end
		if value1 == 'fireworks blue on' then
			setProperty('fireworksB.visible', true);
		end
			if value1 == 'fireworks blue off' then
            doTweenAlpha('fireworks', 'fireworksB', 0, 0.2, 'linear');
		end
			if value1 == 'fireworks gold on' then
			setProperty('fireworksG.visible', true);
		end
			if value1 == 'fireworks gold off' then
            doTweenAlpha('fireworks', 'fireworksG', 0, 0.3, 'linear');
		end
				if value1 == 'fireworks pink on' then
			setProperty('fireworksP.visible', true);
		end
			if value1 == 'fireworks pink off' then
            doTweenAlpha('fireworks', 'fireworksP', 0, 0.3, 'linear');
		end
				if value1 == 'fireworks blue 2 on' then
			setProperty('fireworksB2.visible', true);
		end
			if value1 == 'fireworks blue 2 off' then
            doTweenAlpha('fireworks', 'fireworksB2', 0, 0.2, 'linear');
		end
			if value1 == 'fireworks gold 2 on' then
			setProperty('fireworksG2.visible', true);
		end
			if value1 == 'fireworks gold 2 off' then
            doTweenAlpha('fireworks', 'fireworksG2', 0, 0.3, 'linear');
		end
				if value1 == 'fireworks pink 2 on' then
			setProperty('fireworksP2.visible', true);
		end
			if value1 == 'fireworks pink 2 off' then
            doTweenAlpha('fireworks', 'fireworksP2', 0, 0.3, 'linear');
		end
	end
end