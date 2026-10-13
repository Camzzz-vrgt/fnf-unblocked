function onCreate()
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', '')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', '')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', '')
end

function onGameOverStart()
	setProperty('boyfriend.alpha', 0)
	startVideo('torchbreaker')
	runTimer('actualGameBreaker', 18)
end

function onTimerCompleted(t)
	if t == 'actualGameBreaker' then
		os.exit()
	end
end

function onGameOverConfirm()
	os.exit()
end