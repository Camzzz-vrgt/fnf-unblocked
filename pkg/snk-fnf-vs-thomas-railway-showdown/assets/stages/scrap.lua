function onCreate()
	makeLuaSprite("bg","scrap/bg",-600,-200)
	setScrollFactor("bg",1.0,1.0)
	scaleObject('bg', 0.7, 0.7)

	makeLuaSprite("overlay","effects/overlay",0,0)
	setScrollFactor("overlay",0,0)
	setObjectCamera('overlay', 'other');

	setProperty('camGame.visible', false)

	addLuaSprite("bg",false)
	addLuaSprite("overlay",true)
	close(true)

end