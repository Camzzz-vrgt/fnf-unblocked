function onCreate()

	makeLuaSprite("theSky","voidThom/sky",-500,-560)
	addLuaSprite("theSky",false)
	setLuaSpriteScrollFactor("theSky",0.0,0)
	close(true)

	makeLuaSprite("theClouds","voidThom/clouds",-500,-450)
	addLuaSprite("theClouds",false)
	setLuaSpriteScrollFactor("theClouds",0.2,1)
	close(true)

	makeLuaSprite("theGround","voidThom/ground",-400,-460)
	addLuaSprite("theGround",false)
	setLuaSpriteScrollFactor("theGround",1,1)
	close(true)

	makeLuaSprite("TheTrack","voidThom/track",-300,-490)
	addLuaSprite("TheTrack",false)
	setLuaSpriteScrollFactor("TheTrack",1,1)
	close(true)

end