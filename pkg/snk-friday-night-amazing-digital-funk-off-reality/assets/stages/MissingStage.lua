set = false

function onCreate()
    setProperty('skipCountdown', true)
end

function onUpdate()
	triggerEvent('Camera Follow Pos', '1000', '350')
	setProperty('gf.alpha',0)
	setProperty('boyfriend.alpha',0)
	setProperty('timeBar.alpha', 0)

	setProperty('timeBarBG.alpha', 0)
end

function onCreatePost()

	setProperty('botplayTxt.visible', false)

	setProperty('scoreTxt.visible', false)

	setProperty('healthBar.alpha', 0) -- change this & next 3 to true if u want health

	setProperty('healthBarBG.alpha', 0)

	setProperty('iconP1.visible', false)

	setProperty('iconP2.visible', false)

	setProperty('timeTxt.visible', false)

	setProperty('timeBar.alpha', 0)

	setProperty('timeBarBG.alpha', 0)
	setProperty('health', 2)


setProperty('alphaNotes1', 0)


end

function onSongStart()

	
	noteTweenAlpha('alphaNotes1', 0, 0, 0.1, 'linear')
	noteTweenAlpha('alphaNotes2', 1, 0, 0.1, 'linear')
	noteTweenAlpha('alphaNotes3', 2, 0, 0.1, 'linear')
	noteTweenAlpha('alphaNotes4', 3, 0, 0.1, 'linear')

	noteTweenAlpha('alphaNotes5', 4, 0, 0.1, 'linear')
	noteTweenAlpha('alphaNotes6', 5, 0, 0.1, 'linear')
	noteTweenAlpha('alphaNotes7', 6, 0, 0.1, 'linear')
	noteTweenAlpha('alphaNotes8', 7, 0, 0.1, 'linear')


	characterPlayAnim('dad','idle-alt',true)
	runTimer('setZoom',11);
	runTimer('enterNotes',6);
	
	
		if set == true then
			setProperty('defaultCamZoom', 0.9);
		else
			doTweenZoom('camTween', 'camGame', 0.9, 8, 'circOut')
		end
	

	if not middlescroll then
		for i = 0,3 do 
			noteTweenX('opponentStrums1', 0, -320, 0.2, 'linear')
			noteTweenX('opponentStrums2', 1, -320, 0.2, 'linear')
			noteTweenX('opponentStrums3', 2, -320, 0.2, 'linear')
			noteTweenX('opponentStrums4', 3, -320, 0.2, 'linear')

			noteTweenX('playerStrums1', 4, defaultOpponentStrumX0-50-40+20, 0.2, 'linear')
			noteTweenX('playerStrums2', 5, defaultOpponentStrumX1+150-40+20-5, 0.2, 'linear')
			noteTweenX('playerStrums3', 6, defaultPlayerStrumX2 - 150-40-10-120+5, 0.2, 'linear')
			noteTweenX('playerStrums4', 7, defaultPlayerStrumX3 - 120, 3, 'backInOut')

			
			noteTweenY('playerStrums1X', 4, defaultPlayerStrumY0-300, 0.1, 'backOut')
			noteTweenY('playerStrums2X', 5, defaultPlayerStrumY1-300, 0.1, 'backOut')
			noteTweenY('playerStrums3X', 6, defaultPlayerStrumY2-300, 0.1, 'backOut')
			noteTweenY('playerStrums4X', 7, defaultPlayerStrumY3-300, 0.1, 'backOut')
			
		end
	end
end


function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'setZoom' then
		set = true
		setProperty('defaultCamZoom', 0.9);
    end

	if tag == 'enterNotes' then

		if not downscroll then
			noteTweenY('playerStrums1C', 4, defaultPlayerStrumY0-30, 5, 'quartOut')
			noteTweenY('playerStrums2C', 5, defaultPlayerStrumY1-30, 5, 'quartOut')
			noteTweenY('playerStrums3C', 6, defaultPlayerStrumY2-30, 5, 'quartOut')
			noteTweenY('playerStrums4C', 7, defaultPlayerStrumY0-30, 5, 'quartOut')
		else
			noteTweenY('playerStrums1Ce', 4, defaultPlayerStrumY0+40, 5, 'quartOut')
			noteTweenY('playerStrums2Ce', 5, defaultPlayerStrumY1+40, 5, 'quartOut')
			noteTweenY('playerStrums3Ce', 6, defaultPlayerStrumY2+40, 5, 'quartOut')
			noteTweenY('playerStrums4Ce', 7, defaultPlayerStrumY0+40, 5, 'quartOut')
			doTweenY('tt', 'dad', -70, 5, 'quartInOut')
		end

			noteTweenAlpha('alphaNotes1', 4, 1, 8, 'sineIn')
			noteTweenAlpha('alphaNotes2', 5, 1, 8, 'sineIn')
			noteTweenAlpha('alphaNotes3', 6, 1, 8, 'sineIn')
			noteTweenAlpha('alphaNotes4', 7, 1, 8, 'sineIn')
    end
end