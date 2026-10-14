function onMoveCamera(focus)
    if focus == 'boyfriend' then
        setProperty('defaultCamZoom', 1)

    else if focus == 'dad' then
        setProperty('defaultCamZoom', 0.55)
    end
end
end
function onCreate()

    makeLuaSprite('HUD', 'fmShade', 0, 0)
	setLuaSpriteScrollFactor('HUD', 1, 1)
	scaleObject('HUD', 1, 1)
    setObjectCamera('HUD', 'camOther')

    makeLuaSprite('Health', 'LXHealthBar', 0, 0)
	setLuaSpriteScrollFactor('Health', 1, 1)
	scaleObject('Health', 1, 1)
    setObjectCamera('Health', 'camHUD')

	makeLuaSprite('cop', 'Mario_', -1150, -450)
	setLuaSpriteScrollFactor('cop', 1, 1)
	scaleObject('cop', 1.05 ,1.05)

	makeLuaSprite('Blood', 'Blood_', -1170, -450)
	setLuaSpriteScrollFactor('Blood', 1, 1)
	scaleObject('Blood', 1.05 ,1.05)

	makeLuaSprite('Floor', 'bg Luigi_2', 250, -300)
	setLuaSpriteScrollFactor('Floor', 1, 1)
	scaleObject('Floor', 0.4, 1)

    makeLuaSprite('shadow', 'Shadow', -650, -1000)
	setLuaSpriteScrollFactor('shadow', 1, 1)
	scaleObject('shadow', 3 ,2)

    makeLuaSprite('shadow2', 'Shadow', -6000, -3500)
	setLuaSpriteScrollFactor('shadow2', 1, 1)
	scaleObject('shadow2', 5 ,5)

    makeLuaSprite('stageback', 'white', -1050, -650)
	scaleObject('stageback', 4, 10)

   
    
	addLuaSprite('stageback', false)
    setProperty('stageback.visible', false)

    addLuaSprite('HUD', false)
   
	addLuaSprite('Floor', false)
            addLuaSprite('Blood', false)
	addLuaSprite('cop', false)
    addLuaSprite('shadow', true)
    addLuaSprite('shadow2', true)
    addLuaSprite('Health', false)
end
function onCreatePost()
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')
  
    setPropertyFromGroup('playerStrums',0,'x','723')
    setPropertyFromGroup('playerStrums',1,'x','835')
    setPropertyFromGroup('playerStrums',2,'x','950')
    setPropertyFromGroup('playerStrums',3,'x','1061')
  end
