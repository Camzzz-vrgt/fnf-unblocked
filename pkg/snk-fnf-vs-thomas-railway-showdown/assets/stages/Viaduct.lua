function onCreate()

	makeLuaSprite("theSky","Viaduct/sky",-500,-200)
	addLuaSprite("theSky",false)
	setLuaSpriteScrollFactor("theSky",0.2,0)
	scaleObject('theSky', 0.9, 0.9)
	close(true)

	makeLuaSprite("theClouds","Viaduct/clouds",-500,-250)
	addLuaSprite("theClouds",false)
	setLuaSpriteScrollFactor("theClouds",0.1,0)
	close(true)

	makeLuaSprite("TheBridge","Viaduct/viaduct",-450,-370)
	addLuaSprite("TheBridge",true)
	setLuaSpriteScrollFactor("TheBridge",1,1)
	scaleObject('TheBridge', 1.1, 1.1)
	close(true)

end