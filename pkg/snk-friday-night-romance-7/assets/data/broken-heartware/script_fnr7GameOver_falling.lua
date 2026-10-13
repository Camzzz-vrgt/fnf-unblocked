function onCreate()
	-- CHARACTER
	setPropertyFromClass('GameOverSubstate', 'characterName', 'FNR7bf-falling_rip');
	
	--SOUNDS
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnr7_loss_sfx-falling'); --file goes inside sounds/ folder
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --file goes inside music/ folder
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --file goes inside music/ folder
end