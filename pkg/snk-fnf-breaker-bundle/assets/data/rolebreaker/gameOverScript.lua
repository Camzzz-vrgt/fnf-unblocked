function onCreate()
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', '')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', '')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', '')
end

function onGameOverStart()
	setProperty('boyfriend.alpha', 0)
	startVideo('susbreaker')
	runTimer('resetYoShit', 14.5)
end

function onTimerCompleted(t)
	if t == 'resetYoShit' then
		restartSong()
	end
end

function onGameOverConfirm()
	restartSong()
end