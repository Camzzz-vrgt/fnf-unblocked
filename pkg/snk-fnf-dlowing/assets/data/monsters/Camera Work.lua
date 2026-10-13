function onUpdate(elapsed)
end

function onTweenCompleted(tag)
if tag == 'zoomin' then
setProperty('defaultCamZoom', 1)
setProperty('opponentCameraOffset.x', 0)
end
end

function onStepHit()
if curStep == 1 then
doTweenZoom('zoomin', 'camGame', 1.6, 1, 'backInOut')
end
if curStep == 273 then
doTweenZoom('zoomin', 'camGame', 1, 1.4, 'quadInOut')
end
end