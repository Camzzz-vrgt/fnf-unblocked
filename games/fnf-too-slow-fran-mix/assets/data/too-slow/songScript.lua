function onCreate()
	precacheImage('characters/BF_New')
	precacheImage('characters/SonicEXA')

	makeLuaSprite('dark', 'Blackness', -900, -500);
	scaleObject('dark', 3, 3);
	setScrollFactor('dark', 0, 0);
	setProperty('dark.alpha', 0);
	addLuaSprite('dark', true);

	makeLuaSprite('black', 'Blackness', -500, -400);
	scaleObject('black', 2, 2);
	setScrollFactor('black', 0, 0);
	addLuaSprite('black', false);
	
	makeLuaSprite('light', 'backlight', 400, 200);
	setScrollFactor('light', 1, 1);
	addLuaSprite('light', false);
	setProperty('light.alpha', 0);
end

function onCreatePost()
	makeAnimatedLuaSprite('stat', 'Phase3Static', 0, 0);
	addAnimationByPrefix('stat', 'play', 'play', 22, false)
	scaleObject('stat', 3.3, 3.3);
	setObjectCamera('stat', 'other');
	screenCenter('stat', 'xy');
	addLuaSprite('stat', true);
	setProperty('stat.alpha', 0);

	makeLuaSprite('image1', 'soul_tails', 100, 200);
	setObjectCamera('image1', 'other');
	setProperty('image1.alpha', 0);
	
	makeLuaSprite('image2', 'soul_knuckles', 800, 200);
	setObjectCamera('image2', 'other');
	setProperty('image2.alpha', 0);

	makeLuaSprite('image3', 'soul_eggman', 130, 200);
	setObjectCamera('image3', 'other');
	setProperty('image3.alpha', 0);

	makeLuaSprite('image4', 'soul_all', 350, 130);
	setObjectCamera('image4', 'other');
	setProperty('image4.alpha', 0);

	makeLuaSprite('red', 'red', -500, -200);
	scaleObject('red', 2, 2);
	setScrollFactor('red', 0, 0);
	setProperty('red.alpha', 0);
	addLuaSprite('red', false);

	makeLuaSprite('drown', 'Drowned', 0, 0);
	setObjectCamera('drown', 'other');
	screenCenter('drown', 'xy');
	setProperty('drown.alpha', 0);
end

function onStepHit()
	if curStep == 274 then --dark
		doTweenAlpha('blackAlphaTween', 'dark', 1, 2, 'linear');
	end
	if curStep == 278 then --stat
		objectPlayAnimation('stat', 'play', true);
		setProperty('stat.alpha', 1);
	end
	if curStep == 288 then
		removeLuaSprite('stat');
		setProperty('boyfriend.color',getColorFromHex('000000'))
		setProperty('dark.alpha', 0);
		setProperty('iconP2.visible', false)
		setProperty('dad.visible', false)
		for i = 0,3 do
			setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
		end
	end
	if curStep == 320 then --red light
		doTweenAlpha('redish0', 'light', 1, 0.1, 'linear')
	end
	if curStep == 432 then
		doTweenAlpha('redishgoes0', 'light', 0, 2, 'linear')
	end
	if curStep == 448 then --visions
		addLuaSprite('image1', true);
		doTweenAlpha('tailscream', 'image1', 1, 0.1, 'linear')
		doTweenAlpha('redish1', 'light', 1, 0.1, 'linear')
	end
	if curStep == 464 then --visions
		addLuaSprite('image2', true);
		doTweenAlpha('knuckscream', 'image2', 1, 0.1, 'linear')
		doTweenAlpha('redish2', 'light', 1, 0.1, 'linear')
	end
	if curStep == 480 then --visions
		addLuaSprite('image3', true);
		doTweenAlpha('eggscream', 'image3', 1, 0.1, 'linear')
		doTweenAlpha('redish3', 'light', 1, 0.1, 'linear')
	end
	if curStep == 496 then --visions
		addLuaSprite('image4', true);
		doTweenAlpha('allapp', 'image4', 1, 0.1, 'linear')
		doTweenAlpha('redish4', 'light', 1, 0.1, 'linear')
	end
	if curStep == 512 then --dark
		setProperty('dark.alpha', 1);
		removeLuaSprite('stat')
		removeLuaSprite('black')
		doTweenAlpha('hudFunne', 'camHUD', 0, 0.1, 'linear')
		doTweenColor('bfColorTween5', 'boyfriend', '0xFFFFFFFF', 0.2, 'linear');
	end
	if curStep == 576 then
		if getPropertyFromClass('ClientPrefs', 'opponentStrums') == true then --check if the client hid the opponents notes
			if middlescroll then
				for i = 0,3 do
				setPropertyFromGroup('opponentStrums', i, 'alpha', 0.4)
				end
			else
				for i = 0,3 do
				setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
				end
			end
		end
		setProperty("health", 1);
		setProperty('dark.alpha', 0);
		setProperty('dad.visible', true)
		doTweenAlpha('hudFunne', 'camHUD', 1, 0.01, 'linear')
		if getPropertyFromClass('ClientPrefs', 'hideHud') == false then
			setProperty('iconP2.visible', true)
		end
	end
	if curStep == 642 then
		doTweenAlpha('hudFunne', 'camHUD', 0, 0.1, 'linear')
	end
	if curStep == 670 then
		doTweenAlpha('hudFunne', 'camHUD', 1, 0.05, 'linear')
	end
	if curStep == 1087 then --soo many soulsss
		doTweenAlpha('hudFunne', 'camHUD', 0, 0.3, 'linear')
	end
	if curStep == 1215 then
		doTweenAlpha('hudFunne', 'camHUD', 1, 0.2, 'linear')
	end
	if curStep == 1470 then
		doTweenAlpha('reddinTime', 'red', 1, 0.3, 'linear')
		doTweenColor('bfColorTween1', 'boyfriend', '0xFF000000', 0.3, 'linear');
		doTweenColor('dadColorTween1', 'dad', '0xFF000000', 0.3, 'linear');
	end
	if curStep == 1662 then
		doTweenAlpha('reddinGone', 'red', 0, 0.2, 'linear')
		doTweenColor('bfColorTween2', 'boyfriend', '0xFFFFFFFF', 0.2, 'linear');
		doTweenColor('dadColorTween2', 'dad', '0xFFFFFFFF', 0.2, 'linear');
		addLuaSprite('drown', true);
		doTweenAlpha('drowing', 'drown', 1, 20, 'linear')
	end
	if curStep == 2049 then --dark
		doTweenAlpha('darking', 'dark', 1, 2, 'linear')
		doTweenAlpha('hudFunne', 'camHUD', 0, 2.5, 'linear')
		doTweenAlpha('drowing', 'drown', 0, 4, 'linear')
	end
end

function onTweenCompleted(tag)  --stuff fades away
	if tag == 'tailscream' then
		doTweenAlpha('tailsgoes', 'image1', 0, 2.2, 'linear')
		doTweenAlpha('redishgoes1', 'light', 0, 2.2, 'linear')
	end
	if tag == 'tailsgoes' then
		removeLuaSprite('image1')
	end

	if tag == 'knuckscream' then
		doTweenAlpha('knuckgoes', 'image2', 0, 2.2, 'linear')
		doTweenAlpha('redishgoes2', 'light', 0, 2.2, 'linear')
	end
	if tag == 'knuckgoes' then
		removeLuaSprite('image2')
	end

	if tag == 'eggscream' then
		doTweenAlpha('egggoes', 'image3', 0, 2.2, 'linear')
		doTweenAlpha('redishgoes3', 'light', 0, 2.2, 'linear')
	end
	if tag == 'egggoes' then
		removeLuaSprite('image3')
	end

	if tag == 'allapp' then
		doTweenAlpha('allgoes', 'image4', 0, 3, 'linear')
		doTweenAlpha('redishgoes4', 'light', 0, 3, 'linear')
	end
	if tag == 'allgoes' then
		removeLuaSprite('image4')
	end
end