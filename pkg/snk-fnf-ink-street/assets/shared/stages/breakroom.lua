
function onCreate()
    -- Crea el fondo 'basement'

    makeLuaSprite('backG', 'breakroom/background',-1008.85,-752.35)
    addLuaSprite('backG', false)


	makeLuaSprite('frontG', 'breakroom/frontground',-1008.85,-752.35)
    addLuaSprite('frontG', true)

    makeLuaSprite('papercolor',nil, -1008.85, -752.35)
    makeGraphic('papercolor', getProperty('backG.width'), getProperty('backG.height'), 'f3d497')
    setProperty('papercolor.alpha', 0)
    addLuaSprite('papercolor', false)


    makeAnimatedLuaSprite('title', 'titles/oddlyoddity', 370, -520)
    
    scaleObject('title', 0.5, 0.5)
    addLuaSprite('title')

    makeLuaSprite('black screen', nil)
	makeGraphic('black screen', 1, 1, '000000')
	addLuaSprite('black screen')
	setObjectCamera('black screen', 'hud')
	setGraphicSize('black screen', 1280, 720)

    makeAnimatedLuaSprite('creem', 'breakroom/scream', -591.05,-1315.90)
    addLuaSprite('creem',true)
    setObjectCamera('creem', 'other')
    setProperty('creem.alpha', 0.001)

    makeAnimatedLuaSprite('effect', 'breakroom/effect', 0,0)
    addLuaSprite('effect',true)
    setObjectCamera('effect', 'other')
    setProperty('effect.alpha', 0)

end

function onCreatePost()
    setObjectOrder('black screen', getObjectOrder('noteGroup') + 1);
	triggerEvent('Camera Follow Pos','550','-100')
end

function onSongStart()
    doTweenY("camFollowYsd", 'camFollow', 350, 17, "circInOut")
    doTweenZoom('zoomcamstart', 'camGame', 1.2, 13, 'circInOut')
    addAnimationByPrefix('title', 'title', 'title', 24, false)
    doTweenAlpha('black screen', 'black screen', 0, 0.5, 'circOut')
end

function onTweenCompleted(tag)
    if tag == 'zoomcamstart' then
        setProperty("defaultCamZoom",getProperty('camGame.zoom'))
    end
    if tag == 'zoomcamasdsda' then
        doTweenZoom('zoomcamstart', 'camGame', 0.5, 1, 'circOut')
    end
    if tag == 'backGT1' then
        setProperty('backG.alpha', 0)
        setProperty('frontG.alpha', 0)
        setProperty('papercolor.alpha', 1)
        setProperty('effect.alpha', 1)
        setProperty('boyfriend.color', 0x000000)
        setProperty('dad.color', 0x000000)
    end
    if tag == 'backGT2' then
        setProperty('backG.alpha', 1)
        setProperty('frontG.alpha', 1)
        setProperty('papercolor.alpha', 0)
        removeLuaSprite('effect', true)
        setProperty('boyfriend.color', 0xffffff)
        setProperty('dad.color', 0xffffff)
    end
end

function onEvent(name, v1, v2)
	if name == 'Play Animation' then 
		if v1 == 'start' then 
            setProperty('title.visible', false)
            cancelTween('zoomcamstart')
            camxlol = getProperty("camFollow.x")
			camylol = getProperty("camFollow.y")
            triggerEvent('Camera Follow Pos',camxlol,camylol)
            doTweenY("camFollowYsd", 'camFollow', 315, 1.77, "circInOut")
            doTweenX("camFollowxsd", 'camFollow', 837, 1.77, "circInOut")
            doTweenZoom('zoomcamasdsda', 'camGame', 0.8, 1.77, 'circInOut')
        end

        if v1 == 'screem' then
            
            setProperty('creem.alpha', 1)
            addAnimationByPrefix('creem', 'scream', 'scream', 24, false)
            debugPrint('scream created')
        end
        if v1 == 'bad apple' then
            camxlol = getProperty("camFollow.x")
			camylol = getProperty("camFollow.y")
            triggerEvent('Camera Follow Pos',camxlol,camylol)
            doTweenY("camFollowYsd", 'camFollow', 315, 1, "circInOut")
            doTweenX("camFollowxsd", 'camFollow', 837, 1, "circInOut")
            doTweenZoom('zoomcamasdsda', 'camGame', 0.6, 1, 'circInOut')
            doTweenAlpha('backGT1', 'backG', 0.5, 1, 'circIn')
            doTweenAlpha('frontGT', 'frontG', 0.5, 1, 'circIn')
            doTweenAlpha('papercolorT', 'papercolor', 0.5, 1, 'circIn')
            doTweenAlpha('effect', 'effect', 0.5, 1, 'circIn')
            addAnimationByPrefix('effect', 'idle', 'idle', 24, true)
            doTweenColor('bendycolor', 'boyfriend', '808080', 1, 'circIn')
            doTweenColor('olliecolor', 'dad', '808080', 1, 'circIn')
        end
        if v1 == 'bad apple go' then
            doTweenY("camFollowYsd", 'camFollow', 465, 1, "circIn")
            doTweenX("camFollowxsd", 'camFollow', 737, 1, "circIn")
            doTweenZoom('zoomcamasdsda', 'camGame', 0.65, 1, 'circInOut')
            doTweenAlpha('backGT2', 'backG', 0.5, 1, 'circIn')
            doTweenAlpha('frontGT', 'frontG', 0.5, 1, 'circIn')
            doTweenAlpha('papercolorT', 'papercolor', 0.5, 1, 'circIn')
            doTweenAlpha('effect', 'effect', 0.5, 1, 'circIn')
            doTweenColor('bendycolor', 'boyfriend', '808080', 1, 'circIn')
            doTweenColor('olliecolor', 'dad', '808080', 1, 'circIn')
        end
        if v1 == 'blackscreen1' then
            setProperty('black screen.alpha', 1)
            doTweenAlpha('blacksout', 'black screen', 0, 1.5, 'lineal')
        end
        if v1 == 'blackscreen2' then
            setProperty('black screen.alpha', 1)
        end
        if v1=='axe'then

            doTweenY("camFollowYsd", 'camFollow', 315, 1, "circInOut")
            doTweenX("camFollowxsd", 'camFollow', 837, 1, "circInOut")
            doTweenZoom('zoomcamasdsda', 'camGame', 0.6, 3, 'circOut')
        end
        if v1 == 'singDOWN' then
            noteTweenAngle("boyStrum0", 4, 360, 1, "circout")
            noteTweenAngle("boyStrum1", 5, 360, 1, "circout")
            noteTweenAngle("boyStrum2", 6, 360, 1, "circout")
            noteTweenAngle("boyStrum3", 7, 360, 1, "circout")
            setProperty('boyfriend.color', 0x000000)
        end
        if v1 == 'AAAAAAAAAHHHHHHH' then
            doTweenZoom('zoomcam', 'camGame', 1, 0.58, 'circIn')
            doTweenAlpha('blacksIn', 'black screen', 1, 0.58, 'expoIn')
        end
    end 
end