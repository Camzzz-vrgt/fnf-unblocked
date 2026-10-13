function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfdedcall'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'silence'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'deathconfirm'); --put in mods/music/	
end

local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('cutscene2');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end