function onUpdate()
    addHealth(-0.000045)
end
addCharacterToList("sans-shadow", "dad")
function onStartCountdown()
    doTweenColor("thedadrizz", "dadGroup", "000000", 0.1, "linear")
    setProperty('camHUD.visible', false)

    --setProperty("redshit.alpha", 1)
    setProperty('dad.alpha', 0)
    setProperty("puesto.color", 0x000000)
    setProperty("puesto.alpha", 0)
end

function onStepHit()
    if curStep == 48 then
        doTweenAlpha("sansJumpscare", "dad", 1, 1, "CircIn")
        doTweenAlpha("sansStand", "puesto", 1, 1, "CircIn")

    elseif curStep == 64 then
        setProperty("snowdinF.alpha", 0.8)
        setProperty("snowdinF.color", '000000')
        doTweenColor("sanspost", "puesto", "FFFFFF", 0.1, "linear")
        doTweenColor("thedadrizz2", "dadGroup", "FFFFFF", 0.1, "linear")
        setProperty('camHUD.visible', true)
        setProperty("isCameraOnForcedPos", true)
        setProperty("camFollow.y", getProperty("camFollow.y") - 200)
        setProperty('defaultCamZoom',0.65)
    elseif curStep == 120 then
        doTweenY('cam','camFollow',getProperty("camFollow.y") + 80,1,'sineIn')
        triggerEvent("Set Zoom",'0.43','1')
        doTweenAlpha('red','snowdinF',0,0.6,'sineIn')
    elseif curStep == 320 then
        cameraFlash("game", "FFFFFF", 2.0, nil)
    elseif curStep == 953 then
        cameraFade("game", "FFFFFF", 1.0, true)
    elseif curStep == 960 then
        cameraFade("game", "FFFFFF", 10000000, true)
        cameraFlash("game", "000000", 3.0, nil)
        setProperty("snowdinF.alpha", 1)
        setProperty("snowdinF.color", 0xFFFFFF)
        cameraFlash("HUD", "000000", 1.0, nil)
        --triggerEvent("Set Zoom", getProperty("defaultCamZoom") - 0.05,'1')
        --startTween("abcd", "dad.colorTransform", {redOffset = 255, greenOffset = 255, blueOffset = 255}, 0.2, 'linear')
        callScript("stages/"..curStage, "shadowAppear")
        triggerEvent("Change Character", 'dad', 'sans-shadow')
        callMethod("dad.setPosition",{1250,550})
    elseif curStep == 1144 then
        --cameraFade("HUD", "FFFFFF", 0.5, true)
    elseif curStep == 1152 then
        --triggerEvent("Set Zoom", getProperty("defaultCamZoom") + 0.5, '1')
        --cameraFade("game", "FFFFFF", 1, true)
        setProperty("snowdinF.alpha", 0)
        cameraFlash("game", "000000", 3.0, nil)
        callScript("stages/"..curStage, "shadowAppear")
        triggerEvent("Change Character", 'dad', 'horrorsans')
        cameraSetTarget("dad")
        callMethod("camGame.snapToTarget", {''})
        setProperty("isCameraOnForcedPos", true)
        setProperty("camFollow.y", getProperty("camFollow.y") - 120)
        --startTween("abcd", "dad.colorTransform", {redOffset = 0, greenOffset = 0, blueOffset = 0}, 0.2, 'linear')
    elseif curStep == 1280 then
        doTweenAlpha("mr", "camHUD", 0, 1.8, "sineIn")
        doTweenAlpha('red2','snowdinF',1,0.6,'sineIn')
        doTweenColor("thedadrizz", "dadGroup", "000000", 0.6, "sineIn")
        doTweenColor("thestandrizz", "puesto", "000000", 0.6, "sineIn")
        doTweenColor("red", "snowdinF", "6e0000", 0.6, "sineIn")
    end
end