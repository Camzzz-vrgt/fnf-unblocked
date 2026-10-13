local stop = true

function onCreate()

    -- black box

    makeLuaSprite('black1', '', 0, 0);
    makeGraphic('black1',1280,720,'000000')
    addLuaSprite('black1', true);
    setScrollFactor('black1',0,0)
    setProperty('black1.scale.x',2)
    setProperty('black1.scale.y',2)
    setProperty('black1.visible', false)
    setObjectCamera('black1', 'other')

end

function onStartCountdown()
    if stop then
        stop = false
        setProperty('black1.visible', true)
        runTimer("help me 2", 1)
        return Function_Stop
    end

    return Function_Continue
end
function onTimerCompleted(timer)
    if timer == 'help me 2' then 
        setProperty('black1.visible', false) 
        playMusic("nene_precutscene", 1, false)
        runTimer('neneanim1', 1.5)
    end
    if timer == 'neneanim1' then 
        characterPlayAnim("dad", "preattack")
        runTimer('neneanim2', 0.5)
    end
    if timer == 'neneanim2' then 
        characterPlayAnim("dad", "attack")
        characterPlayAnim("bf", "dodge")
        doTweenAngle("Yes", "camGame", 1, 1, "quadOut")
        cameraSetTarget("bf")
        runTimer('neneanim3', 2)
    end
    if timer == 'neneanim3' then 
        characterPlayAnim("dad", "giggle")
        characterPlayAnim("bf", "hey")
        doTweenAngle("back", "camGame", 0, 1, "quadOut")
        cameraSetTarget("dad")
        runTimer('restartCountdown', 1)
    end
    if timer == 'restartCountdown' then
        --musicFadeOut(1.0)
        startCountdown()
    end
end

function onStepHit()
    if curStep == 163 then 
        setProperty('defaultCamZoom', 1)
    end
    if curStep == 196 then 
        setProperty('defaultCamZoom', 0.9)
    end
    if curStep == 227 then 
        setProperty('defaultCamZoom', 1)
    end
    if curStep == 260 then 
        setProperty('defaultCamZoom', 0.9)
    end
    if curStep == 512 then
        triggerEvent("Camera Follow Pos", nil, nil)
        setProperty('defaultCamZoom', 0.9)
    end
    if curStep == 518 then
        doTweenX('b', 'camGame', 300, 8.29, 'cubeOut')
    end
    if curStep == 582 then  
        doTweenZoom('a', 'camGame', 1.4, 8.29, 'cubeOut')
    end
end

function onBeatHit()
    if curBeat == 1 then
        doTweenZoom('a', 'camGame', 1.4, 9.14, 'cubeIn')
    end
    if curBeat == 18 then
        doTweenZoom('a', 'camGame', 1.4, 8.57, 'cubeIn')
    end
    if curBeat == 32 then
        characterPlayAnim("dad", "hey")
    end
    if curBeat == 67 then   
        setProperty('defaultCamZoom', 0.95)
    end
    if curBeat == 68 then   
        setProperty('defaultCamZoom', 1)
    end
    if curBeat == 69 then   
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 82 then   
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 83 then   
        setProperty('defaultCamZoom', 0.95)
    end
    if curBeat == 84 then   
        setProperty('defaultCamZoom', 1)
    end
    if curBeat == 96 then
        characterPlayAnim("dad", "giggle")
    end
    if curBeat == 97 then
        setProperty('defaultCamZoom', 0.7)
        triggerEvent("Camera Follow Pos", 1400, 700)
    end
    if curBeat == 161 then 
        setProperty("defaultCamZoom", 0.75)
        triggerEvent("Camera Follow Pos", 1400, 700)
    end
    if curBeat == 169 then 
        setProperty("defaultCamZoom", 0.9)
        triggerEvent("Camera Follow Pos", nil, nil)
        cameraSetTarget("bf")
    end
    if curBeat == 170 then 
        cameraSetTarget("dad")
    end
    if curBeat == 178 then 
        cameraSetTarget("bf")
    end
    if curBeat == 181 then 
        setProperty("defaultCamZoom", 1)   
        cameraSetTarget("bf")
    end
    if curBeat == 183 then 
        setProperty("defaultCamZoom", 0.8) 
        cameraSetTarget("dad")  
    end
    if curBeat == 186 then 
        cameraSetTarget("bf")  
    end
    if (curBeat >= 195 and curBeat <= 196) then
        characterPlayAnim("boyfriend", "coo coo", true)
    end
    if curBeat == 197 then 
        setProperty("defaultCamZoom", 0.6)
        triggerEvent("Camera Follow Pos", 1400, 700)
        --doTweenZoom("d", "camGame", 0.6, 38.29, "cubeOut")
        setProperty('dad.colorTransform.redOffset', 255)
            setProperty('dad.colorTransform.greenOffset', 0)
            setProperty('dad.colorTransform.blueOffset', 0)
        setProperty('dad.colorTransform.redMultiplier', 255)
            setProperty('dad.colorTransform.blueMultiplier',  0)
            setProperty('dad.colorTransform.greenMultiplier',  0)
        setProperty('boyfriend.colorTransform.redOffset', 255)
            setProperty('boyfriend.colorTransform.greenOffset', 0)
            setProperty('boyfriend.colorTransform.blueOffset', 0)
        setProperty('boyfriend.colorTransform.redMultiplier', 255)
            setProperty('boyfriend.colorTransform.blueMultiplier',  0)
            setProperty('boyfriend.colorTransform.greenMultiplier',  0)       
    end
    if (curBeat >= 228 and curBeat <= 243) then 
        triggerEvent("Add Camera Zoom", 0.03, nil)
    end
    if curBeat == 245 then  
        triggerEvent("Camera Follow Pos", nil, nil)
        setProperty("defaultCamZoom", 1)
    end
    if curBeat == 261 then  
        setProperty('dad.colorTransform.redOffset', 0)
        setProperty('dad.colorTransform.greenOffset', 0)
        setProperty('dad.colorTransform.blueOffset', 0)
    setProperty('dad.colorTransform.redMultiplier', 1)
        setProperty('dad.colorTransform.blueMultiplier',  1)
        setProperty('dad.colorTransform.greenMultiplier',  1)
    setProperty('boyfriend.colorTransform.redOffset', 0)
        setProperty('boyfriend.colorTransform.greenOffset', 0)
        setProperty('boyfriend.colorTransform.blueOffset', 0)
    setProperty('boyfriend.colorTransform.redMultiplier', 1)
        setProperty('boyfriend.colorTransform.blueMultiplier',  1)
        setProperty('boyfriend.colorTransform.greenMultiplier',  1)  
    end
    
    if curBeat == 264 then  
        setProperty('black1.visible', true)
    end
end

function onTweenCompleted(tag)
    if tag == 'b' then
        doTweenX('c', 'camGame', 0, 1, 'cubeOut')
    end
end