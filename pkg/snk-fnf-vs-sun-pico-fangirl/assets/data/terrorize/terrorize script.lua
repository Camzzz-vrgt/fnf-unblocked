--Took a lotta bits from Held_der_Zeit on heath gain on hit/ loss on miss! <3

function onCreate()

--Random shit

	setPropertyFromClass('PlayState', 'chartingMode', 'true');

	makeLuaSprite('barAnimationUp', '', 0, 0)
	makeGraphic('barAnimationUp', 2000, 350, '000000')
		setObjectCamera('barAnimationUp', 'hud')
		addLuaSprite('barAnimationUp', true)
		setProperty('barAnimationUp.alpha', 1)
		scaleObject('barAnimationUp', 1.05, 1.057)

	makeLuaSprite('barAnimationDown', '', 0, 370)
	makeGraphic('barAnimationDown', 2000, 350, '000000')
		addLuaSprite('barAnimationDown', true)
		setObjectCamera('barAnimationDown', 'hud')
		setProperty('barAnimationDown.alpha', 1)
		scaleObject('barAnimationDown', 1.05, 1.05)

			doTweenY('bargoesup','barAnimationUp', -400, 0.01, 'expoInOut')
			doTweenY('bargoesdown','barAnimationDown', 750, 0.01, 'expoInOut')





--Death Stuff

	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --mods/music/


--Camera Speed Shit

	setProperty('cameraSpeed', 2.5) --default is 1


--Cinematics
	makeLuaSprite('barUp', '', 0, -350)
	makeGraphic('barUp', 2000, 350, '000000')
	setObjectCamera('barUp', 'hud')
	addLuaSprite('barUp', false)

	makeLuaSprite('barDown', '', 0, 720)
	makeGraphic('barDown', 2000, 350, '000000')
	setObjectCamera('barDown', 'hud')
	addLuaSprite('barDown', false)


end

													--dont touch here please lmao


function onCreatePost()

        doTweenY('barUp', 'barUp', -350 + 40, 0.001, 'QuadOut')
        doTweenY('barDown', 'barDown', 720 - 40, 0.001, 'QuadOut') --1.5 default time


end

    function onStepHit()

--Character files fucked up so i had to do this the hard way dont fucking judge me ¯\_(ツ)_/¯

	if curStep == 128 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDeadGun');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico');
		setPropertyFromClass('PlayState', 'chartingMode', 'false');


	elseif curStep == 672 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');


	elseif curStep == 806 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDeadGun');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico');


	elseif curStep == 864 then 

		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');


	elseif curStep == 928 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDeadGun');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico');


	elseif curStep == 992 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');


	elseif curStep == 1072 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDeadGun');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico');


	elseif curStep == 1335 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');


	elseif curStep == 1584 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDeadGun');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico');


	elseif curStep == 1600 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');


	elseif curStep == 1616 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDeadGun');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico');


	elseif curStep == 1632 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');


	elseif curStep == 1648 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDeadGun');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico');


	elseif curStep == 1664 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');


	elseif curStep == 1680 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDeadGun');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico');


	elseif curStep == 1696 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');


	elseif curStep == 1856 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDeadGun');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico');


	elseif curStep == 1879 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');


	elseif curStep == 2112 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDeadGun');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico');
		doTweenY('barUp', 'barUp', -350 + -40, 1, 'QuadOut')
		doTweenY('barDown', 'barDown', 720 - -40, 1, 'QuadOut') --1.5 default time


	elseif curStep == 2240 then

		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');


	elseif curStep == 2416 then 

		setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDeadGun');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico');


--Outro

end
end


--Sun Health Drain

	function opponentNoteHit(id, noteData, noteType, isSustainNote)

	runHaxeCode([[game.opponentStrums.members[]]..noteData..[[].playAnim('static', true)]]);

		health = getProperty('health')
		if getProperty('health') > 0.05 then
		setProperty('health', health- 0.035);

	if isSustainNote then
		setProperty('health', health - loss/2)
	else
		setProperty('health', health - loss)

		end

	end
end


--Health Gain

function goodNoteHit(id, noteData, noteType, isSustainNote)
	--debugPrint('pre-hp:', getProperty('health'))
	health = getProperty('health')

	if getPropertyFromGroup('notes', id, 'rating') == 'sick' then
		gain = 0.040
		--debugPrint('sick')
end

	if getPropertyFromGroup('notes', id, 'rating') == 'good' then
		gain = 0.023
		--debugPrint('good')
end

	if getPropertyFromGroup('notes', id, 'rating') == 'bad' then
		gain = -0.023
		--debugPrint('bad')
end

	if getPropertyFromGroup('notes', id, 'rating') == 'shit' then
		gain = -0.1
		--debugPrint('shit')
end


	if isSustainNote then
		setProperty('health', health + gain/2)

	else
		setProperty('health', health + gain)

end

	health = getProperty('health')
	setProperty('health', health - 0.023)
	--0.023 is default

end


--Health Loss on Miss

	function noteMiss(id, noteData, noteType, isSustainNote)
		health = getProperty('health')

		setProperty('health', health - 0.07)   --0.0475 is default


	if isSustainNote then
		setProperty('health', health - 0.0475)
	else
		setProperty('health', health - loss)
	end
end






function onUpdatePost(elapsed)

setTextWidth('timeTxt', 400)

setTextFont('timeTxt', 'PA font.ttf')
setProperty('timeBarBG.visible', false)
setProperty('timeBar.visible', false)
setTextSize("timeTxt", 35)

end

