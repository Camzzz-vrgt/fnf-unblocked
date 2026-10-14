function onCreatePost()
  setPropertyFromGroup('opponentStrums',0,'x','-500')
  setPropertyFromGroup('opponentStrums',1,'x','-500')
  setPropertyFromGroup('opponentStrums',2,'x','-500')
  setPropertyFromGroup('opponentStrums',3,'x','-500')

  setPropertyFromGroup('playerStrums',0,'x','723')
  setPropertyFromGroup('playerStrums',1,'x','835')
  setPropertyFromGroup('playerStrums',2,'x','950')
  setPropertyFromGroup('playerStrums',3,'x','1061')
end
function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'MX_Slam'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'MXGloryKill'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/

	precacheImage('mario_dead_screen')
end