function onCreate()
	-- CHARACTER
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'mark-dead');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx_nudekiller');
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver'); --file goes inside music/ folder
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd'); --file goes inside music/ folder
end
