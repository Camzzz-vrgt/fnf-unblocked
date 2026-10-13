function onUpdate(elapsed)
end

function onTweenCompleted(tag)
if tag == 'zoomin' then
setProperty('defaultCamZoom', 0.8)
setProperty('opponentCameraOffset.x', 0)
end
end

function onStepHit()
if curStep == 2 then
doTweenZoom('zoomin', 'camGame', 0.8, 13, 'sineInOut')
end
if curStep == 770 then
doTweenZoom('zoomin', 'camGame', 0.8, 3.2, 'sineInOut')
end
end