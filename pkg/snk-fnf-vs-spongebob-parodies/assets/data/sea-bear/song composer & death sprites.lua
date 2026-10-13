function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Polar ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	--DEATH ANIMATION
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfpamtri'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'shot'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'pamtri'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'santiago'); --put in mods/music/
end