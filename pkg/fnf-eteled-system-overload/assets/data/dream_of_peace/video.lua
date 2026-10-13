local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('pre-dream-of-peace'); -- when you go in a week the video will be up
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('pre-diagraphephobia'); -- after the song is done this video will play
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end
