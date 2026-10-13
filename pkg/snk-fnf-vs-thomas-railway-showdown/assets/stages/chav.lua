function onCreate()

	makeLuaSprite("grASS","chavstage/chavbg",-400,-300)
	addLuaSprite("grASS",false)
	setLuaSpriteScrollFactor("grASS",1,1)
	scaleObject('grASS', 1.4, 1.4)

	makeLuaSprite("TheStation","chavstage/station",-400,-280)
	addLuaSprite("TheStation",false)
	setLuaSpriteScrollFactor("TheStation",1,1)
	scaleObject('TheStation', 1.4, 1.4)

	makeLuaSprite("TheRails","chavstage/chavrails",-400,-300)
	addLuaSprite("TheRails",false)
	setLuaSpriteScrollFactor("TheRails",1,1)
	scaleObject('TheRails', 1.4, 1.4)

	setProperty("gf.alpha", 0)

	setObjectOrder('boyfriendGroup', 4)
	setObjectOrder('dadGroup', 5)

	close(true)

end