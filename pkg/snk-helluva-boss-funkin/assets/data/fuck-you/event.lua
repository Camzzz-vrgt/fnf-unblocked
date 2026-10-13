function onCreatePost()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
doTweenZoom('zoomoutall', 'camGame', 0.7, 0.01)
setProperty('cameraSpeed', 2)
end

function onSongStart()
setProperty('camGame.alpha', 1)
setProperty('bg1.visible', false)
setProperty('bg2.visible', false)
setProperty('bg3.visible', false)
setProperty('bg4.visible', false)
setProperty('bg5.visible', false)
setProperty('bg6.visible', false)
setProperty('bg7.visible', false)
setProperty('bg8.visible', false)
setProperty('bg9.visible', false)
setProperty('bg10.visible', false)
end

function onEvent(n,v1,v2)
if n == 'camera_target' then
if v1 == 'all' then
folowcam = true
else
 folowcam = false
end
end
end

folowcam = false
camX = 2300
camY = 1200
function onUpdate()
if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end


function onStepHit()
if curStep == 64 then
folowcam = true
elseif curStep == 128 then
setProperty('camGame.alpha', 0)
elseif curStep == 152 or curStep == 160 or curStep == 184 then
setProperty('camGame.alpha', 1)
doTweenAlpha('odj', 'camGame', 0, 1)
elseif curStep == 192 then
setProperty('camGame.alpha', 1)
elseif curStep == 240 then
setProperty('camGame.alpha', 0)
elseif curStep == 260 then
setProperty('camGame.alpha', 1)
setProperty('camHUD.alpha', 1)
setProperty('bg1.visible', true)
setProperty('bg2.visible', true)
setProperty('bg3.visible', true)
setProperty('bg4.visible', true)
setProperty('bg5.visible', true)
setProperty('bg6.visible', true)
setProperty('bg7.visible', true)
setProperty('bg8.visible', true)
setProperty('bg9.visible', true)
setProperty('bg10.visible', true)
beatn = 1
elseif curStep == 768 or curStep == 896 then
setProperty('camGame.alpha', 0)
beatn = 0
elseif curStep == 784 or curStep == 912 then
setProperty('camGame.alpha', 1)
elseif curStep == 1024 then
beatn = 1
elseif curStep == 1408 then
setProperty('camGame.alpha', 0)
elseif curStep == 1540 then
setProperty('camGame.alpha', 1)
beatn = 1
elseif curStep == 2048 then
doTweenAlpha('odn', 'camGame', 0, 5, 'quadInOut')
doTweenAlpha('odfn', 'camHUD', 0, 7, 'quadInOut')
beatn = 0
end
end

beatn = 0
function onBeatHit()
if curBeat %2 == 1 and beatn == 1 then
triggerEvent('Add Camera Zoom', 0, 0.1)
end
end