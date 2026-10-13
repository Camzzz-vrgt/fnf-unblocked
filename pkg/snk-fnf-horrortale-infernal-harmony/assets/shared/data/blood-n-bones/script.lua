activateGhost = {
    ['boyfriend'] = {{299,320,365,384,637,720,1453},function() 
        triggerEvent('Move Ghost', 'boyfriend')
        table.remove(activateGhost['boyfriend'][1],1)
    end},
    ['dad'] = {{144,193,238,256,571,609,1454},function()
        triggerEvent('Move Ghost', 'dad')
        table.remove(activateGhost['dad'][1],1)
    end},
}

multipleTasks = {
    ['ghostBF'] = {{444,452,477,487,594,607,614,623,629,637,726,734,1149,1174,1389,1408},function() 
        triggerEvent("Toggle Trail", 'boyfriend', nil)
        triggerEvent("Toggle Ghost For One", 'boyfriend', nil)
    end},
    ['ghostDAD'] = {{534,543,551,560,566,574,662,670},function()
        triggerEvent("Toggle Trail", 'dad', nil)
        triggerEvent("Toggle Ghost For One", 'dad', nil)
    end},
}

local duetCam = {64,80,127,143,447,454,591,607,655,735,751,783,863,1055,1087,1118,1151,1175,1263,1279,1291,1343,1391,1407,1423}

addLuaScript("events/Pixel Screen")
triggerEvent("Solid Color Trail", 'dad', nil)
triggerEvent("Toggle Frame Trail", 'dad', nil)
triggerEvent("Toggle Frame Trail", 'boyfriend', nil)
triggerEvent("Solid Color Trail", 'boyfriend', nil)

function onUpdate()
    if getHealth() >= 0.4 then
        addHealth(-0.000050)
    end
end

function onBeatHit()
    cameraShake("Game", 0.0010, 0.2)
end

function onCreatePost()
    triggerEvent("Duet", nil, nil)
    makeLuaSprite("redshit",nil)
    makeGraphic("redshit",1,1,'6e0000')
    addLuaSprite("redshit")
    scaleObject("redshit", screenWidth * 8, screenHeight * 12,false)
    setProperty("redshit.alpha", 0)

    makeLuaSprite("darkerBG",nil)
    makeGraphic("darkerBG",1,1,'000000')
    addLuaSprite("darkerBG")
    scaleObject("darkerBG", screenWidth * 8, screenHeight * 12,false)
    setProperty("darkerBG.alpha", 0)

end
local stupidCustomCurStep = 5

function onSongStart()
    removeTime = 139 * 1000
    setProperty("songLength", removeTime)
    triggerEvent("Duet", nil, nil)
    --callMethod("setSongTime",{removeTime - (20 * 1000)})
end
function onStepHit()
    if curStep > 3 and curStep < 383 then
        stupidCustomCurStep = stupidCustomCurStep + 1
        if stupidCustomCurStep % 6 == 0 then
            setProperty("camGame.zoom", getProperty("camGame.zoom") + 0.015)
        end
    end

    if activateGhost['boyfriend'][1][1] ~= nil then
        if curStep >= activateGhost['boyfriend'][1][1] then
            activateGhost['boyfriend'][2]()
        end
    end
    if activateGhost['dad'][1][1] ~= nil then
        if curStep >= activateGhost['dad'][1][1] then
            activateGhost['dad'][2]()
        end
    end
    if duetCam[1] ~= nil then
        if curStep >= duetCam[1] then
            triggerEvent("Duet", nil, nil)
            table.remove(duetCam,1)
        end
    end
    if multipleTasks['ghostBF'][1][1] ~= nil then
        if curStep >= multipleTasks['ghostBF'][1][1] then
            multipleTasks['ghostBF'][2]()
            table.remove(multipleTasks['ghostBF'][1],1)
        end
    end
    if multipleTasks['ghostDAD'][1][1] ~= nil then
        if curStep >= multipleTasks['ghostDAD'][1][1] then
            multipleTasks['ghostDAD'][2]()
            table.remove(multipleTasks['ghostDAD'][1],1)
        end
    end
    if curStep == 149 then    
        doTweenZoom("cam", "camGame", getProperty('defaultCamZoom') + 0.08, 0.7, "sineIn")
    elseif curStep == 160 then
        triggerEvent('Change Scroll Speed','1.0','0.7')
    elseif curStep == 172 or curStep == 236 or curStep == 573 then
        triggerEvent("Set Zoom", '0.7', '0.4')
		setProperty('isCameraOnForcedPos',true)
        doTweenX("camLOLX", "camFollow", getProperty('camFollow.x') - 100, 0.4, "sineIn")
        --doTweenY("camLOLY", "camFollow", defaultOpponentY, 0.4, "sineIn")
        doTweenAlpha("darker", "darkerBG", 0.3, 0.4, "sineIn")
        cameraShake("hud", 0.005, 2.6)
    elseif curStep == 192 or curStep == 256 or curStep == 320 or curStep == 609 or curStep == 718 then
        setProperty('isCameraOnForcedPos',false)
        doTweenAlpha("darkerbg", "darkerBG", 0, 0.4, "sineIn")
    elseif curStep == 196 then
        doTweenZoom("shakeAfter", "camGame", getProperty("camGame.zoom") + 0.08, 0.2, "expoOut")
    elseif curStep == 301 or curStep == 364 or curStep == 638 then
        triggerEvent("Set Zoom", '0.7', '0.4')
		setProperty('isCameraOnForcedPos',true)
        doTweenX("camLOLX", "camFollow", getProperty('camFollow.x') + 140, 0.4, "sineIn")
        doTweenY("camLOLY", "camFollow", getProperty('camFollow.y') + 100, 0.4, "sineIn")
        doTweenAlpha("darker", "darkerBG", 0.3, 0.4, "sineIn")
        cameraShake("hud", 0.005, 2.6)
    elseif curStep == 384 or curStep == 1119 or curStep == 1327 then
        setProperty('isCameraOnForcedPos',false)
        cameraSetTarget("dad")
        triggerEvent("Voicelines", '0.5', nil)
        callMethod('camGame.snapToTarget',{''})
        for i = 0,3 do
            setPropertyFromGroup("strumLineNotes", i, 'alpha', 0)
        end
        setProperty("darkerBG.alpha", 0.8)
        setProperty('defaultCamZoom', 0.80)
        cameraFlash("game", "000000", 1.5, true)
        setProperty('isCameraOnForcedPos',true)
        doTweenX("camLOLX", "camFollow", getProperty('camFollow.x') - 100, 0.4, "sineIn")
    elseif curStep == 448 or curStep == 1150 or curStep == 1343 then
        setProperty('isCameraOnForcedPos',false)
        triggerEvent("Voicelines", '0.5', nil)
        setProperty("darkerBG.alpha", 0)
        cameraFlash("game", "000000", 1.0, true)
        --doTweenAlpha("darkerbg", "darkerBG", (curStep == 453 or curStep == 487 and 0 and 0.4), 0.4, "sineIn")
    elseif curStep == 453 or curStep == 1152 or curStep == 1344 then
        for i = 0,3 do
            noteTweenAlpha(i, i, 1, 0.4, "sineIn")
        end
    elseif curStep == 488 then
        doTweenAlpha("darkerbg", "darkerBG", 0, 0.4, "sineIn")
    elseif curStep == 512 then
        triggerEvent("Pixel Screen", '5', '2')
        setProperty('isCameraOnForcedPos',false)
    elseif curStep == 524 then
        setProperty('defaultCamZoom', 1.20)
    elseif curStep == 528 then
        triggerEvent("Pixel Screen", '0', '0.1')
        setProperty('defaultCamZoom', 0.60)
        cameraShake("HUD", 0.0025, 31.0)
        cameraFlash("game", "FFFFFF", 1.5, true)
    elseif curStep == 719 then
        setProperty('isCameraOnForcedPos',true)
    elseif curStep == 785 then
        triggerEvent("Pixel Screen", '5', '2')
    elseif curStep == 796 then
        setProperty('defaultCamZoom', 1.60)
        cameraShake("HUD", 0.0035, 31.0)
    elseif curStep == 800 then
        runHaxeCode([[
            var colorOut = new FlxRuntimeShader(File.getContent(Paths.shaderFragment('colorOut'))); 
            setVar('colorOut',colorOut);
        ]])
        for i,v in ipairs({'boyfriend','dad','gf','iconP1','iconP2'}) do
           -- callScript("scripts/sillyDoubleGhost", "changeProps",{9,nil,v})
            runHaxeCode([[
                game.]]..v..[[.shader = getVar('colorOut');
            ]])
            setShaderBool(v,'invert',false)
            setShaderFloat(v, "lowerBound", 0.01)
            setShaderFloat(v, "upperBound", 0.4)
            setShaderFloatArray(v, "borderTint", {0/255,0/255,0/255})
            setShaderFloatArray(v, "tint", {255/255,255/255,255/255})
        end
        --setShaderFloat('iconP2', "upperBound", 0.2)
        setHealthBarColors("000000","FF0000")
        triggerEvent("Toggle Ghost For All", nil, nil)
        callScript("stages/"..curStage, "showBG")
        callScript("stages/"..curStage, "shaderToggle",{false})
        setProperty('defaultCamZoom', 0.50)
        cameraShake("HUD", 0.0050, 29.65)
        cameraFlash("hud", "FFFFFF", 1.5, true)
    elseif curStep == 911 then
        doTweenZoom("cam", "camGame", getProperty('defaultCamZoom') + 0.05, 1, "sineOut")
    elseif curStep == 923 then
        doTweenZoom("cam", "camGame", getProperty('defaultCamZoom') - 0.05, 0.6, "sineIn")
    elseif curStep == 1052 then
        setProperty('defaultCamZoom', 1.20)
    elseif curStep == 1056 then
        callScript("stages/"..curStage, "showBG")
        for i,v in ipairs({'boyfriend','dad','gf','iconP1','iconP2'}) do
            removeSpriteShader(v)
        end
        setHealthBarColors(string.format('%02x%02x%02x', unpack(getProperty('dad.healthColorArray'))), string.format('%02x%02x%02x', unpack(getProperty('boyfriend.healthColorArray'))))
        triggerEvent("Toggle Ghost For All", nil, nil)
        removeSpriteShader("boyfriend")
        removeSpriteShader("dad")
        setProperty('defaultCamZoom', 0.70)
        callScript("stages/"..curStage, "shaderToggle",{true})
    elseif curStep == 1174 then
        triggerEvent("Toggle Ghost For All", nil, nil)
    elseif curStep == 1176 then
        triggerEvent("Set Zoom", '1.5', '0.4')
        doTweenAlpha("therizz", "redshit", 100, 0.4, "linear")
        doTweenColor("thebfrizz", "boyfriend", "000000", 0.4, "linear")
        doTweenColor("thedadrizz", "dadGroup", "000000", 0.4, "linear")
        doTweenColor("thegfrizz", "gfGroup", "000000", 0.4, "linear")
        cameraFlash("hud", "000000", 0.5, nil)
        setProperty('isCameraOnForcedPos',true)
        doTweenX("camLOLX", "camFollow", getProperty('camFollow.x') + 150, 0.2, "sineIn")
        doTweenY("camLOLY", "camFollow", getProperty('camFollow.y') + 200, 0.2, "sineIn")
        --setProperty('cameraSpeed', 100.5)
    elseif curStep == 1198 then
        setProperty('isCameraOnForcedPos',false)
        cameraSetTarget("dad")
        callMethod('camGame.snapToTarget',{''})
        startTween('silly','game', {songLength = songLength},5,{ease = 'expoOut'})
        triggerEvent("Set Zoom", '0.6', '5')
        triggerEvent("Toggle Ghost For All", nil, nil)
        setProperty('isCameraOnForcedPos',true)
        setProperty("camFollow.x", getProperty("camFollow.x") - 200)
        setProperty("camFollow.y", getProperty("camFollow.y") + 100)
    elseif curStep == 1204 then
        doTweenAlpha("therizz2", "redshit", 0, 0.1, "linear")
        doTweenColor("thebfrizz2", "boyfriend", "FFFFFF", 0.1, "linear")
        doTweenColor("thedadrizz2", "dadGroup", "FFFFFF", 0.1, "linear")
        doTweenColor("thegfrizz", "gfGroup", "FFFFFF", 0.1, "linear")
        cameraFlash("hud", "FFFFFF", 1.5, true)
        setProperty('defaultCamZoom', 0.60)
    elseif curStep == 1215 then
        setProperty('isCameraOnForcedPos',false)
        cameraSetTarget("dad")
    elseif curStep == 1324 then
        setProperty('defaultCamZoom', 1.70)
    elseif curStep == 1328 then
        setProperty('defaultCamZoom', 0.70)
    elseif curStep == 1448 then
        doTweenAlpha("darkerbg", "darkerBG", 0.4, 0.4, "sineIn")
    elseif curStep == 1456 then
        cameraFade("HUD", "000000", 3.0, true)
    end
end

function onSectionHit()
    if curStep >= 911 and curStep < 1055 then
        doTweenZoom("horro", "camGame", getProperty('defaultCamZoom') - 0.04, 1, "sineOut")
    end
end

function onTweenCompleted(tag)
    if tag == 'shakeAfter' then
        cameraShake("hud", 0.003, 0.1)
    end    
end