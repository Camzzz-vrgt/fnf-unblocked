function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf_theend'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bf_tordbotdeath'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'creepy_gameover'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'creepy_gameover_confirm'); --put in mods/music/
end