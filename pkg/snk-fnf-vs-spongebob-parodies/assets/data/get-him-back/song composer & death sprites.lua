function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Malk ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	--DEATH ANIMATION
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfsquiddies'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'woosh'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'nothing'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'laugh'); --put in mods/music/
end