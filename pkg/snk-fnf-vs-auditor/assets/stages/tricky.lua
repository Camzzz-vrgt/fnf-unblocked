local oppx = 63.5;
local oppy = 400.5;
local camoffs = 70;
local followchars = true;

function onCreate()

	addCharacterToList('audiDeath', 'boyfriend');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'audiDeath');

	makeAnimatedLuaSprite('bg','tricky/trickybg', -1750, -500);
	addAnimationByPrefix('bg', 'flash', 'bg flash', 24, false);
	addAnimationByPrefix('bg', 'static', 'bgstatic', 24, true);
	scaleObject('bg', 1.33, 1.33)


	makeAnimatedLuaSprite('light','tricky/alarm', 1020, -300);
	addAnimationByPrefix('light', 'idle', 'alarm light', 24, true);

	makeAnimatedLuaSprite('rightwall','tricky/rightwallbg', 1014, -171);
	addAnimationByPrefix('rightwall', 'flash', 'rightwallbg flash', 24, false);
	addAnimationByPrefix('rightwall', 'static', 'rightwallbg static', 24, true);

	addLuaSprite('bg', false);
    addLuaSprite('rightwall', true);
	addLuaSprite('light', true);
	objectPlayAnimation('bg', 'static', true);
	objectPlayAnimation('rightwall', 'static', true);
	objectPlayAnimation('light', 'idle', true);

end

function onEvent(name, value1, value2)

	if name == 'flash' then
        objectPlayAnimation('bg', 'flash', true)
		objectPlayAnimation('rightwall', 'flash', true)
	end
end

function playerNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('boyfriend.curCharacter') == 'auditor-playable' then
		cameraShake('camGame', 0.0075, 0.1);
	end
end

function onStepHit()
	if getProperty('curSong') == 'dissension' then
		if curStep == 1824 then
			cameraShake('camGame', 0.025, 1);
			cameraShake('camHUD', 0.015, 1);
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
end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	-- return Function_Stop if you want to stop the player from going into the game over screen
    
    playSound('fnf_loss_sfx')
    playSound('audideathsound')
    playMusic('gameOver', 1, true)
    setPropertyFromClass('GameOverSubstate', 'camFollowPos.x', 1210);
    setPropertyFromClass('GameOverSubstate', 'camFollowPos.y', 466);
	return Function_Continue;
end

function onGameOverConfirm(retry)
	-- Called when you Press Enter/Esc on Game Over
	-- If you've pressed Esc, value "retry" will be false
    setProperty('boyfriend.curCharacter', 'audiDeath')
    luaSpritePlayAnimation('bfDeadConfirm')
    playMusic('gameOverEnd', 1, true)
end