function onUpdate(elapsed)
end

function onTweenCompleted(tag)
if tag == 'zoomin' then
setProperty('defaultCamZoom', 0.8)
setProperty('opponentCameraOffset.x', 0)
end
end

function onStepHit()
if curStep == 375 then
doTweenZoom('zoomin', 'camGame', 1, 1.6, 'quadInOut')
end
if curStep == 764 then
doTweenZoom('zoomin', 'camGame', 1, 0.5, 'quadInOut')
end
end