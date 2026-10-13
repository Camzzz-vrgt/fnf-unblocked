function onCreate() --COMPOSER NAME
makeLuaText('watermark', songName .. " | Womo ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
addLuaText('watermark');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'panchitobf-ded'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'revenge_vf_die'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end