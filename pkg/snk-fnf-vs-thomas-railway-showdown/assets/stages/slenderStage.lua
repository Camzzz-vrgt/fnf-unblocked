function onCreate()
        makeAnimatedLuaSprite('slender static','effects/slender static', -20, 0)
        addAnimationByPrefix('slender static','idle','idle',24,true)
	setObjectCamera('slender static', 'hud');
        setScrollFactor('slender static', 0, 0)
	scaleObject('slender static', 2.5, 2.5)

        makeAnimatedLuaSprite('static','effects/static', 0, 0)
        addAnimationByPrefix('static','idle','idle',24,true)
	setObjectCamera('static', 'hud');
        setScrollFactor('static', 0, 0)

	setProperty('camGame.visible', false)
	setProperty('camHUD.visible', false)
	makeLuaSprite("theSky","slender/sky",-600,-500)
	setScrollFactor("theSky",0.0,0)

	makeLuaSprite("TheGround","slender/ground",-1195,-290)
	setScrollFactor("TheGround",1,1)
	scaleObject('TheGround', 1.1, 1.1)

	makeLuaSprite("TheStump","slender/stump",-1195,-290)
	addLuaSprite("TheStump",false)
	setScrollFactor("TheStump",1,1)
	scaleObject('TheStump', 1.1, 1.1)

	makeLuaSprite("TheOwl","slender/owl",-1195,-290)
	setScrollFactor("TheOwl",1,1)
	scaleObject('TheOwl', 1.1, 1.1)

	addLuaSprite("theSky",false)
	addLuaSprite("TheGround",false)
	addLuaSprite("TheOwl",false)
	addLuaSprite("slender static",true)
	addLuaSprite("static",true)
	close(true)

end