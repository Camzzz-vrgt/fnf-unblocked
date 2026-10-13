function onCreate()



    if  isStoryMode and not seenCutscene then
		makeLuaSprite('cutsik','dialogue/sun/'..bok, 0, 0)
		scaleObject('cutsik', 0.5,0.5)
		addLuaSprite('cutsik',true)
		setObjectCamera('cutsik', 'camOther')
	
		playMusic('edgy_dialogue',1,true)
	
		cameraFlash('camOther', '000000', 3)
		doTweenZoom('qq', getProperty('camOther'), 1.6, 3, 'quintOut')
		doTweenX('wer', 'cutsik', 215, 3, 'quintOut')
		doTweenY('ewq', 'cutsik', 135, 3, 'quintOut')
	  end


	end

	allowCountdown = false

	function onTweenCompleted(t)
	
	  if t == 'dbdb' then
		startCountdown()
	  end
	end
	
	function onStartCountdown()
		-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
		if not allowCountdown and  isStoryMode and not seenCutscene then
			setPropertyFromClass('PlayState','seenCutscene',true)
	
			allowCountdown = true
			return Function_Stop
		end
		return Function_Continue
	end
	
	  bok = 0
	kaka = 1
	notThatDialogueAgain = false
	screenShake = false
	
			function onUpdate()
	
			  if screenShake then
				cameraShake('other', 0.003, 0.003)
			  end
			
			  if  isStoryMode and not seenCutscene and not notThatDialogueAgain then
				if keyJustPressed('accept') and bok <= 3 then
				  playSound('dialogueClose',0.6)
				  kaka  = kaka + 1
				  if kaka == 0 then
	
				  elseif kaka == 1 then
					doTweenX('wer', 'cutsik', 100, 1, 'expoOut')
				  elseif kaka == 2 then
					doTweenX('wer', 'cutsik', -100, 1, 'expoOut')
				  elseif kaka == 3 then
					doTweenX('wer', 'cutsik', -260, 1, 'expoOut')
					doTweenY('ewq', 'cutsik', 145, 1, 'expoOut')
					doTweenZoom('qq', getProperty('camOther'), 1.75, 1, 'expoOut')
				  elseif kaka == 4 then
					doTweenX('wer', 'cutsik', 220, 1, 'expoOut')
					doTweenY('ewq', 'cutsik', -135, 1, 'expoOut')
					doTweenZoom('qq', getProperty('camOther'), 1.6, 1, 'expoOut')
				  elseif kaka == 5 then
					doTweenX('wer', 'cutsik', 0, 1, 'expoOut')
				  elseif kaka == 6 then
					screenShake = true
					doTweenX('wer', 'cutsik', -260, 1, 'expoOut')
					doTweenY('ewq', 'cutsik', -155, 1, 'expoOut')
					doTweenZoom('qq', getProperty('camOther'), 1.75, 1, 'expoOut')
				  elseif kaka == 7 then
					screenShake = false
	
					bok = bok + 1
					loadGraphic('cutsik', 'dialogue/sun/'..bok)
					doTweenZoom('qq', getProperty('camOther'), 1.8, 1, 'expoOut')
					doTweenX('wer', 'cutsik', 285, 1, 'expoOut')
					doTweenY('ewq', 'cutsik', 140, 1, 'expoOut')
				  elseif kaka == 8 then
					doTweenX('wer', 'cutsik', 0, 1, 'expoOut')
					elseif kaka == 9 then
					  doTweenZoom('qq', getProperty('camOther'), 1.9, 1, 'expoOut')
					  doTweenX('wer', 'cutsik', -300, 1, 'expoOut')
					  doTweenY('ewq', 'cutsik', 150, 1, 'expoOut')
					elseif kaka == 10 then
					  doTweenX('wer', 'cutsik', 280, 1, 'expoOut')
					  doTweenY('ewq', 'cutsik', -160, 1, 'expoOut')
					  doTweenZoom('qq', getProperty('camOther'), 1.8, 1, 'expoOut')
					elseif kaka == 11 then
					  doTweenX('wer', 'cutsik', 0, 1, 'expoOut')
					  doTweenY('ewq', 'cutsik', -145, 1, 'expoOut')
					  doTweenZoom('qq', getProperty('camOther'), 1.675, 1, 'expoOut')
					elseif kaka == 12 then
					  doTweenX('wer', 'cutsik', -250, 1, 'expoOut')
					elseif kaka == 13 then
					  bok = bok + 1
					  loadGraphic('cutsik', 'dialogue/sun/'..bok)
					  doTweenZoom('qq', getProperty('camOther'), 1, 1, 'expoOut')
					  doTweenX('wer', 'cutsik', 0, 1, 'expoOut')
					  doTweenY('ewq', 'cutsik', 0, 1, 'expoOut')
					  screenShake = true
					elseif kaka == 14 then
					  screenShake = false
					  bok = bok + 1
				  end
				  
				  if bok == 3 then
					notThatDialogueAgain = true
			
					doTweenZoom('qq', getProperty('camOther'), 1, 1, 'expoOut')
					doTweenX('wer', 'cutsik', 0, 1, 'expoOut')
					doTweenY('ewq', 'cutsik', 0, 1, 'expoOut')
					doTweenAlpha('dbdb', 'cutsik', 0, 1, 'linear')
			
					soundFadeOut('', 1, 0)
			
					runTimer('zaa', 1)
				  end
				end 
			  end
			
			end



