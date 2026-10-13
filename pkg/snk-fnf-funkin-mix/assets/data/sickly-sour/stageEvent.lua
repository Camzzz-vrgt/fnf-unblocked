local seenDiaEnd = false;
local lilaAnStep;

function onCreatePost()
	makeLuaSprite('blackCoverLeft', 'blackCoverLeft', 0, 0);
	setProperty('blackCoverLeft.alpha',0);
	addLuaSprite('blackCoverLeft', true);

	makeLuaSprite('blackCorner', 'blackCorner', 0, 0);
	setObjectCamera('blackCorner','camhud');
	setProperty('blackCorner.alpha', 0.6);	
	addLuaSprite('blackCorner', true);

	makeAnimatedLuaSprite('noise', 'noiseEffect', 0, 0);
	addAnimationByPrefix('noise', 'idle', 'noise');
	playAnim('noise','idle');
	setObjectCamera('noise','camhud');
	setProperty('noise.alpha', 0.3);	
	addLuaSprite('noise', true);

	makeLuaSprite('blackCoverWhole', '', 0, 0);
	makeGraphic('blackCoverWhole', 3700, 2000, '000000')
	setProperty('blackCoverWhole.alpha', 0);
	addLuaSprite('blackCoverWhole', true);

	-- if isStoryMode then
		setProperty('blackCorner.alpha', 0);
		setProperty('noise.alpha', 0);
		setProperty('blackCoverWhole.alpha', 1);
	-- end

	makeAnimatedLuaSprite('lilaAN', 'lila_an', 980, 820);
	addAnimationByPrefix('lilaAN', 'idle', 'an0000', 1, true);
	addAnimationByPrefix('lilaAN', 'comehere', 'an', 24, false);
	setProperty('lilaAN.alpha',0);
	addLuaSprite('lilaAN', true);
	playAnim('lilaAN','idle');

	setProperty('healthBar.alpha', 0);	
	setProperty('healthBarBG.alpha', 0);	
	setProperty('iconP1.alpha', 0);	
	setProperty('iconP2.alpha', 0);	
	setProperty('scoreTxt.alpha', 0);	
	setProperty('timeBar.alpha', 0);
	setProperty('timeBarBG.alpha', 0);	
	setProperty('timeTxt.alpha', 0);	
end

function onStartCountdown()
	setProperty('skipCountdown', true);
	
	return Function_Continue;
end

function onSongStart()
	setProperty('healthBar.alpha', 1);	
	setProperty('healthBarBG.alpha', 1);	
	setProperty('iconP1.alpha', 1);	
	setProperty('iconP2.alpha', 1);	
	setProperty('scoreTxt.alpha', 1);	
	setProperty('timeBar.alpha', 1);
	setProperty('timeBarBG.alpha', 1);	
	setProperty('timeTxt.alpha', 1);
	
	doTweenAlpha('blackCoverWholeLighten','blackCoverWhole', 0, 0.5);
	setProperty('blackCorner.alpha', 0.6);	
	setProperty('noise.alpha', 0.3);

	makeLuaSprite('endCover', 'ssEndCover', 0, 0);
	setObjectCamera('endCover','camother');
	setProperty('endCover.alpha', 0);
	addLuaSprite('endCover', true);

	makeLuaSprite('blackCover', '', 0, 0);
	makeGraphic('blackCover', 1280, 720, '000000')
	setObjectCamera('blackCover','camother');
	setProperty('blackCover.alpha', 0);
	addLuaSprite('blackCover', true);
end

function onBeatHit()
	if curBeat == 520 then
		cameraFlash('camhud', 'ffffff', 0.5, true);
	end

	if curBeat == 524 then
		setProperty('camZooming', false);
		setProperty('opponentNoteHitCamzooming', false);		
		doTweenZoom('camZoomChange', 'camGame', 1.3, 0.35, 'circout');
		doTweenAlpha('endCoverShow','endCover', 1, 0.2);
	end
end

function onStepHit()
	if curStep == 92 then
		playAnim('dad','laugh');
		setProperty('dad.specialAnim',true);
		setProperty('dad.heyTimer',3);	
	end

	if curStep == 128 then
		playAnim('dad','idle');
		doTweenAlpha('blackCornerDarken','blackCorner', 0.8, 0.15);
		doTweenAlpha('noiseDarken','noise', 0.5, 0.15);	
	end

	if curStep == 256 then
		cameraFlash('camhud', 'ffffff', 0.5, true);
		setHealth(0.2);
		setProperty('colorShader.saturation', -0.6);
		doTweenAlpha('blackCornerDarken','blackCorner', 0.9, 0.15);
		doTweenAlpha('noiseDarken','noise', 0.7, 0.15);
		doTweenAlpha('blackCoverLeftDarken','blackCoverLeft', 1, 0.15);
	end

	if curStep == 518 then
		lilaAnStep = curStep;
		doTweenAlpha('blackCoverWholeDarken','blackCoverWhole', 1, 0.08);
		doTweenAlpha('lilaANshow','lilaAN',1,0.13);
	end

	if curStep == lilaAnStep + 27 then
		cameraFlash('camhud', 'ffffff', 0.45, true);
		setHealth(0.2);
		setProperty('camHUD.visible', true);
		doTweenAlpha('blackCoverWholeLighten','blackCoverWhole', 0, 0.1);
		doTweenAlpha('lilaANfade','lilaAN', 0, 0.1);
	end

	if curStep == 543 then
		doTweenAlpha('blackCornerLighten','blackCorner',0,0.5);
		doTweenAlpha('noiseLighten','noise',0,0.5);
		doTweenAlpha('blackCoverLeftfade','blackCoverLeft',0,0.5);
	end

	if curStep == 1056 then
		cameraFlash('camhud', 'ffffff', 0.5, true);
		setHealth(0.2);
		doTweenAlpha('blackCornerDarken','blackCorner', 0.6, 0.15);
		doTweenAlpha('noiseDarken','noise', 0.3, 0.15);
	end

	if curStep == 1303 then
		cameraFlash('camhud', 'ffffff', 0.5, true);
		setHealth(0.2);
		doTweenAlpha('blackCornerfade','blackCorner', 0, 0.5);
		doTweenAlpha('noisefade','noise', 0, 0.5);
	end
end

function onTweenCompleted(tag)
	if tag == 'camZoomChange' then
		setProperty('defaultCamZoom', 1.1);
		setProperty('camZooming', true);
		setProperty('opponentNoteHitCamzooming', true);
	end

	if tag == 'blackCoverLeftfade' then
		removeLuaSprite('blackCoverLeft');
	end

	if tag == 'blackCoverWholeDarken' then
		setProperty('camHUD.visible', false);
		setProperty('colorShader.saturation', 0);
	end

	if tag == 'lilaANshow' then
		playAnim('lilaAN','comehere');
	end

	if tag == 'lilaANfade' then
		removeLuaSprite('blackCoverWhole');
		removeLuaSprite('lilaAN');
	end

	if tag == 'noisefade' then
		removeLuaSprite('blackCorner');
		removeLuaSprite('noise');
	end

	if tag == 'endCoverShow' then
		runTimer('endCoverReady', 1.2);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'endCoverReady' then
		doTweenAlpha('blackCoverShow','blackCover', 1, 1, 'sineinout');
	end
end

function onUpdatePost(elapsed)
	
end

function onEndSong()
	if not seenDiaEnd and isStoryMode then
		makeLuaSprite('diaBGonStage', 'dialogue/Week 2 DialogBG', 0, 0);
		addLuaSprite('diaBGonStage', true);
		setObjectCamera('diaBGonStage', 'camhud');
		removeLuaSprite('endCover');
		removeLuaSprite('blackCover');
		triggerEvent('startDiaEnd');
		seenDiaEnd = true;
		return Function_Stop;
	end

	return Function_Continue;
end