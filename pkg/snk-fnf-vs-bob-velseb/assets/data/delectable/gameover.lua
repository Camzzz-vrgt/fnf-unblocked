linesaid = false

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'delectable_dead')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death_delectable')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover_delectable')
end

function onUpdate()
	if inGameOver and getProperty('boyfriend.animation.curAnim.name') == 'deathLoop' and linesaid == false then
		playSound("deathlines/BobDeathLine" .. getRandomInt(1, 7), 1, "deathline")
		linesaid = true
	end
end

function onGameOver()
	removeLuaSprite("black")
end

function onGameOverConfirm(retry)
	stopSound("deathline")
end