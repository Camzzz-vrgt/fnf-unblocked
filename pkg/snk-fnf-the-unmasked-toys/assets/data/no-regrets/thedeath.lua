function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-holding-gf-dead')
	makeLuaSprite('gameover1', 'gameover1', -600, -300)
	addLuaSprite('gameover1', true)	
	setProperty('gameover1.alpha', 0)
	screenCenter('gameover1', 'xy')
end
--gameover1
function onGameOver()
	setProperty('gameover1.alpha', 1)
end
