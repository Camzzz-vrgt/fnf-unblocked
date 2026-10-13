function onCreate()

	makeLuaSprite("sky","ffarquhar/sky",-470,-440)
	scaleObject("sky",2,2)
	setLuaSpriteScrollFactor("sky",1.2,1.2)

	makeLuaSprite("station","ffarquhar/station",-400,-500)
	scaleObject("station",2.2,2.2)
	setLuaSpriteScrollFactor("station",1.1,1.1)

	makeLuaSprite("stage","ffarquhar/ground",-470,-440)
	scaleObject("stage",2,2)
	setLuaSpriteScrollFactor("stage",1,1)

	makeLuaSprite("britt","ffarquhar/britt",-640,-440)
	scaleObject("britt",1,1)
	setProperty('britt.visible', false)

        makeAnimatedLuaSprite('static','effects/static', -0, 0)
        addAnimationByPrefix('static','idle','idle',24,true)
	setObjectCamera('static', 'hud');
        setScrollFactor('static', 0, 0)
	setProperty('static.visible', false)

	addLuaSprite("sky",false)
	addLuaSprite("station",false)
	addLuaSprite("stage",false)
	addLuaSprite("britt",true)
        addLuaSprite('static', true)
	close(true)

end