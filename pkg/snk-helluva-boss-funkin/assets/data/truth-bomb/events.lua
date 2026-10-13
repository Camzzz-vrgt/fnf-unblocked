function onCreate()
addCharacterToList('Moxxie-bad-happy', 'dad')
addCharacterToList('moxxie-bad-happy-hiros', 'dad')
addCharacterToList('moxxie-bad-happy-sg', 'dad')
addCharacterToList('moxxie-bad-happy-g', 'dad')
end
function onCreatePost()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
end

function onSongStart()
setProperty('camGame.alpha', 1)
setProperty('camHUD.alpha', 1)
end

target = 'dad'
function onEvent(n,v1,v2)
if n == 'camera_target' then
target = v1

end
end

function onMoveCamera(focus)
if getProperty('defaultCamZoom') >= 1 then
if focus == 'boyfriend' and not mustHitSection then
target = 'bf'
elseif focus == 'dad' and mustHitSection then
target = 'dad'
end
end
end

val = 1.5
function onUpdate()
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
local currentBeat2 = (songPos/200)*(curBpm/200)
setProperty('camFollowPos.x',getProperty('camFollowPos.x') + (math.sin(currentBeat2) * val))
setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.cos(currentBeat2) * val))

if getProperty('defaultCamZoom') >= 1 then

setProperty('camFollow.y', 600)
doTweenAlpha('du','3', 0.3, 0.5)
doTweenAlpha('dvu','4', 0.3, 0.5)
doTweenAlpha('ddku','5', 0.3, 0.5)
doTweenAlpha('dvosu','6', 0.3, 0.5)
if target == 'bf' then
setProperty('camFollow.x', 950)
elseif target == 'dad' then
setProperty('camFollow.x', 60)
end

else
 doTweenAlpha('du','3', 1, 0.5)
doTweenAlpha('dvu','4', 1, 0.5)
doTweenAlpha('ddku','5', 1, 0.5)
doTweenAlpha('dvosu','6', 1, 0.5)
end
if target == 'all' then
setProperty('camFollow.x', 475)
setProperty('camFollow.y', 500)
end

end

beatn = 0
function onStepHit()
if curStep == 128 then
beatn = 1

elseif curStep == 384 then
beatn = 2
elseif curStep == 640 then
beatn = 3
elseif curStep == 896 or curStep == 1024 then
beatn = 4
elseif curStep == 1006 or curStep == 1134 or curStep == 1438 then
beatn = 0
elseif curStep == 1144 then
doTweenAlpha('27', 'camHUD', 0,0.5,'sineInOut')

elseif curStep == 1184 then
setProperty('camHUD.alpha', 1)
beatn = 2
elseif curStep == 1448 then
doTweenAlpha('27', 'camHUD', 0,2,'sineInOut')
end
end

function onBeatHit()
if curBeat %4 == 0 and beatn == 1 then
triggerEvent('Add Camera Zoom', 0, 0.05)
end

if curBeat %2 == 1 and beatn == 2 then
triggerEvent('Add Camera Zoom', 0, 0.01)
end

if curBeat %4 == 2 and beatn == 3 then
triggerEvent('Add Camera Zoom', 0, 0.05)
end

if curBeat %2 == 0 and beatn == 4 then
triggerEvent('Add Camera Zoom', 0, 0.01)
end
end