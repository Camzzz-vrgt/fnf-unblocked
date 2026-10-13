function onCreate()

	makeLuaSprite("sky","voidThom/sky",-500,-560)
	setScrollFactor("sky",0.0,0)

	makeLuaSprite("clouds","voidThom/clouds",-200,-450)
	setScrollFactor("clouds",1.3,1.2)

	makeLuaSprite("ground","voidThom/ground",-280,-460)
	setScrollFactor("ground",1.2,1.1)
	setScrollFactor("gfGroup",1.2,1.1)

	makeLuaSprite("track","voidThom/track alt",-300,-490)
	setScrollFactor("track",1,1)

	makeLuaSprite("track ground","voidThom/track ground",-300,-490)

	addLuaSprite("sky",false)
	addLuaSprite("clouds",false)
	addLuaSprite("ground",false)
	addLuaSprite("track ground",false)
	addLuaSprite("track",false)
	close(true)

end