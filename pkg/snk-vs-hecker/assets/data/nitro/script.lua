function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfded'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'silence'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'deathconfirm'); --put in mods/music/	
end