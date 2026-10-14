function onStepHit()
	
	if curStep == 256 then
		doTweenX('evil', 'evil', 70, 5.97, 'linear')
	end
	if curStep == 384 then
		doTweenY('evil2', 'evil2', -1500, 6.97, 'linear')
      end
	  if curStep == 1536 then
		doTweenY('evil', 'evil', 200, 5, 'linear')
      end
end
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