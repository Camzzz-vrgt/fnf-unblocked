local allowCountdown = false --VIDEO CUTSCENE
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		setProperty('inCutscene', true);
		startVideo('nazi1cutscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end