function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | SlightlyCreative ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	--DEATH ANIMATION
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bobsponge'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bobsponge_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end