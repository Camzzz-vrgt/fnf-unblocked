triggerEvent("Solid Color Trail", 'dad', nil)
triggerEvent("Toggle Frame Trail", 'dad', nil)

duetCam = {255,271,319,383,576,656,704,720,736,752,768,784,928,1024,1055,1664,2207,2462}
ghostUse = {
    ['boyfriend'] = {{444,452,477,487,594,607,614,623,629,637,726,734,1149,1174,1389,1408},function() 
        triggerEvent("Toggle Trail", 'boyfriend', nil)
        triggerEvent("Toggle Ghost For One", 'boyfriend', nil)
    end},
    ['dad'] = {{62,127,704,752,1039,1055,2479,2511},function()
        triggerEvent("Toggle Trail", 'dad', nil)
        triggerEvent("Toggle Ghost For One", 'dad', nil)
    end},
    ['moveGhostBF'] = {{1554,1662,2553,2465},function()
        triggerEvent('Move Ghost', 'boyfriend')
    end},
    ['moveGhostDad'] = {{798,816,828,881,1553,1668,2207,2396,2494},function()
        triggerEvent('Move Ghost', 'dad')
    end},
}
function onUpdate(e)
    addHealth(-0.000045)
end

function onCreatePost()
    runHaxeCode([[
        var colorOut = new FlxRuntimeShader(File.getContent(Paths.shaderFragment('colorOut'))); 
        setVar('colorOut',colorOut);
    ]])
    makeLuaSprite("redshit", 'redstuff', -1000, -500)
    addLuaSprite("redshit")
    scaleObject("redshit", 5.0, 5.0)
    setProperty("redshit.alpha", 0)

    makeLuaText("warning", "This song can crash when is gonna load the video\nSorry if it crash we would invite u to restart it\nWe are gonna fix it on future update", 0, 0.0, 0.0)
    screenCenter("warning")
    addLuaText("warning")
    setTextSize("warning", 20)
    setTextFont("warning", "DT.ttf")
end

function onSongStart()
    doTweenAlpha("ting", "warning", 0, 1)
end

function onTweenCompleted(tag, vars)
    if tag == 'ting' then
        removeLuaText("warning")
    end
end

function onStepHit()
    if duetCam ~= nil then
        if curStep >= duetCam[1] then
            triggerEvent("Duet", nil, nil)
            table.remove(duetCam, 1)
        end
    end
    if ghostUse['dad'] ~= nil then
        if curStep >= ghostUse['dad'][1][1] then
            ghostUse['dad'][2]()
            table.remove(ghostUse['dad'][1], 1)
        end
    end
    if ghostUse['moveGhostDad'] ~= nil then
        if curStep >= ghostUse['moveGhostDad'][1][1] then
            ghostUse['moveGhostDad'][2]()
            table.remove(ghostUse['moveGhostDad'][1], 1)
        end
    end
    if curStep == 861 then
        cameraFlash("HUD", "000000", 3.0, nil)
        setProperty("redshit.alpha", 100)
        cameraFlash("HUD", "000000", 1.0, nil)
        for i,v in ipairs({'boyfriend','dad'}) do
            -- callScript("scripts/sillyDoubleGhost", "changeProps",{9,nil,v})
            runHaxeCode([[
                game.]]..v..[[.shader = getVar('colorOut');
            ]])
            setShaderBool(v,'invert',false)
            setShaderFloat(v, "lowerBound", 0.01)
            setShaderFloat(v, "upperBound", 0.45)
             --setShaderFloat(v, "upperBound", i == 3 and 0.3 or 1)
            setShaderFloatArray(v, "borderTint", {0/255,0/255,0/255})
            setShaderFloatArray(v, "tint", {255/255,255/255,255/255})
        end
        setProperty("quack.visible", false)
        setProperty("vingette.visible", false)
        doTweenColor("theredturnsblack", "redshit", "000000", 0.2, "linear")
    elseif curStep == 887 then
        cameraFade("HUD", "FFFFFF", 0.5, true)
    elseif curStep == 896 then
        cameraFade("HUD", "FFFFFF", 10000000, true)
        setProperty("redshit.alpha", 0);
        cameraFlash("HUD", "000000", 3.0, nil)
        removeSpriteShader("dad")
        removeSpriteShader("boyfriend")
        setProperty("quack.visible", true)
        setProperty("vingette.visible", true)
    elseif curStep == 1664 then
        doTweenAlpha("uiGroupbye", "uiGroup", 0, 0.5)
        for i = 0,7 do
            noteTweenAlpha(i, i, 0, 0.5)
        end
        doTweenAlpha('theeeeeeeee', 'camGame', 0, 0.5, 'linear')
    elseif curStep == 1943 then
        for i = 0,7 do
            noteTweenAlpha(i, i, 1, 0.5)
        end 
        doTweenAlpha("uiGroupbye", "uiGroup", 1, 0.5)
        doTweenAlpha('theeeeeeeee2', 'camGame', 100, 1, 'linear')
    elseif curStep == 2512 then
        doTweenAlpha('theeeeeeeee2', 'camHUD', 1, 1, 'linear')
        setProperty('camGame.visible', false)
    end
end

local playFinal = true
function onEndSong()
    if isStoryMode and playFinal then
        startVideo('thereckoningofmauron')
        playFinal = false
        return Function_Stop
    end
end