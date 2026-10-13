function onCreate()
  setPropertyFromClass('GameOverSubstate', 'characterName', 'PicoDead'); --Character json file for the death animation
  setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_pico'); --put in mods/sounds/
  setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
  setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/

setProperty('cameraSpeed', 1.7)


   --setProperty('healthBar.alpha', tonumber(0))
   --setProperty('iconP1.visible', false)
   -- setProperty('iconP2.visible', false)
   --setProperty('scoreTxt.visible', false)
   -- setProperty('timeTxt.visible', false)
   -- setProperty('showRating', false);
   --setProperty('showComboNum', false);



	makeLuaSprite('barUp', '', 0, 0)
	makeGraphic('barUp', 2000, 350, '000000')
	setObjectCamera('barUp', 'hud')
	addLuaSprite('barUp', true)
	setProperty('barUp.alpha', 1)
	scaleObject('barUp', 1.05, 1.057)

	makeLuaSprite('barDown', '', 0, 370)
	makeGraphic('barDown', 2000, 350, '000000')
	setObjectCamera('barDown', 'hud')
	addLuaSprite('barDown', true)
	setProperty('barDown.alpha', 1)
	scaleObject('barDown', 1.05, 1.05)


			doTweenY('bargoesup','barUp', -400, 0.01, 'expoInOut')

			doTweenY('bargoesdown','barDown', 750, 0.01, 'expoInOut')


			doTweenAlpha('geberdi', 'geberdi', 0, 1, 'linear')


			function onStepHit()

	if curStep == 1050 then


			doTweenY('bargoesup','barUp', 0, 2, 'expoInOut')

			doTweenY('bargoesdown','barDown', 370, 2, 'expoInOut')

			end



			end





function opponentNoteHit(id, noteData)
	runHaxeCode([[game.opponentStrums.members[]]..noteData..[[].playAnim('static', true)]]);
end








end

function onUpdatePost(elapsed)

setTextWidth('timeTxt', 400)

setTextFont('timeTxt', 'PA font.ttf')
setProperty('timeBarBG.visible', false)
setProperty('timeBar.visible', false)
setTextSize("timeTxt", 35)

end