local speed = 4000
local imageSprite = 'red-room_BG3'
function onCreate()
    makeLuaSprite('BG_front', 'red-room_BG1_front')
    makeLuaSprite('BG_list_shadow', 'red-room_BG4')
    makeLuaSprite('BG_list1', 'red-room_BG_list')
    makeLuaSprite('BG_list2', 'red-room_BG_list2', 0, -getProperty("BG_list1.height"))
    makeLuaSprite('BG2', 'red-room_BG2')
    makeLuaSprite('popup1', 'red_room_Popup', 700, 500)
    makeLuaSprite('popup2', 'red_room_Popup2', 700, 500)
    makeLuaSprite('black', 'black')

    setProperty("BG_list_shadow.alpha",0)
    setProperty("BG_list1.alpha",0)
    setProperty("BG_list2.alpha",0)
    setProperty("popup1.alpha",0)
    setProperty("popup2.alpha",0)
    setProperty("black.alpha",0)


    scaleObject('BG_front',2,2)
    scaleObject('BG_list_shadow',2,2)
    scaleObject('BG_list1',2.4,4.4)
    scaleObject('BG_list2',2.4,2.4)
    scaleObject('BG2',2,2)
    scaleObject('popup1',2.86,2.86)
    scaleObject('popup2',2.86,2.86)
    scaleObject('black',2,2)

    addLuaSprite('BG_list1')
    addLuaSprite('BG_list2')
    addLuaSprite('BG_list_shadow')
    addLuaSprite('BG_front',true)
    addLuaSprite('BG2',true)
    addLuaSprite('black',true)
    addLuaSprite('popup1',true)
    addLuaSprite('popup2',true)
end

function onStartCountdown()
doTweenAlpha('hudGone', 'camHUD', 0, 0.0001 / playbackRate / playbackRate)
end

function onStepHit()
if curStep == 32 then
setProperty("BG2.alpha", 0)
doTweenAlpha('hudGone', 'camHUD', 1, 0.0001 / playbackRate / playbackRate)
elseif curStep == 800 then
doTweenAlpha('BG_front', 'BG_front', 0, 0.0001 / playbackRate)
doTweenAlpha('black', 'black', 1, 0.0001 / playbackRate)
doTweenAlpha('popup1', 'popup1', 1, 0.0001 / playbackRate)
doTweenAlpha('BG2', 'BG2', 1, 0.0001 / playbackRate)
setObjectOrder("BG2", getObjectOrder("dadGroup") - 1)
doTweenAlpha('hudGone', 'camHUD', 0, 0.0001 / playbackRate)
elseif curStep == 832 then
doTweenAlpha('black', 'black', 0, 0.0001 / playbackRate)
doTweenAlpha('popup1', 'popup1', 0, 0.0001 / playbackRate)
doTweenAlpha('hudGone', 'camHUD', 1, 0.0001 / playbackRate)
elseif curStep == 1344 then
doTweenAlpha('BG2', 'BG2', 0, 0.0001 / playbackRate)
doTweenAlpha('BG_list_shadow', 'BG_list_shadow', 1, 0.0001 / playbackRate)
setObjectOrder("BG_list_shadow", getObjectOrder("dadGroup"))
doTweenAlpha('BG_list1', 'BG_list1', 1, 0.0001 / playbackRate)
doTweenAlpha('BG_list2', 'BG_list2', 1, 0.0001 / playbackRate)
startLoopAnimation()
elseif curStep == 1856 then
doTweenAlpha('BG_list1', 'BG_list1', 0, 0.0001 / playbackRate)
doTweenAlpha('BG_list_shadow', 'BG_list_shadow', 0, 0.0001 / playbackRate)
doTweenAlpha('BG_front', 'BG_front', 1, 0.0001 / playbackRate)
doTweenAlpha('BG2', 'BG2', 1, 0.0001 / playbackRate)
setObjectOrder("BG2", getObjectOrder("BG_front") + 1)
doTweenAlpha('hudGone', 'camHUD', 0, 0.0001 / playbackRate)
doTweenAlpha('black', 'black', 1, 0.0001 / playbackRate)
elseif curStep == 1859 then
doTweenAlpha('black', 'black', 0, 0.1, "linear")
elseif curStep == 1888 then
doTweenAlpha('BG2', 'BG2', 0, 0.0001 / playbackRate)
doTweenAlpha('hudGone', 'camHUD', 1, 0.0001 / playbackRate)
elseif curStep == 2144 then
doTweenAlpha('black', 'black', 1, 0.0001 / playbackRate)
doTweenAlpha('popup2', 'popup2', 1, 0.0001 / playbackRate)
doTweenAlpha('hudGone', 'camHUD', 0, 0.0001 / playbackRate)
doTweenZoom('zoomInCam', 'camGame', 2, 0.0001 / playbackRate, 'quadOut')
elseif curStep == 2160 then
doTweenAlpha('popup2', 'popup2', 0, 0.0001 / playbackRate)
doTweenAlpha('black', 'black', 1, 0.0001 / playbackRate)
end
end

function onUpdate(elapsed)
    setProperty("BG_list1.y", getProperty("BG_list1.y") - speed * elapsed)
    setProperty("BG_list2.y", getProperty("BG_list2.y") - speed * elapsed)

    if getProperty("BG_list1.y") <= -getProperty("BG_list1.height") then
        setProperty("BG_list1.y", getProperty("BG_list2.y") + getProperty("BG_list2.height"))
    end
    if getProperty("BG_list2.y") <= -getProperty("BG_list2.height") then
        setProperty("BG_list2.y", getProperty("BG_list1.y") + getProperty("BG_list1.height"))
    end
end

function onTimerCompleted(t)
    if t == 'zoomOutTimer' then
        doTweenZoom('zoomOutCam', 'camGame', 0.7, 2 / playbackRate, 'quadOut')
    end
end