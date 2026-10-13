function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Bfbro ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'gmodbf-dies'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'gmod_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'H20gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'H20gameOverEnd'); --put in mods/music/
end