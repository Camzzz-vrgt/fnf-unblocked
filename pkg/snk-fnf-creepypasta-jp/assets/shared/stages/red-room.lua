local speed = 4000
local imageSprite = 'red-room_BG3'
function onCreate()
    makeLuaSprite('BG_front', 'red-room_BG1_front', 0, 0);
    makeLuaSprite('BG_list_shadow', 'red-room_BG4', 0, 0);
    makeLuaSprite('BG_list1', 'red-room_BG_list', 0, 0);
    makeLuaSprite('BG_list2', 'red-room_BG_list2', 0, -getProperty("BG_list1.height"));
    makeLuaSprite('BG2', 'red-room_BG2', 0, 0);
    makeLuaSprite('popup1', 'red_room_Popup', 700, 500);
    makeLuaSprite('popup2', 'red_room_Popup2', 700, 500);
    makeLuaSprite('black', 'black', 0, 0);

    setProperty("BG_list_shadow.alpha", 0)
    setProperty("BG_list1.alpha", 0)
    setProperty("BG_list2.alpha", 0)
    setProperty("popup1.alpha", 0)
    setProperty("popup2.alpha", 0)
    setProperty("black.alpha", 0)

    scaleObject('BG_list1', 1.2, 1.2)
    scaleObject('BG_list2', 1.2, 1.2)
    scaleObject('popup1', 1.43, 1.43)
    scaleObject('popup2', 1.43, 1.43)

    addLuaSprite('BG_list1', false);
    addLuaSprite('BG_list2', false);
    addLuaSprite('BG_list_shadow', false);
    addLuaSprite('BG_front', true);
    addLuaSprite('BG2', true);
    addLuaSprite('black', true);
    addLuaSprite('popup1', true);
    addLuaSprite('popup2', true);
end

function onStartCountdown()
    doTweenAlpha('hudGone', 'camHUD', 0, 0.0001 / playbackRate / playbackRate, "linear");
end

function onUpdate(elapsed)
    if curStep == 1 then
        setProperty("BG2.alpha", 1)
    elseif curStep == 32 then
        setProperty("BG2.alpha", 0)
        doTweenAlpha('hudGone', 'camHUD', 1, 0.0001 / playbackRate / playbackRate, "linear")
    elseif curStep == 800 then
        doTweenAlpha('BG_front', 'BG_front', 0, 0.0001 / playbackRate, 'linear')
        doTweenAlpha('black', 'black', 1, 0.0001 / playbackRate, "linear")
        doTweenAlpha('popup1', 'popup1', 1, 0.0001 / playbackRate, 'linear')
        doTweenAlpha('BG2', 'BG2', 1, 0.0001 / playbackRate, 'linear')
        setObjectOrder("BG2", getObjectOrder("dadGroup") - 1)
        doTweenAlpha('hudGone', 'camHUD', 0, 0.0001 / playbackRate, "linear")
    elseif curStep == 832 then
        doTweenAlpha('black', 'black', 0, 0.0001 / playbackRate, "linear")
        doTweenAlpha('popup1', 'popup1', 0, 0.0001 / playbackRate, 'linear')
        doTweenAlpha('hudGone', 'camHUD', 1, 0.0001 / playbackRate, "linear")
    elseif curStep == 1344 then
        doTweenAlpha('BG2', 'BG2', 0, 0.0001 / playbackRate, 'linear')
        doTweenAlpha('BG_list_shadow', 'BG_list_shadow', 1, 0.0001 / playbackRate, 'linear')
        setObjectOrder("BG_list_shadow", getObjectOrder("dadGroup") - 1)
        doTweenAlpha('BG_list1', 'BG_list1', 1, 0.0001 / playbackRate, 'linear')
        doTweenAlpha('BG_list2', 'BG_list2', 1, 0.0001 / playbackRate, 'linear')
        startLoopAnimation()
    elseif curStep == 1856 then
        doTweenAlpha('BG_list1', 'BG_list1', 0, 0.0001 / playbackRate, 'linear')
        doTweenAlpha('BG_list_shadow', 'BG_list_shadow', 0, 0.0001 / playbackRate, 'linear')
        doTweenAlpha('BG_front', 'BG_front', 1, 0.0001 / playbackRate, 'linear')
        doTweenAlpha('BG2', 'BG2', 1, 0.0001 / playbackRate, 'linear')
        setObjectOrder("BG2", getObjectOrder("BG_front") + 1)
        doTweenAlpha('hudGone', 'camHUD', 0, 0.0001 / playbackRate, "linear")
        doTweenAlpha('black', 'black', 1, 0.0001 / playbackRate, "linear")
    elseif curStep == 1859 then
        doTweenAlpha('black', 'black', 0, 0.1, "linear")
    elseif curStep == 1888 then
        doTweenAlpha('BG2', 'BG2', 0, 0.0001 / playbackRate, 'linear')
        doTweenAlpha('hudGone', 'camHUD', 1, 0.0001 / playbackRate, "linear")
    elseif curStep == 2144 then
        doTweenAlpha('black', 'black', 1, 0.0001 / playbackRate, "linear")
        doTweenAlpha('popup2', 'popup2', 1, 0.0001 / playbackRate, 'linear')
        doTweenAlpha('hudGone', 'camHUD', 0, 0.0001 / playbackRate, "linear")
        doTweenZoom('zoomInCam', 'camGame', 2, 0.0001 / playbackRate, 'quadOut');
    elseif curStep == 2160 then
        doTweenAlpha('popup2', 'popup2', 0, 0.0001 / playbackRate, 'linear')
        doTweenAlpha('black', 'black', 1, 0.0001 / playbackRate, "linear")
    end

    setProperty("BG_list1.y", getProperty("BG_list1.y") - speed * elapsed)
    setProperty("BG_list2.y", getProperty("BG_list2.y") - speed * elapsed)

    if getProperty("BG_list1.y") <= -getProperty("BG_list1.height") then
        setProperty("BG_list1.y", getProperty("BG_list2.y") + getProperty("BG_list2.height"))
    end
    if getProperty("BG_list2.y") <= -getProperty("BG_list2.height") then
        setProperty("BG_list2.y", getProperty("BG_list1.y") + getProperty("BG_list1.height"))
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'zoomOutTimer' then
        doTweenZoom('zoomOutCam', 'camGame', 0.7, 2 / playbackRate, 'quadOut');
    end
end