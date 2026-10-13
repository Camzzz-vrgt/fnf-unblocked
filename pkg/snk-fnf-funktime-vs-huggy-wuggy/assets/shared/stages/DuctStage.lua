function onCreate()
    --makeAnimatedLuaSprite('ruido', 'ruido', 0, 0);
    setObjectCamera('ruido', 'camOther')
    setProperty('ruido.alpha', 0.05)
    scaleObject('ruido', 0.75, 0.75);
    addLuaSprite('ruido', false)

    makeLuaSprite('dark', 'darks', 0, 0)
    setObjectCamera('dark', 'camOther')
    --setProperty('dark.alpha', 0.02)
    scaleObject('dark', 0.668, 0.668);
    addLuaSprite('dark', false)

    --makeLuaSprite('vhs', 'raias', 0, 0)
    setObjectCamera('vhs', 'camOther')
    setProperty('vhs.alpha', 0.02)
    --scaleObject('vhs', 5, 3);
    addLuaSprite('vhs', false)
    
	makeLuaSprite('background','chapter1/background',-397,-500)
	addLuaSprite('background',false)
	setLuaSpriteScrollFactor('background', 1.0, 1.0)
    
    addAnimationByPrefix('ruido','idle','ruido',70,true)

    objectPlayAnimation('ruido','idle',true)

end