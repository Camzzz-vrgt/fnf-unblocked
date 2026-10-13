function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('TRS Freeplay Unlock');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end