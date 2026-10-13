function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Exazeeiscool ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	--DEATH ANIMATION
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'weo'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'arabend'); --put in mods/music/
end