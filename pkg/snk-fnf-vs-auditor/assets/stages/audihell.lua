local beatcounter = 0
local spacecounter = 0

local oppx = 269.5;
local oppy = 304.5;
local camoffs = 85;
local followchars = true;

function onCreate()

	makeLuaSprite('sky','hellbg/sky', -1600, -775);
	
	makeLuaSprite('beam','hellbg/beam', -2450, -1850);
	scaleObject('beam', 0.8, 0.8)
	setLuaSpriteScrollFactor('beam', 0.75, 0.75);

	makeLuaSprite('rocks','hellbg/floatingrocks', -450, -650);
	setLuaSpriteScrollFactor('rocks', 0.8, 0.8);
	
	
	makeLuaSprite('pillar1','hellbg/pillar', -1500, -600);
	setLuaSpriteScrollFactor('pillar1', 0.9, 0.9);
	
	makeLuaSprite('pillar2','hellbg/pillar2', -225, -250);
	setLuaSpriteScrollFactor('pillar2', 0.9, 0.9);

	makeLuaSprite('ground','hellbg/mainland', -1750, -200);

	makeAnimatedLuaSprite('spikes1', 'hellbg/spike patch', -725, 140);
	addAnimationByPrefix('spikes1','spike','spike patch 1', 24, false);

	makeAnimatedLuaSprite('spikes2', 'hellbg/spike patch', 700, 140);
	addAnimationByPrefix('spikes2','spike','spike patch 1', 24, false);
	scaleObject('spikes2', -1, 1)

	makeAnimatedLuaSprite('spikes3', 'hellbg/spike patch', -865, -90);
	addAnimationByPrefix('spikes3','spike','spike patch 2', 24, false);

	makeAnimatedLuaSprite('spikes4', 'hellbg/spike patch', 730, -90);
	addAnimationByPrefix('spikes4','spike','spike patch 2', 24, false);
	scaleObject('spikes4', -1, 1)

	makeAnimatedLuaSprite('dodgespikes', 'hellbg/dodgespikes', 950, 95);
	addAnimationByPrefix('dodgespikes','spike','dodge spikes', 24, false);
	scaleObject('dodgespikes', -1, 1)

	makeAnimatedLuaSprite('meteor1','hellbg/meteor', 600, -2000);
	setLuaSpriteScrollFactor('meteor1', 0.85, 0.85);
	addAnimationByPrefix('meteor1','burn','meteor thing', 24, true);

	makeAnimatedLuaSprite('meteor2','hellbg/meteor', -250, -1350);
	setLuaSpriteScrollFactor('meteor2', 0.7, 0.7);
	addAnimationByPrefix('meteor2','burn','meteor thing', 24, true);
	scaleObject('meteor2', -0.4, 0.4)

	makeAnimatedLuaSprite('meteor3','hellbg/meteor', 800, -1500);
	setLuaSpriteScrollFactor('meteor3', 0.75, 0.75);
	addAnimationByPrefix('meteor3','burn','meteor thing', 24, true);
	scaleObject('meteor3', -0.6, 0.6)

	makeLuaSprite('blackvg1', 'supremacy/blackvg', 0, 0);
	setObjectCamera('blackvg1', 'camOther');
	addLuaSprite('blackvg', false);
	setProperty('blackvg.alpha', 0);

	makeLuaSprite('black', 'gateway/black', -1600, -775);
	scaleObject('black', 4, 4)
	setProperty('black.alpha', 0);

	addLuaSprite('sky', false);

	addLuaSprite('meteor2', false);
	doTweenX('meteor2fallx', 'meteor2', 200, 12.5, 'linear');
	doTweenY('meteor2fally', 'meteor2', 1200, 12.5, 'linear');
	
    addLuaSprite('beam', false);

	addLuaSprite('meteor3', false);
	doTweenX('meteor3fallx', 'meteor3', 1250, 10, 'linear');
	doTweenY('meteor3fally', 'meteor3', 1200, 10, 'linear');

	addLuaSprite('rocks', false);
	addLuaSprite('pillar1', false);

	addLuaSprite('meteor1', false);
	doTweenX('meteor1fallx', 'meteor1', -450, 8, 'linear');
	doTweenY('meteor1fally', 'meteor1', 1200, 8, 'linear');

    addLuaSprite('pillar2', false);
	addLuaSprite('ground', false);

	addLuaSprite('spikes4', false)
	addLuaSprite('spikes3', false)
	addLuaSprite('dodgespikes', false)
	addLuaSprite('spikes2', true)
	addLuaSprite('spikes1', true)
	setProperty('spikes4.alpha', 0)
	setProperty('spikes3.alpha', 0)
	setProperty('dodgespikes.alpha', 0)
	setProperty('spikes2.alpha', 0)
	setProperty('spikes1.alpha', 0)
	
	doTweenY('rocksdown','rocks', -450, 6, 'quadInOut');

end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if getProperty('dad.curCharacter') == 'hellaudi' then

		cameraShake('camGame', 0.015, 0.2)
		cameraShake('camHUD', 0.005, 0.2)
		
		if noteData == 0 then
			--left
			setProperty('spikes3.alpha', 1)
			if isSustainNote == false then
			objectPlayAnimation('spikes3', 'spike', true)
			else
			objectPlayAnimation('spikes3', 'spike', false)
			end
		end

		if noteData == 1 then
			--down
			setProperty('spikes1.alpha', 1)
			if isSustainNote == false then
			objectPlayAnimation('spikes1', 'spike', true)
			else
			objectPlayAnimation('spikes1', 'spike', false)
			end
		end

		if noteData == 2 then
			--up
			setProperty('spikes4.alpha', 1)
			if isSustainNote == false then
			objectPlayAnimation('spikes4', 'spike', true)
			else
			objectPlayAnimation('spikes4', 'spike', false)
			end
		end

		if noteData == 3 then
			--right
			setProperty('spikes2.alpha', 1)
			if isSustainNote == false then
			objectPlayAnimation('spikes2', 'spike', true)
			else
			objectPlayAnimation('spikes2', 'spike', false)
			end
		end
	end
end

function onTweenCompleted(tag)

	if tag == 'meteor1fallx' then
		setProperty('meteor1.x', math.random(800, 300))
		setProperty('meteor1.y', -2000)
		runTimer('restartmeteor1', 0.1, 1)
	end

	if tag == 'meteor2fallx' then
		setProperty('meteor2.x', math.random(0, -500))
		setProperty('meteor2.y', -1350)
		runTimer('restartmeteor2', 0.1, 1)
	end

	if tag == 'meteor3fallx' then
		setProperty('meteor3.x', math.random(550, 1050))
		setProperty('meteor3.y', -1500)
		runTimer('restartmeteor3', 0.1, 1)
	end

	if tag == 'rocksdown' then
		--debugPrint('rocksup');
		doTweenY('rocksup','rocks', -650, 6, 'quadInOut');
	end

	if tag == 'rocksup' then
		--debugPrint('rocksdown');
		doTweenY('rocksdown','rocks', -450, 6, 'quadInOut');
	end
end

function onTimerCompleted(tag)
	
	if tag == 'restartmeteor1' then
		doTweenX('meteor1fallx', 'meteor1', getProperty('meteor1.x') - 1500, 8, 'linear')
		doTweenY('meteor1fally', 'meteor1', 3600, 8, 'linear')
	end

	if tag == 'restartmeteor2' then
		doTweenX('meteor2fallx', 'meteor2', getProperty('meteor2.x') + 450, 12.5, 'linear')
		doTweenY('meteor2fally', 'meteor2', 1200, 12.5, 'linear')
	end

	if tag == 'restartmeteor3' then
		doTweenX('meteor3fallx', 'meteor3', getProperty('meteor3.x') + 1500, 10, 'linear')
		doTweenY('meteor3fally', 'meteor3', 1200, 10, 'linear')
	end
end	

function onEvent(name, value1, value2)

	if name == 'spaceprompt' then

		--value1 is time in beats until death
		--value2 is times to press space to avoid death

		makeAnimatedLuaSprite('spaceprompt', 'hellbg/spaceprompt', 510, 395)
		addAnimationByPrefix('spaceprompt', 'idle', 'spacebar popup', 24, true)
		setObjectCamera('spaceprompt', 'camHUD')
		scaleObject('spaceprompt', 0.5, 0.5)
		addLuaSprite('spaceprompt')

		beatcounter = 0
		beatcounter = beatcounter + value1

		makeLuaText('beatcounter', beatcounter, 75, 600, 340)
		setObjectCamera('beatcounter', 'camHUD')
		setTextFont('beatcounter', 'impact.ttf')
		setTextSize('beatcounter', 50)
		--setTextBorder('beatcounter', 5, 0000)
		setTextColor('beatcounter', '0000')
		addLuaText('beatcounter')

		spacecounter = 0
		spacecounter = spacecounter + value2
		--debugPrint('spacecounter: ', spacecounter)
		makeLuaText('spacecounter', spacecounter, 75, 600, 525)
		setObjectCamera('spacecounter', 'camHUD')
		setTextFont('spacecounter', 'impact.ttf')
		setTextSize('spacecounter', 50)
		--setTextBorder('spacecounter', 20, 0000)
		setTextColor('spacecounter', '0000')
		addLuaText('spacecounter')

		if curBeat == 4 then
			setProperty('beatcounter.y', 300)
			setProperty('spacecounter.y', 515)

			makeLuaText('youhave', 'YOU HAVE', 200, 535, 275)
			setTextSize('youhave', 30)
			addLuaText('youhave')

			makeLuaText('beatstohit', 'BEATS TO HIT', 275, 510, 360)
			setTextSize('beatstohit', 30)
			addLuaText('beatstohit')

			makeLuaText('times', 'TIMES', 125, 580, 575)
			setTextSize('times', 30)
			addLuaText('times')
		
		end

	end

	if name == 'spacepress' then
		if spacecounter > 0 then

			spacecounter = spacecounter - 1
			setTextString('spacecounter', spacecounter)
			--debugPrint('pressed space')
			--debugPrint('spacecounter: ', spacecounter)

			if spacecounter == 0 then

				beatcounter = 0
				spacecounter = 0
				removeLuaSprite('spaceprompt', true)
				removeLuaText('beatcounter', true)
				removeLuaText('spacecounter', true)
				
				removeLuaText('youhave', true)
				removeLuaText('beatstohit', true)
				removeLuaText('times', true)
				
				-- play animation for spikes here and bf dodge anim
				triggerEvent('Play Animation', 'dodge', 'BF');
				objectPlayAnimation('dodgespikes', 'spike', true)
				setProperty('dodgespikes.alpha', 1)
			end
		end
	end
end

function onUpdate()

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

	if botPlay == true then
		debugPrint('fucking cheater')
		triggerEvent('spacepress', 0, 0)
	end

	if keyJustPressed('space') == true then
		triggerEvent('spacepress', 0, 0)
	end

	if getProperty('health') >= 1 then
		setProperty('boyfriend.idleSuffix', '');
	else
		if getProperty('health') < 0.5 then
			setProperty('boyfriend.idleSuffix', '-alt2');
		else
			setProperty('boyfriend.idleSuffix', '-alt1');
		end
	end
end

function onStepHit()
	if curStep == 1088 then
		doTweenAlpha('blackalpha', 'black', 1, 0.4, 'quadInOut');
	end
	
	if curStep == 1152 or curStep == 1728 then
		cameraFlash('camother', '000000', 1, true);
		doTweenZoom('startzoom', 'camGame', 0.5, 1, 'quadInOut');
		setProperty('defaultCamZoom', 0.5);
	end

	if curStep == 1408 or curStep == 2240 then
		doTweenZoom('startzoom', 'camGame', 0.4, 1, 'quadInOut');
		setProperty('defaultCamZoom', 0.4);
	end

	if curStep == 2624 then 
		cameraFlash('camother', '000000', 1, true);
	end

	if curStep == 2687 then
		addLuaSprite('black', true);
		doTweenAlpha('blackalpha', 'black', 1, 3, 'linear');
		doTweenAlpha('camhudalpha', 'camHUD', 0, 3, 'linear');

		makeAnimatedLuaSprite('audieyes', 'characters/auditor/hellaudi', getProperty('dad.x') + 304, getProperty('dad.y') + 222);
		addAnimationByPrefix('audieyes', 'idle', 'i2dle eyes', 24, true);
		addLuaSprite('audieyes', true);

		characterPlayAnim('dad', 'idle', true);
	end

	if curStep == 2896 then
		doTweenAlpha('eyesalpha', 'audieyes', 1, 3, 'linear');
	end
end

function onBeatHit()
	if beatcounter > 0 then
		beatcounter = beatcounter - 1
		--debugPrint('beatcounter: ', beatcounter)
		setTextString('beatcounter', beatcounter)

		if beatcounter == 0 then
			if spacecounter > 0 then
				--debugPrint('did a thing')
				setProperty('health', -1)
				playSound('ex_death')
			end
		end
	end

	if curBeat == 4 then
		triggerEvent('spaceprompt', 28, 12)
	end

	if curBeat == 56 then
		triggerEvent('spaceprompt', 8, 3)
	end

	if curBeat == 64 then
		triggerEvent('spaceprompt', 16, 12)
	end

	if curBeat == 80 then
		triggerEvent('spaceprompt', 16, 12)
	end

	if curBeat == 130 then
		triggerEvent('spaceprompt', 6, 2)
	end
	
	if curBeat == 144 then
		triggerEvent('spaceprompt', 8, 4)
	end

	if curBeat == 160 then
		triggerEvent('spaceprompt', 8, 4)
	end

	if curBeat == 220 then
		triggerEvent('spaceprompt', 4, 1)
	end

	if curBeat == 236 then
		triggerEvent('spaceprompt', 4, 1)
	end

	if curBeat == 252 then
		triggerEvent('spaceprompt', 4, 1)
	end

	if curBeat == 272 then
		triggerEvent('spaceprompt', 8, 4)
	end

	if curBeat == 282 then
		triggerEvent('spaceprompt', 6, 2)
	end

	if curBeat == 290 then
		triggerEvent('spaceprompt', 10, 4)
	end

	if curBeat == 306 then
		triggerEvent('spaceprompt', 10, 4)
	end

	if curBeat == 336 then
		triggerEvent('spaceprompt', 12, 6)
	end

	if curBeat == 364 then
		triggerEvent('spaceprompt', 4, 1)
	end

	if curBeat == 416 then
		triggerEvent('spaceprompt', 8, 2)
	end

	if curBeat == 424 then
		triggerEvent('spaceprompt', 8, 4)
	end

	if curBeat == 432 then
		triggerEvent('spaceprompt', 8, 2)
	end

	if curBeat == 440 then
		triggerEvent('spaceprompt', 8, 3)
	end

	if curBeat == 448 then
		triggerEvent('spaceprompt', 8, 4)
	end

	if curBeat == 456 then
		triggerEvent('spaceprompt', 8, 4)
	end

	if curBeat == 464 then
		triggerEvent('spaceprompt', 8, 6)
	end

	if curBeat == 472 then
		triggerEvent('spaceprompt', 8, 6)
	end

	if curBeat == 480 then
		triggerEvent('spaceprompt', 8, 6)
	end

	if curBeat == 488 then
		triggerEvent('spaceprompt', 8, 6)
	end

	if curBeat == 528 then
		triggerEvent('spaceprompt', 8, 6)
	end

	if curBeat == 536 then
		triggerEvent('spaceprompt', 8, 6)
	end

	if curBeat == 544 then
		triggerEvent('spaceprompt', 8, 6)
	end

	if curBeat == 552 then
		triggerEvent('spaceprompt', 8, 4)
	end

	if curBeat == 560 then
		triggerEvent('spaceprompt', 8, 6)
	end

	if curBeat == 576 then
		triggerEvent('spaceprompt', 8, 6)
	end

	if curBeat == 636 then
		triggerEvent('spaceprompt', 4, 2)
	end

	if curBeat == 656 then
		triggerEvent('spaceprompt', 16, 16)
	end
end