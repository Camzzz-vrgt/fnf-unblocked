function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Womo ", 0, -2, 550);
    setTextSize('watermark', 15);
	addLuaText('watermark');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'yourboyfriend-dies');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); 
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); 
end