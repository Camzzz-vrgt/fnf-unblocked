function onCreate()

    makeAnimatedLuaSprite('ruido', 'ruido', 0, 0);
    setObjectCamera('ruido', 'camOther')
    setProperty('ruido.alpha', 0.05)
    scaleObject('ruido', 0.75, 0.75);
    addLuaSprite('ruido', false)

    makeLuaSprite('dark', 'darks', 0, 0)
    setObjectCamera('dark', 'camOther')
    --setProperty('dark.alpha', 0.02)
    scaleObject('dark', 0.75, 0.75);
    addLuaSprite('dark', false)

    makeLuaSprite('vhs', 'raias', 0, 0)
    setObjectCamera('vhs', 'camOther')
    setProperty('vhs.alpha', 0.02)
    --scaleObject('vhs', 5, 3);
    addLuaSprite('vhs', false)
    
	makeLuaSprite('theBackhuggy','backhuggy',-600,0)
	addLuaSprite('theBackhuggy',false)
	setLuaSpriteScrollFactor('theBackhuggy', 1.0, 1.0)
    scaleObject('theBackhuggy', 0.5, 0.5);
    
    makeLuaSprite('theShaderhuggy1','shaderhuggy1',-570,-10)
	addLuaSprite('theShaderhuggy1',true)
	setLuaSpriteScrollFactor('theShaderhuggy1', 1.0, 1.0)

    makeLuaSprite('theRope1','rope1',1100,0)
	addLuaSprite('theRope1',true)
	setLuaSpriteScrollFactor('theRope1', 1.4, 0.8)
    scaleObject('theRope1', 2.0, 2.0);

    makeLuaSprite('theRope2','rope2',800,0)
	addLuaSprite('theRope2',true)
	setLuaSpriteScrollFactor('theRope2', 2.0, 0.8)
    scaleObject('theRope2', 2.0, 2.0);

    makeLuaSprite('theRope3','rope3',300,0)
	addLuaSprite('theRope3',true)
	setLuaSpriteScrollFactor('theRope3', 1.7, 0.8)
    scaleObject('theRope3', 2.0, 2.0);

    makeLuaSprite('theRope4','rope4',750,-900)
	addLuaSprite('theRope4',true)
	setLuaSpriteScrollFactor('theRope4', 1.5, 1.5)
    scaleObject('theRope4', 2.0, 2.0);

    addAnimationByPrefix('ruido','idle','ruido',70,true)

    objectPlayAnimation('ruido','idle',true)

end