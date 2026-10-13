function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | MisterOficerPL ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-hand-dies'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver1'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'retryzunpet'); --put in mods/music/
end