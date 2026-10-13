local oppx = 300;
local oppy = 423;
local camoffs = 70;
local followchars = true;

function onCreate()

	--cache shit

	precacheImage('sanford_fight');
	precacheImage('deimos_fight');

	-- background shit

	makeLuaSprite('sky', 'supremacy/sup sky', -1000, -925);
	scaleObject('sky', 1.8, 1.8);
	setLuaSpriteScrollFactor('sky', 0.9, 0.9);

	makeLuaSprite('ground', 'supremacy/sup ground', -1100, -925);
	scaleObject('ground', 1.8, 1.8);
	
	makeLuaSprite('house', 'supremacy/sup house', -1400, -575);
	scaleObject('house', 1.8, 1.8);

	if not lowQuality then
		makeLuaSprite('rocks', 'supremacy/sup rocks', -900, -700);	
		scaleObject('rocks', 1.8, 1.8);
		setLuaSpriteScrollFactor('rocks', 0.8, 0.8);
	
		makeLuaSprite('fore', 'supremacy/sup fore', -1375, -600);
		scaleObject('fore', 1.8, 1.8);
		setLuaSpriteScrollFactor('fore', 1.4, 1.4);

			--deimos and sanford fights VVVV

		makeAnimatedLuaSprite('sanford', 'supremacy/sanford_fight', -950, -225);
		addAnimationByPrefix('sanford', 'nothing', 'sanford nothing', 24, false);
		addAnimationByPrefix('sanford', 'fight', 'sanford agent fight', 24, false);
		scaleObject('sanford', 0.8, 0.8);

		makeAnimatedLuaSprite('deimos', 'supremacy/deimos_fight', -750, -110);
		addAnimationByPrefix('deimos', 'nothing', 'deimos nothing', 24, false);
		addAnimationByPrefix('deimos', 'fight', 'agent deimos fight', 24, false);
		scaleObject('deimos', 0.8, 0.8);
		
			--deimos and sanford bops VVVV

		makeAnimatedLuaSprite('deibop', 'supremacy/deimos_bop', 725, -375);
		addAnimationByPrefix('deibop', 'nothing', 'deimos bop nothing', 24, false);
		addAnimationByPrefix('deibop', 'bop', 'deimos bop', 24, true);
		scaleObject('deibop', 1.2, 1.2);

		makeAnimatedLuaSprite('sanbop', 'supremacy/sanford_bop', 225, -375);
		addAnimationByPrefix('sanbop', 'nothing', 'sanford bop nothing', 24, false);
		addAnimationByPrefix('sanbop', 'bop', 'sanford bop', 24, true);
		scaleObject('sanbop', 1.2, 1.2);

		makeLuaSprite('red', 'supremacy/bglight', -2500, -3100);
		scaleObject('red', 1.7, 1.7);
		
	end

	makeLuaSprite('blackvg1', 'supremacy/blackvg', 0, 0);
	setObjectCamera('blackvg1', 'camOther');
	makeLuaSprite('blackvg2', 'supremacy/blackvg', 0, 0);
	setObjectCamera('blackvg2', 'camOther');

	makeAnimatedLuaSprite('stomp', 'supremacy/breakfloor', -1250, 350);
	addAnimationByPrefix('stomp', 'crack', 'breakfloor', 24, false);
	
	addLuaSprite('sky', false);
	addLuaSprite('rocks', false);
	addLuaSprite('ground', false);

	addLuaSprite('sanford', false);
	addLuaSprite('deimos', false);
	objectPlayAnimation('sanford','nothing', false);
	objectPlayAnimation('deimos','nothing', false);

	addLuaSprite('sanbop', false);
	addLuaSprite('deibop', false);
	objectPlayAnimation('sanbop','nothing', false);
	objectPlayAnimation('deibop','nothing', false);
	
	addLuaSprite('house', false);
	addLuaSprite('fore', true);

	addLuaSprite('red', true);

	doTweenY('rocksup','rocks', -850, 4, 'quadInOut');

end

function onTweenCompleted(tag)

	if tag == 'rocksdown' then
		--debugPrint('rocksup');
		doTweenY('rocksup','rocks', -850, 4, 'quadInOut');
	end

	if tag == 'rocksup' then
		--debugPrint('rocksdown');
		doTweenY('rocksdown','rocks', -700, 4, 'quadInOut');
	end
end

function onBeatHit()--for every beat
	--debugPrint("CurBeat:",getProperty("curBeat"))

	--everything that happens during the song is here basically

	if curBeat == 1 then
		objectPlayAnimation('deimos','fight', false);
	end

	if curBeat == 60 then
		objectPlayAnimation('sanford','fight', false);
	end

	if curBeat == 100 then
		objectPlayAnimation('deimos','fight', false);
	end

	if curBeat == 160 then
		objectPlayAnimation('sanford','fight', false);
	end

	if curBeat == 259 then
		playSound('bass',1);
		addLuaSprite('blackvg1', true);
		setProperty('blackvg1.alpha', 0);
		doTweenAlpha('vgalpha', 'blackvg1', 1, 0.5, 'quadIn');
	end

	if curBeat == 261 then -- 261
		addLuaSprite('stomp', false);
		objectPlayAnimation('stomp','crack', false);
		playSound('stomp', 1);
		playSound('stomploud', 1);
		cameraShake(game, 0.035, 0.5);

		addLuaSprite('blackvg2', true);
		doTweenAlpha('vgalpha', 'blackvg1', 0, 0.25, 'linear');
		doTweenAlpha('vgalpha2', 'blackvg2', 0, 0.25, 'linear');
	end

	if curBeat == 200 then
		objectPlayAnimation('deimos','fight', false);
	end

	if curBeat == 260 then
		objectPlayAnimation('sanford','fight', false);
	end

	if curBeat == 300 then
		objectPlayAnimation('sanbop','bop', false);
		objectPlayAnimation('deibop','bop', false);
	end
end

 function onStepHit()
	
	if curStep == 1039 then
		setProperty('defaultCamZoom',0.85);
	end

	if curStep == 1051 then
		setProperty('defaultCamZoom',0.5);
	end
	
	-- if getProperty("dad.animation.curAnim.name") ~= 'idle' then
	-- 	debugPrint("curStep:",getProperty("dad.animation.curAnim.name"))
	-- end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    
	--make screen shake when auditor sings; stronger screenshake after he stomps the ground

	if curBeat <= 261 then
		cameraShake('camGame', 0.015, 0.1);
	else
		cameraShake('camGame', 0.025, 0.1);
	end
end

function onUpdate()
	if getProperty('health') >= 1 then
		setProperty('boyfriend.idleSuffix', '');
	else
		if getProperty('health') < 0.5 then
			setProperty('boyfriend.idleSuffix', '-alt2');
		else
			setProperty('boyfriend.idleSuffix', '-alt1');
		end
	end

	-- if keyJustPressed('space') == true then
	-- 	debugPrint(getProperty('camFollow.x'), getProperty('camFollow.y'));
	-- end

	if followchars == true then
		if mustHitSection == false then
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',oppx-camoffs,oppy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',oppx+camoffs,oppy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',oppx,oppy-camoffs)
			end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',oppx,oppy+camoffs)
			end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',oppx,oppy);
			end
		else
			triggerEvent('Camera Follow Pos','','');
		end
	else
		triggerEvent('Camera Follow Pos','','');
	end
end