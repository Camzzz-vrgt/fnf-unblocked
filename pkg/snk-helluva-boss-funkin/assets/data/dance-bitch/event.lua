function onCreate()
addCharacterToList('blitzor', 'dad')
end

function onCreatePost()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
doTweenZoom('zoomeventvalue', 'camGame', 1, 0.01)
end

function onSongStart()
doTweenAlpha('1', 'camGame', 1, 10, 'sineInOut')
doTweenAlpha('2', 'camHUD', 1, 10, 'sineInOut')
doTweenZoom('zoomeventvalue', 'camGame', 0.5, 10, 'quadInOut')

makeAnimatedLuaSprite('intro', 'characters/Blitzo Intro', getProperty('dad.x'), getProperty('dad.y'))
addAnimationByPrefix('intro', 'Idle', 'Idle', 24, false)
addAnimationByPrefix('intro', 'play', 'Microphone', 24, false)
addLuaSprite('intro', false)
setProperty('dad.alpha', 0)
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

folowcam = true
camX = 2300
camY = 1200
function onUpdate()

if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)

end
end


function onStepHit()
if curStep == 120 then
playAnim('intro', 'play', true)
elseif curStep == 128 then
removeLuaSprite('intro', true)
setProperty('dad.alpha', 1)

elseif curStep == 507 then
triggerEvent('Change Character', 'dad', 'blitzor')
elseif curStep == 508 or curStep == 796 then--fuck curSteps, i hate this shit
runTimer('loosHB', 0.1)


elseif curStep == 1280 then
beatn = 1
elseif curStep == 1536 then
beatn = 0
elseif curStep == 1920 then
doTweenAlpha('2', 'camHUD', 0, 1.5, 'sineInOut')
beatn = 2

end
end

beatn = 0
function onBeatHit()
if luaSpriteExists ('intro') then
if curBeat %2 == 0 then
playAnim('intro', 'Idle', false)
end
end

if curBeat %4 == 2 and beatn == 1 then
triggerEvent('Add Camera Zoom', 0, 0.3)
end

if curBeat %2 == 0 and beatn == 2 then
triggerEvent('Add Camera Zoom', 0, 0.2)
end
end


function onTimerCompleted(t)
if t == 'loosHB' then
setProperty('health', getProperty('health') - 1)
end
end