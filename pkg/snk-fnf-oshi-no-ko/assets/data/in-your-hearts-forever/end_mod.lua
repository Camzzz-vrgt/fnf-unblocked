end_video = 0

function onEndSong()

	end_video = end_video + 1

	if isStoryMode and end_video == 1 then
		startVideo('end_mod');
		return Function_Stop;
	end

	-- if not isStoryMode and end_video == 1  then
	-- 	startVideo('end_mod');
	-- 	return Function_Stop;
	-- end

	return Function_Continue;
end
