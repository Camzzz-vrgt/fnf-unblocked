function onCreatePost()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
initLuaShader("INV")
setSpriteShader("winners1", "INV")
setSpriteShader("winners2", "INV")

setShaderInt("winners1", "invert", 0)
setShaderInt("winners2", "invert", 0)


setObjectOrder('winners1', getObjectOrder('WBG') + 1);
setObjectOrder('winners2', getObjectOrder('WBG') + 2);
end

function onSongStart()
setProperty('camGame.alpha', 1)
setProperty('camHUD.alpha', 1)
end

target = 'dad'
angl = false
function onEvent(n,v1,v2)
if n == 'camera_target' then
target = v1

end


if n == 'WBG' then
if v1 == 'Bon' or v1 == 'Won' then
setProperty('winners1.color', getColorFromHex('000000'))
setProperty('winners2.color', getColorFromHex('000000'))
setShaderInt("winners1", "invert", 1)
setShaderInt("winners2", "invert", 1)
setProperty('frontrail.visible', false)
setProperty('hbFinaleRed.visible', false)
setProperty('hbFinaleBlue.visible', false)
setProperty('healthBarOV.visible', false)
elseif v1 == 'off' then
setProperty('winners1.color', getColorFromHex('ffffff'))
setProperty('winners2.color', getColorFromHex('ffffff'))
setShaderInt("winners1", "invert", 0)
setShaderInt("winners2", "invert", 0)
setProperty('frontrail.visible', true)
setProperty('hbFinaleRed.visible', true)
setProperty('hbFinaleBlue.visible', true)
setProperty('healthBarOV.visible', true)
setProperty('healthBar.visible', false);
setProperty('healthBar.alpha', 0);
setProperty('healthBarBG.visible', false);
setProperty('healthBarBG.alpha', 0);
end
end

if n == 'flashzoom' then
doTweenAngle('d8', 'camHUD', 0, 0.3, 'circOut')
doTweenAngle('d88', 'camGame', 0, 0.3, 'circOut')

if angl then
angl = false
setProperty('camHUD.angle', 20)
setProperty('camGame.angle', 20)
else
 angl = true
setProperty('camHUD.angle', -20)
setProperty('camGame.angle', -20)
end
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


function onUpdate()
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
local currentBeat2 = (songPos/200)*(curBpm/200)
setProperty('camFollowPos.x',getProperty('camFollowPos.x') + (math.sin(currentBeat2) * 1.5))
setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.cos(currentBeat2) * 1.5))

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
if curStep < 127 then
setProperty('camFollow.x', 500)
setProperty('camFollow.y', 430)
else
 setProperty('camFollow.x', 475)
setProperty('camFollow.y', 500)
end
end
end

beatn = false
function onStepHit()
if curStep == 128 or curStep == 256 or curStep == 463 or curStep == 495 or curStep == 703 or curStep == 768 or curStep == 975 or curStep == 1007 or curStep == 1215 or curStep == 1280 or curStep == 1412 or curStep == 1668 then
beatn = true
elseif curStep == 247 or curStep == 447 or curStep == 479 or curStep == 631 or curStep == 759 or curStep == 959 or curStep == 991 or curStep == 1151 or curStep == 1271 or curStep == 1407 or curStep == 1663 or curStep == 1783 then
beatn = false

elseif curStep == 1800 then
doTweenAlpha('nzjz', 'camHUD', 0, 0.5, 'sineInOut')

end
end


function onBeatHit()
if curBeat %1 == 0 and beatn then
triggerEvent('Add Camera Zoom', 0.15, 0.025)
doTweenZoom('nsud', 'camGame', getProperty('defaultCamZoom'), 0.3, 'sineInOut')
doTweenZoom('ns', 'camHUD', 1, 0.3, 'sineInOut')
end
end