function onCreate()



	makeLuaSprite('barUp', '', 0, 0)
	makeGraphic('barUp', 2000, 350, '000000')
		setObjectCamera('barUp', 'hud')
		addLuaSprite('barUp', true)
		setProperty('barUp.alpha', 1)
		scaleObject('barUp', 1.05, 1.057)

	makeLuaSprite('barDown', '', 0, 370)
	makeGraphic('barDown', 2000, 350, '000000')
		addLuaSprite('barDown', true)
		setObjectCamera('barDown', 'hud')
		setProperty('barDown.alpha', 1)
		scaleObject('barDown', 1.05, 1.05)

			doTweenY('bargoesup','barUp', -400, 0.01, 'expoInOut')
			doTweenY('bargoesdown','barDown', 750, 0.01, 'expoInOut')


	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash',1280,720,'000000')
		addLuaSprite('flash', true);
		setLuaSpriteScrollFactor('flash',0,0)
		setProperty('flash.scale.x',2)
		setProperty('flash.scale.y',2)
		setProperty('flash.alpha',1)
		setProperty('flash.alpha',1)
		setProperty('healthBar.alpha', tonumber(0))
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
		setProperty('scoreTxt.visible', false)
		setProperty('timeTxt.visible', false)
		setProperty('showRating', false);
		setProperty('showComboNum', false);

	makeAnimatedLuaSprite('simsek', 'vs_sun/stage_noon/Lightning_Mechanic', 865, -305);
	addAnimationByPrefix('simsek', 'Lightning_Mechanic', 'lightning', 24, true);







--Camera Speed
	setProperty('cameraSpeed', 1.7)




function onStepHit()

	if curStep == 1 then
		doTweenAlpha('flash','flash', 0, 30, 'linear')


	elseif curStep == 126 then
		doTweenAlpha('flash','flash', 0, 0.5, 'linear')


	elseif curStep == 128 then
  		cameraFlash('camHUD', 'ffffff', 1.5);
		doTweenAlpha('healthBar','healthBar', 1, 0.001, 'linear')
			setProperty('iconP1.visible', true)
			setProperty('iconP2.visible', true)
			setProperty('scoreTxt.visible', true)
			setProperty('timeTxt.visible', true)
			setProperty('showRating', true);
			setProperty('showComboNum', true);


	elseif curStep == 1280 then
		addLuaSprite('simsek', true);


	elseif curStep == 1282 then
		removeLuaSprite('simsek', true);

	elseif curStep == 1832 then


			doTweenY('bargoesbackdown', 'barUp', 0, 2, 'expoInOut')
			doTweenY('bargoesbackup', 'barDown', 370, 2, 'expoInOut')


	elseif curStep == 1284 then
		if getProperty('health') > 0.5 then
			setProperty('health', 0.5);










		end
	end
end


--Death Animation

  setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDead');
  setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico'); --mods/sounds/
  setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --mods/music/
  setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --mods/music/

end

function opponentNoteHit(id, noteData)
	runHaxeCode([[game.opponentStrums.members[]]..noteData..[[].playAnim('static', true)]]);
end

function onUpdatePost(elapsed)

setTextWidth('timeTxt', 400)

setTextFont('timeTxt', 'PA font.ttf')
setProperty('timeBarBG.visible', false)
setProperty('timeBar.visible', false)
setTextSize("timeTxt", 35)

end