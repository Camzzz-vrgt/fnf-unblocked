
function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'Blackfridaybf-dead')
end

function onGameOver()
	--setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
	if not allowEnd then
	
		startVideo('BFRDeathCutscene_2');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end
