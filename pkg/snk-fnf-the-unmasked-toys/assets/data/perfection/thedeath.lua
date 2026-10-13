function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-holding-gf-dead')
	makeLuaSprite('gameover2', 'gameover2', -600, -300)
	addLuaSprite('gameover2', true)	
	setProperty('gameover2.alpha', 0)
	screenCenter('gameover2', 'xy')
end
--gameover1
function onGameOver()
	setProperty('gameover2.alpha', 1)
end
