function onUpdate(elapsed)
end

function onStepHit()
if curStep == 256 then
doTweenZoom('zoomin', 'camGame', 1.2, 1.39, 'quadInOut')
end
if curStep == 816 then
doTweenZoom('zoomin', 'camGame', 1.1, 1.39, 'quadInOut')
end
if curStep == 1328 then
doTweenZoom('zoomout', 'camGame', 0.7, 1.29, 'quadInOut')
end
if curStep == 1872 then
doTweenZoom('zoomin', 'camGame', 1.1, 1.39, 'quadInOut')
end
if curStep == 2427 then
doTweenZoom('zoomin', 'camGame', 1.5, 4, 'quadInOut')
end
end