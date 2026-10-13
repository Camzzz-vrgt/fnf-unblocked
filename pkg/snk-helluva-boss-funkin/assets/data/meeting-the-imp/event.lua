function onCreatePost()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
addLuaScript('custom_events/Flash Camera')

dadX = getProperty('dad.x')
dadY = getProperty('dad.y')

bfX = getProperty('boyfriend.x')
bfY = getProperty('boyfriend.y')

end


function onEvent(n,v1,v2)
if n == 'camera_target' then
if v1 == 'all' then
folowcam = true

else
folowcam = false
end
end

if n == 'WBG' then
if v1 == 'Won' or v1 == 'Bon' then
setProperty('bg7.visible', false)
setProperty('bg8.visible', false)
end
if v1 == 'off' then
setProperty('bg7.visible', true)
setProperty('bg8.visible', true)
end
end


if string.lower(n) == 'change character' then
    if string.lower(v1) == 'dad' then
        if string.lower(v2) == 'blitzo-colors' then
            setObjectCamera('dad', 'hud')
            setProperty('dad.x', 260)
            setProperty('dad.y', 100)
            -- setScrollFactor('dadGroup',0,0)
        elseif string.lower(v2) == 'blitzo-sketch' then
            setObjectCamera('dad', 'hud')
            setProperty('dad.x', 0)
            setProperty('dad.y', -150)
        else
            -- setScrollFactor('dadGroup',1,1)
            setObjectCamera('dad', 'game')
            setProperty('dad.x', dadX)
            setProperty('dad.y', dadY)
        end
    end

    if string.lower(v1) == 'bf' then
        if string.lower(v2) == 'bf-sketch' then
            -- setScrollFactor('boyfriend',0,0)
            setObjectCamera('boyfriend', 'hud')
            setProperty('boyfriend.x', 0)
            setProperty('boyfriend.y', -150)
        else
            -- setScrollFactor('boyfriend',1,1)
            setObjectCamera('boyfriend', 'game')
            setProperty('boyfriend.x', bfX)
            setProperty('boyfriend.y', bfY)
        end
    end
end

end



folowcam = true
camX = 2300
camY = 1200
function onUpdate()

if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)

end


end

camS = false
function onStepHit()
if curStep == 32 then
beatn = 1
elseif curStep == 288 then
beatn = 2
elseif curStep == 560 then
camS = true
elseif curStep == 765 or curStep == 894 or curStep == 1023 or curStep == 1283 or curStep == 1823 then
beatn = 0
elseif curStep == 800 or curStep == 928 or curStep == 1056 or curStep == 1568 then
beatn = 2
elseif curStep == 1567 then
camS = false
elseif curStep == 2112 then
doTweenAlpha('9whe', 'camHUD', 0, 1, 'sineInOut')

end
end


function onMoveCamera(f)
if camS then
if f == 'boyfriend' and not mustHitSection then
setProperty('cameraSpeed', 1000)
setProperty('flash.alpha',1)
doTweenAlpha('flTw','flash',0,1,'linear')
runTimer('norS', 0.1)
elseif f == 'dad' and mustHitSection then
setProperty('cameraSpeed', 1000)
setProperty('flash.alpha',1)
doTweenAlpha('flTw','flash',0,1,'linear')
runTimer('norS', 0.1)
end
end
end

function onTimerCompleted(t)
if t == 'norS' then
setProperty('cameraSpeed', 1)
end
end

beatn = 0
function onBeatHit()

if curBeat %2 == 0 and beatn == 1 then
triggerEvent('Add Camera Zoom', 0.05, 0.05)
end

if curBeat %2 == 0 and beatn == 2 then
triggerEvent('Add Camera Zoom', 0.1, 0.05)
doTweenZoom('nsud', 'camGame', getProperty('defaultCamZoom'), 0.3, 'sineInOut')
doTweenZoom('ns', 'camHUD', 1, 0.3, 'sineInOut')
end

end