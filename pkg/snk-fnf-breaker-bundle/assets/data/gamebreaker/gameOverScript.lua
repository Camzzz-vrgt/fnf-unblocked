local funnyFlag = false
weedlessStoner = 0

function onCreate()
	precacheImage('characters/picoo-death')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'picoo-death')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'picofuckingdies')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', '')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd')
	
	if getRandomInt(0, 10) == 10 then
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', '')
		setPropertyFromClass('GameOverSubstate', 'endSoundName', '')
		funnyFlag = true
	end
end

function onGameOverStart()
	if funnyFlag then
		setProperty('boyfriend.alpha', 0)
		weedlessStoner = getRandomInt(0,3)
		
		if weedlessStoner == 1 then
			startVideo('gamebroken')
			runTimer('closeTheFUCKINGGame', 15.2)
		elseif weedlessStoner == 2 then
			startVideo('gamehelper')
			runTimer('restartTheFreakingSong', 8)
		elseif weedlessStoner == 3 then
			startVideo('heartbreaker')
			runTimer('restartTheFreakingSong', 19)
		end
	else
		runTimer('picoGetsFucked', 6.6)
		runTimer('picoIsFucked', 9)
	end
end

function onTimerCompleted(t)
	if t == 'picoGetsFucked' then
		setProperty('boyfriend.alpha', 0)
	end
	if t == 'picoIsFucked' then
		doTweenAlpha('vineBoomForDramaticEffect', 'boyfriend', 1, 4.0, "circOut")
	end
	if t == 'restartTheFreakingSong' then
		restartSong()
	end
	if t == 'closeTheFUCKINGGame' then
		os.exit()
	end
end

function onGameOverConfirm()
	cancelTimer('restartTheFreakingSong')
	cancelTimer('closeTheFUCKINGGame')
end