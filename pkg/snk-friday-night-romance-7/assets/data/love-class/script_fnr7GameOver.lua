function onCreate()
	-- CHARACTER
	setPropertyFromClass('GameOverSubstate', 'characterName', 'FNR7bf_rip');
	
	--SOUNDS
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnr7_loss_sfx-pixel'); --file goes inside sounds/ folder
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --file goes inside music/ folder
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --file goes inside music/ folder
end