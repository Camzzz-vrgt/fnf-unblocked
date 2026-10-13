function onCreate()

	makeLuaSprite("grass","twf/layer2",-800,20)
	addLuaSprite("grass",false)
	scaleObject("grass",2,2)
	setLuaSpriteScrollFactor("grass",0.9,0.9)

	makeLuaSprite("station","twf/layer1",-800,-260)
	addLuaSprite("station",false)
	scaleObject("station",2,2)
	setLuaSpriteScrollFactor("station",1,1)

	setObjectOrder('dadGroup', 3)
	setObjectOrder('boyfriendGroup', 2)
	setObjectOrder('station', 2)
	close(true)

end