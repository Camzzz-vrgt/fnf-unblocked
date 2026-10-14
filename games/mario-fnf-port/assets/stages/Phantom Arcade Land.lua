function onCreate()

    makeLuaSprite('well', 'Well', 500, 800)
	setLuaSpriteScrollFactor('well', 1, 1)
	scaleObject('well', 15, 15)

    makeLuaSprite('Movie', 'Movie', 0, -45)
	setLuaSpriteScrollFactor('HUD', 1, 1)
	scaleObject('Movie', 2, 0.9)
    setObjectCamera('Movie', 'camHUD')

    makeLuaSprite('HUD', 'HUD', -350, -100)
	setLuaSpriteScrollFactor('HUD', 1, 1)
	scaleObject('HUD', 1.9, 1.9)

    makeLuaSprite('Sky', 'Sky', -350, -100)
	setLuaSpriteScrollFactor('Sky', 1, 1)
	scaleObject('Sky', 1.9, 1.9)

    
    makeLuaSprite('Floor', 'Sand', -350, -100)
	setLuaSpriteScrollFactor('Floor', 1, 1)
	scaleObject('Floor', 1.9, 1.9)

    makeLuaSprite('Moyai', 'Moyai', -350, 750)
	setLuaSpriteScrollFactor('Moyai', 1, 1)
	scaleObject('Moyai', 1.9, 1.9)

    makeLuaSprite('Big', 'BigGreen', -350, 600)
	setLuaSpriteScrollFactor('Big', 1, 1)
	scaleObject('Big', 1.9, 1.9)

    makeLuaSprite('Phan', 'Phantom', -500, -100)
	setLuaSpriteScrollFactor('Phan', 1, 1)
	scaleObject('Phan', 5, 5)

    makeLuaSprite('oreo', 'oreo', -600, 350)
	setLuaSpriteScrollFactor('oreo', 1, 1)
	scaleObject('oreo', 1.9, 1.9)


    addLuaSprite('Sky', false)

    addLuaSprite('Moyai', false)
    addLuaSprite('Big', false)

    addLuaSprite('Floor', false)
    


    addLuaSprite('HUD', false)
    addLuaSprite('Movie', false)

    addLuaSprite('oreo', true)
    addLuaSprite('Phan', true)
    addLuaSprite('well', true)
    setProperty('well.alpha', 0)

    setProperty('Movie.visible',false)
    
end
function onCreatePost()
    setProperty('gf.visible',false)
end