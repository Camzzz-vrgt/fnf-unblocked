function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-holding-gf-dead')
end

function onGameOver()
	if not allowEnd then
	
		startVideo('video_2');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end
