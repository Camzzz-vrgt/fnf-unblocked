
function onCreate()
    -- Crea el fondo 'basement'
    makeLuaSprite('backG', 'inkstage/BG')
    addLuaSprite('backG', false)
    setProperty('backG.color', 0x2A2C2E)

	makeLuaSprite('floor1', 'inkstage/floor1')
    addLuaSprite('floor1', false)
    
	makeLuaSprite('floor2', 'inkstage/floor2')
    addLuaSprite('floor2', false)
    setProperty('floor2.visible', false)
    
	makeLuaSprite('floor3', 'inkstage/floor3')
    addLuaSprite('floor3', false)
    setProperty('floor3.visible', false)

    makeAnimatedLuaSprite('title', 'titles/nostalgiabait', 1715, 800)
    setProperty('title.visible', false)
    

    addLuaSprite('title')


    makeAnimatedLuaSprite('ollieShadow', 'inkstage/ollie shadow', 1631.4, 1137.85)
    addAnimationByPrefix('ollieShadow', 'idle', 'idle', 24, false)
    addAnimationByPrefix('ollieShadow', 'singLEFT', 'left', 24, false)
    addAnimationByPrefix('ollieShadow', 'singRIGHT', 'right', 24, false)
    addAnimationByPrefix('ollieShadow', 'singUP', 'up', 24, false)
    addAnimationByPrefix('ollieShadow', 'singDOWN', 'down', 24, false)

    addLuaSprite('ollieShadow', false)

            makeAnimatedLuaSprite('borisShadow', 'inkstage/boris shadow', 663.1, 1055.95)
    addAnimationByPrefix('borisShadow', 'idle', 'idle', 24, false)
    addAnimationByPrefix('borisShadow', 'singLEFT', 'left', 24, false)
    addAnimationByPrefix('borisShadow', 'singRIGHT', 'right', 24, false)
    addAnimationByPrefix('borisShadow', 'singUP', 'up', 24, false)
    addAnimationByPrefix('borisShadow', 'singDOWN', 'down', 24, false)

    addLuaSprite('borisShadow', false)
    setProperty('borisShadow.visible', false)

    	makeLuaSprite('lineart', 'inkstage/lines')
    addLuaSprite('lineart', false)

    
    makeLuaSprite('white screen', nil)
	makeGraphic('white screen', 1, 1, 'FFFFFF')
    setBlendMode('white screen', 'add')
	addLuaSprite('white screen')
	setObjectCamera('white screen', 'other')
	setGraphicSize('white screen', 1280, 720)
    setProperty('white screen.alpha', 0)

        makeLuaSprite('black screen', nil)
	makeGraphic('black screen', 1, 1, '000000')
	addLuaSprite('black screen')
	setObjectCamera('black screen', 'other')
	setGraphicSize('black screen', 1280, 720)
    setProperty('black screen.alpha', 0)



end
function onCreatePost()
    setProperty('dad.color', 0x2A2C2E)
    setProperty('boyfriend.visible', false)
	triggerEvent('Camera Follow Pos','2198','1028')
    
    for i = 0, getProperty('playerStrums.length')-1 do
        setPropertyFromGroup('opponentStrums', i, 'x', getPropertyFromGroup('opponentStrums', i, 'x')  + 650)
        setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x') -620)
    end
end
function onSongStart()
    setProperty('title.visible', true)
    addAnimationByPrefix('title', 'title', 'title', 24, false)

end

function onEvent(name, v1, v2)
    if name == 'Play Animation' then
        if v1 == 'start' then
            doTweenY("camFollowYsd", 'camFollow', 1328, 1.77, "circInOut")
            doTweenY("title", 'title', getProperty('title.y')-600, 3, "circIn")
        end
        if v1 == 'light1' then
            setProperty('dad.color', 0xFFFFFF)
            setProperty('floor1.visible', false)
            setProperty('floor2.visible', true)
            setProperty('white screen.alpha', 0.3)
            doTweenAlpha('whitedsa', 'white screen', 0, 1.5, 'circOut')
            setProperty('backG.color', 0xFFFFFF)
        end
        if v1 == 'light2' then
             setProperty('title.visible', false)
            setProperty('dad.color', 0x2A2C2E)
            setProperty('floor3.visible', false)
            setProperty('floor2.visible', false)
            setProperty('floor1.visible', true)
            setProperty('boyfriend.visible', true)
            setProperty('boyfriend.color', 0x2A2C2E)
                        setProperty('black screen.alpha', 0.7)
            doTweenAlpha('blackdsa', 'black screen', 0, 5, 'circOut')
            setProperty('backG.color', 0x2A2C2E)
        end
        if v1 == 'light3' then
            setProperty('dad.color', 0xFFFFFF)
            setProperty('boyfriend.color', 0xFFFFFF)
            setProperty('floor2.visible', false)
            setProperty('floor3.alpha', 1)
            setProperty('borisShadow.alpha', 1)
            setProperty('white screen.alpha', 0.3)
            doTweenAlpha('whitedsa', 'white screen', 0, 1.5, 'circOut')
            setProperty('backG.color', 0xFFFFFF)
        end
        if v1 == 'boriscam' then 
            camxlol = getProperty("camFollow.x")
			camylol = getProperty("camFollow.y")
            debugPrint(camxlol..','..camylol)
            triggerEvent('Camera Follow Pos',camxlol,camylol)
            doTweenY("camFollowYsd", 'camFollow', 1115, 1.77, "circInOut")
            doTweenX("camFollowxsd", 'camFollow',1737, 1.77, "circInOut")
            doTweenZoom('zoomcamasdsda', 'camGame', 0.37, 1.77, 'circInOut')
            setProperty('floor3.visible', true)
            setProperty('borisShadow.visible', true)
            setProperty('floor3.alpha', 0.0001)
            setProperty('borisShadow.alpha', 0.0001)
        end
    end
end
function onTweenCompleted(tag)
    if tag == 'zoomcamasdsda' then
        setProperty("defaultCamZoom",getProperty('camGame.zoom'))
    end
end

function onUpdatePost()
    -- Obtener animación actual del oponente
    local oppAnim = getProperty('dad.animation.curAnim.name')
    local oppFrame = getProperty('dad.animation.curAnim.curFrame')

    -- Si no es la misma animación, cambiarla
    if getProperty('ollieShadow.animation.curAnim.name') ~= oppAnim then
        playAnim('ollieShadow', oppAnim, false)
        
    end

    -- Forzar el mismo frame exacto
    setProperty('ollieShadow.animation.curAnim.curFrame', oppFrame)

        -- Obtener animación actual del oponente
    local bfAnim = getProperty('boyfriend.animation.curAnim.name')
    local bfFrame = getProperty('boyfriend.animation.curAnim.curFrame')

    -- Si no es la misma animación, cambiarla
    if getProperty('borisShadow.animation.curAnim.name') ~= bfAnim then
        playAnim('borisShadow', bfAnim, false)
    end

    -- Forzar el mismo frame exacto
    setProperty('borisShadow.animation.curAnim.curFrame', bfFrame)
end