duetCam = {
    135,256,272,288,332,346,415,439,463,492,511,527,543,559,575,783,802,895
}

multipleTasks = {
    ['ghostBF'] = {{},function() 
        triggerEvent("Toggle Trail", 'boyfriend', nil)
        triggerEvent("Toggle Ghost For One", 'boyfriend', nil)
    end},
    ['ghostDAD'] = {{75,80,297,319,414,462,702,719,662,670},function()
        triggerEvent("Toggle Trail", 'dad', nil)
        triggerEvent("Toggle Ghost For One", 'dad', nil)
    end},
}
function onCreate()
    triggerEvent("Solid Color Trail", 'dad', nil)
    triggerEvent("Toggle Frame Trail", 'dad', nil)
    runHaxeCode([[
        var colorOut = new FlxRuntimeShader(File.getContent(Paths.shaderFragment('colorOut'))); 
        setVar('colorOut',colorOut);
    ]])
    triggerEvent("Duet", nil, nil)
    setProperty('camGame.visible', false)
    createCharacter('extra','flowey',1450,675,false,true)
    createIcon('extra',{325,(downscroll and 80 or 500)},false)
    setNotes('extra','3rd Player',{true,false,'',''})
    triggerEvent('Change Icon Follow Setting','extra', 'frame')
    triggerEvent("Change Icon Follow Setting", 'extra', 'visible')
    triggerEvent('Change Icon Mult Scale','extra', '0.4')
    setProperty("extra.visible", false)
    setProperty("iconP3.visible", false)

    makeLuaText('finalText','',0,0,0)
    addLuaText("finalText")
    setObjectCamera("finalText",'camOther')

    createInstance('camBF', 'flixel.FlxCamera')
    callMethod('camBF.copyFrom', {instanceArg('camGame')})
    createInstance('camDAD', 'flixel.FlxCamera')
    callMethod('camDAD.copyFrom', {instanceArg('camGame')})
    for i,v in ipairs ({'Game','HUD','Other'}) do
        callMethodFromClass('flixel.FlxG', 'cameras.remove', {instanceArg('cam'..v),false}) 
    end
    for i,v in ipairs ({'Game','BF','DAD','HUD','Other'}) do
        callMethodFromClass('flixel.FlxG', 'cameras.add', {instanceArg('cam'..v),v ~= 'HUD' and v ~= 'Other'}) 
    end
    for i,v in ipairs ({'BF','DAD'}) do
        setProperty('cam'..v..".width", screenWidth / 2)
        setProperty('cam'..v..".x", (v == 'DAD' and -720 or screenWidth))
        setProperty('cam'..v..".target", nil)
        setProperty('cam'..v..".scroll.x", getCharacterX(v:lower()) + (v == 'DAD' and -150 or 150))
        setProperty('cam'..v..".scroll.y", getCharacterY(v:lower()) - 50)
        setProperty("cam"..v..'.zoom', 0.52)
    end
end
function onSongStart()
    doTweenX("camBF", "camBF", screenWidth / 2, 0.6, "CircInOut")
    cameraFlash("hud", "000000", 1.0, nil)
end

function onUpdatePost()
    if getProperty("extra.animation.name") == 'Leave' and getProperty("extra.animation.curAnim.finished") then
        setProperty("extra.visible", false)
        setProperty("iconP3.visible", false)
    end
end
function onStepHit()
    if duetCam[1] ~= nil then
        if curStep == duetCam[1] then
            triggerEvent("Duet", nil, nil)
            table.remove(duetCam,1)
        end
    end
    if multipleTasks['ghostDAD'][1][1] ~= nil then
        if curStep >= multipleTasks['ghostDAD'][1][1] then
            multipleTasks['ghostDAD'][2]()
            table.remove(multipleTasks['ghostDAD'][1],1)
        end
    end
    if curStep == 64 then
        doTweenX("camDAD", "camDAD", 0, 0.6, "CircInOut")
    elseif curStep == 124 then
        for _,v in ipairs ({'BF','DAD'}) do
            startTween("kill"..v, "cam"..v, {y = 900,angle = (_ == 1 and 40 or -40),x = getProperty("cam"..v..'.x') + (_ == 1 and 40 or -40)},1,{ease = 'expoIn',onComplete = 'onTweenCompleted'})
        end
        --setProperty("camGame.visible", true)
        setProperty('defaultCamZoom', 0.6)
        doTweenZoom('therizz22', 'camgame', 0.6, 1.0, 'elasticInOut')
    elseif curStep == 368 then
        setProperty("camFollow.x", getProperty("camFollow.x") + 50)
        setProperty("camFollow.y", getProperty("camFollow.y") + 150)
        triggerEvent("Set Zoom", '0.8', '0.4')
        triggerEvent("Play Extra Character Animation", 'extra', 'Appear')
        setProperty("extra.visible", true)
        setProperty("iconP3.visible", true)
    elseif curStep == 639 then
        doTweenZoom("zoomg", "camGame", getProperty('defaultCamZoom') + 0.05, 0.1, "sineInOut")
        cameraShake("camHUD", 0.005, 0.2)
    elseif curStep == 648 then
        triggerEvent("Play Extra Character Animation", 'extra', 'Leave')
        cameraShake("camHUD", 0.005, 0.2)
    elseif curStep == 650 then
        cameraShake("camHUD", 0.005, 0.2)
    elseif curStep == 767 then
        doTweenZoom("zoomg", "camGame", getProperty('defaultCamZoom') + 0.02, 0.1, "sineInOut")
    elseif curStep == 798 then    
        for i,v in ipairs ({'gf','bird','bear','dogressa','rabbit','background','foreground'}) do
            setProperty(v..'.visible', false)
        end
        for i,v in ipairs({'boyfriend','dad'}) do
            runHaxeCode([[
                game.]]..v..[[.shader = getVar('colorOut');
            ]])
            setShaderBool(v,'invert',false)
            setShaderFloat(v, "lowerBound", 0.01)
            setShaderFloat(v, "upperBound", 0.5)
            setShaderFloatArray(v, "borderTint", {0/255,0/255,0/255})
            setShaderFloatArray(v, "tint", {255/255,255/255,255/255})
        end
        setProperty("c.visible", true)
    elseif curStep == 936 then
        cameraFlash('other', 'FFFFFF', 2.5, true)
    end

    if curSection >= 50 and curSection < 57 then
        if getProperty("camZoomingMult") == 0 then
            cancelTween("zoomg")
            return
        end
        if curStep % 8 == 0 then
            doTweenZoom("zoomg", "camGame", getProperty('defaultCamZoom') + 0.05, 0.2, "sineInOut")
        end
    end
    if curSection == 57 then
        if getProperty("camZoomingMult") == 0 then
            cancelTween("zoomg")
            return
        end
        if curStep % 4 == 0 then
            doTweenZoom("zoomg", "camGame", getProperty('defaultCamZoom') + 0.05, 0.1, "sineInOut")
        end
    end
end

function onSectionHit()
    if curSection == 58 then
        cameraShake("camHUD", 0.008, 0.4)
    end    
end

function onTweenCompleted(t)
    if t == "killBF" then
       setProperty("camGame.visible", true)
       cameraFlash("camGame", "000000", 0.6, nil) 
       doTweenY('ybear', 'bear', 1000, 0.2, 'bounceOut')
       doTweenY('ybird', 'bird', 1350, 0.2, 'bounceOut')
       doTweenY('ydogressa', 'dogressa', 1200, 0.2, 'bounceOut')
       doTweenY('yrabbit', 'rabbit', 1400, 0.2, 'bounceOut')
    end
end

function onGameOver()
    setProperty("camBF.visible", false)
    setProperty("camDAD.visible", false)
    setProperty('camGame.visible', true)
end