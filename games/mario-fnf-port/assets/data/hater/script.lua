function onCreate()

    
    makeLuaSprite('HUD', 'fmShade', 0, 0)
	setLuaSpriteScrollFactor('HUD', 1, 1)
	scaleObject('HUD', 1, 1)
    setObjectCamera('HUD', 'camOther')

    
    addLuaSprite('HUD', true)
setProperty('HUD.visible', false)
end

function onStepHit()
	if curStep == 768 then

		cameraFlash('hud','000000','1')
        setProperty('HUD.visible', true)
	end
    if curStep == 1024 then

		cameraFlash('hud','FFFFFF','0.5')
        setProperty('HUD.visible', false)
	end
end