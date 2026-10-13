function onCreate() --COMPOSER NAME
makeLuaText('watermark', songName .. " | Reggie COUZ ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
addLuaText('watermark');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'Reggie COUZ Dies'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'holytonygameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end