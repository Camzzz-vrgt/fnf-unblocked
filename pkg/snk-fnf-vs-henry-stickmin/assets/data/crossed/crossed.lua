function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfOld-dead'); 
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); 
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'old_henry_game_over_theme');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'old_henry_retry_that_was_ALWAYS_HERE_GUYS');
setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin' Vs Henry Stickmin - [Crossed]")

    makeLuaSprite('white', '', -700, -270);
	makeGraphic('white', 3000, 1500, 'FFFFFF')
	setProperty('white.alpha', 0);
	addLuaSprite('white', true);

end