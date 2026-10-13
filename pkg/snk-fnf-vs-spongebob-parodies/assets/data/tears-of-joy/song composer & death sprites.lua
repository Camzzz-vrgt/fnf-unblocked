function onCreate() --COMPOSER NAME
makeLuaText('watermark', songName .. " | Wirewolf ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
addLuaText('watermark');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bffirstpersondies'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'diesfromcringe'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'nothing'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'sponge'); --put in mods/music/
end