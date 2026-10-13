function onCreate()
	-- CHARACTER
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'hiker-dead');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx_blizzard');
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd'); 
end
