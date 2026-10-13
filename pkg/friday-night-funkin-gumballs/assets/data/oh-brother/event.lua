function onStepHit()
if curStep == 640 or curStep == 1279 then
setProperty('isCameraOnForcedPos', true)
setProperty('camFollow.x', getMidpointX('gf')+getProperty('gf.cameraPosition[0]')+getProperty('girlfriendCameraOffset[0]'))
   setProperty('camFollow.y', getMidpointY('gf')+getProperty('gf.cameraPosition[1]')+getProperty('girlfriendCameraOffset[1]'))
end
if curStep == 896 or curStep == 1407 then
setProperty('isCameraOnForcedPos', false)
end
end