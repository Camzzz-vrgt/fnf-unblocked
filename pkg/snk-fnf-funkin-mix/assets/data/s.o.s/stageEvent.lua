function onCreatePost()
	makeLuaSprite('blackCorner', 'blackCorner', 0, 0);
	setObjectCamera('blackCorner','camhud');
	setProperty('blackCorner.alpha', 0.0);	
	addLuaSprite('blackCorner', true);

	makeLuaSprite('blackCoverWhole', null, 0, 0);
	makeGraphic('blackCoverWhole', 1280, 720, '000000');
	setObjectCamera('blackCoverWhole','camhud');
	addLuaSprite('blackCoverWhole', true);
	setObjectOrder('blackCoverWhole', 16);

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
	setProperty('blackCorner.alpha', 0.6);	
	doTweenAlpha('blackCoverWholeFade','blackCoverWhole', 0, 3.8, 'quintin');
	setProperty('colorShader.saturation', -0.3);

	makeLuaSprite('blackCoverNote', null, 0, 0);
	makeGraphic('blackCoverNote', 1280, 720, '000000');
	setObjectCamera('blackCoverNote','camhud');
	setProperty('blackCoverNote.alpha', 0.7);	
	addLuaSprite('blackCoverNote', true);

	playAnim('dad','pant');
	setProperty('dad.specialAnim',true);
	setProperty('dad.heyTimer', 30);	
end

function onStepHit()
	if curStep == 128 then
		doTweenAlpha('blackCoverNoteLighten','blackCoverNote', 0.5, 0.5, 'ease');
	end

	if curStep == 272 or curStep == 336 or curStep == 400 or curStep == 416 or curStep == 432 or curStep == 448 or
	 curStep == 464 or curStep == 480 or curStep == 496 or curStep == 512 or curStep == 528 then
		cameraFlash('camhud', '000000', 0.45, true);
	end

	if curStep == 656 then
		cameraFlash('camhud', 'ffffff', 0.7, true);
		setHealth(0.2);
		doTweenAlpha('blackCornerLighten','blackCorner', 0.45, 0.7);
		doTweenAlpha('blackCoverNoteLighten','blackCoverNote', 0.3, 0.7);
		setProperty('colorShader.saturation', -0.2);
	end
end

function onUpdatePost(elapsed)
	
end

function onTweenCompleted(tag)
	if tag == 'blackCoverWholeFade' then
		removeLuaSprite('blackCoverWhole');
	end
end

