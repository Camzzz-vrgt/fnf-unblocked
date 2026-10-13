local stop = true 

function onCreatePost()
    -- kill nene add bf bouncer

    setProperty('gf.visible', false)

    makeAnimatedLuaSprite('bfbg', 'city/bfbounce/BOYFRIEND-GF', 1200, 750)
    addAnimationByPrefix('bfbg', 'bounce', 'bf boing i', 24, false)
    addAnimationByPrefix('bfbg', 'fade', 'bf boing start i', 24, false)
    scaleObject('bfbg', 0.9, 0.9)

-- black box

    makeLuaSprite('black', '', 0, 0);
    makeGraphic('black',1280,720,'000000')
    addLuaSprite('black', true);
    setScrollFactor('black',0,0)
    setProperty('black.scale.x',2)
    setProperty('black.scale.y',2)
    setProperty('black.visible', true)
    setObjectCamera('black', 'other')
 
-- friends!

    makeLuaSprite("friendly", 'yayay', 0, 0)
    setObjectCamera("friendly", 'other')
    setObjectOrder("friedly", getObjectOrder("black") + 1)
    screenCenter("friendly")
    setProperty("friendly.alpha", 0.00000001)
    addLuaSprite('friendly', true)

end

function onStartCountdown()
    if stop then
        stop = false
        runTimer("help me", 1)
        return Function_Stop
    end

    return Function_Continue
end

function onTimerCompleted(timer)
    if timer == 'help me' then
        setProperty('black.visible', false)
        playMusic("PICNICPRECUTSCENE", 1, false)
        cameraSetTarget("dad")
        runTimer('bfanim1', 1.5)  
    end
    if timer == 'bfanim1' then 
        characterPlayAnim("dad", "look")
        runTimer('gfanim2', 1.5)
    end
    if timer == 'gfanim2' then 
        cameraSetTarget("bf")
        characterPlayAnim("bf", "hey")
        runTimer('bfyayayay', 2)
    end
    if timer == 'bfyayayay' then 
        cameraSetTarget("dad")
        characterPlayAnim("dad", "love")
        characterDance("bf")
        runTimer('restartCountdown', 2)
    end
    if timer == 'restartCountdown' then
        musicFadeOut(1.0)
        startCountdown()
    end
end

function onSongStart()
    doTweenZoom('hellofriends', 'camGame', 1.4, 9, 'cubeIn')
end

function onStepHit()
    if curStep == 308 then
        setProperty('defaultCamZoom', 1.2)
        cameraSetTarget('bf')
    end

    if curStep == 311 then
        setProperty('defaultCamZoom', 1.3)
    end

    if curStep == 313 then
        setProperty('defaultCamZoom', 1.4)
    end

    if curStep == 325 then
        setProperty('defaultCamZoom', 0.9)
    end

    if curStep == 442 then
        triggerEvent('Play Animation', 'death', 'dad')
    end

	if curStep == 430 then
		cameraSetTarget("bf")
	end

    if curStep == 438 then
        setProperty('defaultCamZoom', 1.6)
        setProperty('gf.visible', true)
        cameraSetTarget('dad')
    end

    if curStep == 452 then
        setProperty('defaultCamZoom', 1)
    end

    if curStep == 468 then
        setProperty('dad.visible', false)
    end

    if curStep == 569 then
        triggerEvent('Play Animation', 'giggle', 'gf')
		triggerEvent('Camera Follow Pos', getMidpointX('gf') + getProperty('gf.cameraPosition[0]') + getProperty('girlfriendCameraOffset[0]'), getMidpointY('gf') + getProperty('gf.cameraPosition[1]') + getProperty('girlfriendCameraOffset[1]'))
    end

    if curStep == 576 then
        triggerEvent("Camera Follow Pos", nil, nil)
    end

    if curStep == 580 then
        addLuaSprite('bfbg')
        playAnim('bfbg', 'fade', false)
    end

    if curStep == 582 then
        doTweenX('hello pep friends', 'camGame', -300, 7.84, 'cubeOut')
    end

    if curStep == 640 then
        doTweenX('hello pep friends', 'camGame', 0, 0.6, 'cubeOut')
        triggerEvent("Camera Follow Pos", nil, nil)
    end
end

function onBeatHit()
    if curBeat == 16 then
        setProperty('black.visible', true)
    end

    if curBeat == 17 then
        setProperty('black.visible', false)
    end

    if curBeat == 49 then
        doTweenX('hello pep friends', 'camGame', 300, 8.65, 'cubeOut')
    end

    if curBeat == 65 then
        doTweenX('hello pep friends', 'camGame', 0, 1, 'cubeOut')
    end

    if curBeat == 81 then
        doTweenZoom('hellofriends', 'camGame', 0.6, 12.98, 'linear')
        doTweenY('hello not friends', 'camGame', 100, 12.98, 'cubeOut')
        doTweenX('hello Yes friends', 'camGame', 200, 12.98, 'cubeOut')
    end

    if curBeat == 105 then
		cameraSetTarget("dad")
        doTweenZoom('hellofriends', 'camGame', 0.9, 1, 'cubeOut')
        doTweenY('hello not friends', 'camGame', 0, 1, 'cubeOut')
        doTweenX('hello Yes friends', 'camGame', 0, 1, 'cubeOut')
    end

    if curBeat == 113 then    
        callMethod('iconP2.changeIcon', {'nene'})
    end

    if curBeat == 124 then
        setProperty("defaultCamZoom", 1.2)
    end

    if curBeat == 127 then
        doTweenX("help", "boyfriend", 950, 1, "cubeOut")
    end

    if curBeat == 130 then
        doTweenX("help 2", "boyfriend", 1500, 1, "cubeOut")
    end

    if curBeat >= 145 then
        playAnim('bfbg', 'bounce', false)
        setProperty('defaultCamZoom', 0.8)
    end

    if curBeat == 145 then    
        triggerEvent('Camera Follow Pos', getMidpointX('gf') + getProperty('gf.cameraPosition[0]') + getProperty('girlfriendCameraOffset[0]'), getMidpointY('gf') + getProperty('gf.cameraPosition[1]') + getProperty('girlfriendCameraOffset[1]'))
    end

    if curBeat == 176 then
        doTweenZoom('hellofriends', 'camGame', 1.4, 18, 'cubeIn')
    end

    if curBeat == 209 then        
        setProperty('black.visible', true)
    end

    if (curBeat >= 213 and curBeat <= 217) then 
        setProperty("friendly.alpha", getProperty("friendly.alpha") + 0.25)
    end
    if (curBeat >= 221 and curBeat <= 224) then 
        setProperty("friendly.alpha", getProperty("friendly.alpha") - 0.25)
    end
end