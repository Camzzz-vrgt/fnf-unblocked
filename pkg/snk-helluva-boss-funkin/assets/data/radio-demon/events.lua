function onCreate()
addCharacterToList('alastorPh2', 'dad')
end

function onCreatePost()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
initLuaShader("glitch2")
doTweenZoom('odb', 'camGame', 0.4, 0.1)


makeLuaSprite('effect3','alastor/effect',0, 0)
scaleObject('effect3', 1.5, 1.5)
setScrollFactor('effect3', 0, 0)
screenCenter('effect3')
setBlendMode('effect3', 'add')
setProperty('effect3.alpha', 0)
addLuaSprite('effect3', true)


makeAnimatedLuaSprite('S2', 'screenstatic', -1600, -500)
scaleObject('S2', 5, 5)
addAnimationByPrefix('S2','S2','screenstatic',24,true)
addLuaSprite('S2',false)
setProperty('S2.alpha', 0)

updateHitbox('1s')
updateHitbox('2s')
updateHitbox('3s')
updateHitbox('4s')
updateHitbox('5s')

makeLuaSprite('1s', 'alastor/1', -400,0)
scaleObject('1s', 0.5, 0.5)
addLuaSprite('1s')

makeLuaSprite('2s', 'alastor/2', 100,0)
scaleObject('2s', 0.5, 0.5)
addLuaSprite('2s')

makeLuaSprite('3s', 'alastor/3', 100,300)
scaleObject('3s', 0.5, 0.5)
addLuaSprite('3s')

makeLuaSprite('4s', 'alastor/4', -400,300)
scaleObject('4s', 0.5, 0.5)
addLuaSprite('4s')

makeLuaSprite('5s', 'alastor/5', -150,-200)
scaleObject('5s', 0.5, 0.5)
addLuaSprite('5s')

setProperty('1s.visible', false)
setProperty('2s.visible', false)
setProperty('3s.visible', false)
setProperty('4s.visible', false)
setProperty('5s.visible', false)
end

function onSongStart()
doTweenAlpha('1', 'camGame', 1, 7, 'quadInOut')
doTweenZoom('2', 'camGame', 0.6, 10, 'quadInOut')
doTweenZoom('c2', 'camHUD', 0.6, 1, 'quadInOut')

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
camX = 700
camY = 400
function onUpdate()

if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end

beat = 0
function onStepHit()
if curStep == 60 then
setProperty('camGame.alpha', 0)

elseif curStep == 64 then
setProperty('camGame.alpha', 1)
beat = 1
elseif curStep == 124 then
doTweenAlpha('9sb', 'camGame', 0, 0.4)
elseif curStep == 128 then
doTweenAlpha('9sb', 'camGame', 1, 0.01)
setProperty('camHUD.alpha', 1)
elseif curStep == 240 then
beat = 0
elseif curStep == 256 then
beat = 1
elseif curStep == 380 then
doTweenAlpha('9sb', 'camGame', 0, 0.4)
elseif curStep == 384 then
setProperty('dad.alpha', 0)
setProperty('boyfriend.alpha', 0)
setProperty('dad.velocity.x', 30)
setObjectCamera('dad', 'hud')
setProperty('dad.x', 0)
setProperty('dad.y', 250)
beat = 0
elseif curStep == 388 then
doTweenAlpha('2', 'dad', 1, 2, 'quadInOut')
elseif curStep == 448 then
doTweenAlpha('2', 'dad', 0, 0.5, 'quadInOut')
setProperty('boyfriend.velocity.x', -30)
setObjectCamera('boyfriend', 'hud')
setProperty('boyfriend.x', 700)
setProperty('boyfriend.y', 150)

setProperty('dad.velocity.x', 0)
setObjectCamera('dad', 'game')
setProperty('dad.x', defaultOpponentX)
setProperty('dad.y', defaultOpponentY - 100)
elseif curStep == 452 then
doTweenAlpha('1', 'boyfriend', 1, 2, 'quadInOut')
elseif curStep == 508 then
doTweenAlpha('2', 'boyfriend', 0, 0.5, 'quadInOut')
elseif curStep == 512 then
setProperty('boyfriend.velocity.x', 0)
setObjectCamera('boyfriend', 'game')
setProperty('boyfriend.x', defaultBoyfriendX - 150)
setProperty('boyfriend.y', defaultBoyfriendY + 200)
doTweenAlpha('2', 'boyfriend', 1, 0.01)
setProperty('dad.alpha', 1)
setProperty('camGame.alpha', 1)

doTweenAlpha('r', 'S2', 1, 25)
doTweenAlpha('rr', 'vig', 1, 25)
doTweenAlpha('fr', 'effect', 0, 20)
doTweenAlpha('ffr', 'bg', 0, 25)
doTweenAlpha('fffr', 'bench', 0, 25)

doTweenAlpha('dr', 'bench2', 1, 25)
doTweenAlpha('rcr', 'bg2', 1, 25)
doTweenAlpha('ffr', 'effect2', 1, 20)

elseif curStep == 636 then
doTweenAlpha('9sb', 'camGame', 0, 0.4)
elseif curStep == 640 then
doTweenAlpha('9sb', 'camGame', 1, 0.01)


doTweenAlpha('fr', 'effect', 1, 0.01)
doTweenAlpha('r', 'S2', 0, 0.01)
doTweenAlpha('rr', 'vig', 0, 0.01)
doTweenAlpha('ffr', 'bg', 1, 0.01)
doTweenAlpha('fffr', 'bench', 1, 0.01)
doTweenAlpha('dr', 'bench2', 0, 0.01)
doTweenAlpha('rcr', 'bg2', 0, 0.01)
doTweenAlpha('ffr', 'effect2', 0, 0.01)
doTweenAlpha('fr', 'effect3', 1, 5)
setBlendMode('effect', 'add')
beat = 1
elseif curStep == 752 then
beat = 0
elseif curStep == 768 then
doTweenAlpha('fr', 'effect3', 0, 0.01)
setBlendMode('effect', 'normal')
beat = 2
removeLuaSprite('effect3',true)
elseif curStep == 896 then
beat = 3
elseif curStep == 1017 then
beat = 0
elseif curStep == 1020 then
doTweenAlpha('9sb', 'camGame', 0, 0.4)
elseif curStep == 1024 then
doTweenAlpha('9sb', 'camGame', 0.8, 15)
setProperty('boyfriend.visible', false)
setProperty('camHUD.visible', false)

setProperty('effect.visible', false)
setProperty('bg.visible', false)
setProperty('bench.visible', false)
setProperty('roses.visible', false)

elseif curStep == 1144 then
doTweenAlpha('o', 'camGame', 0, 1.2)
elseif curStep == 1152 then
doTweenAlpha('o', 'camGame', 1, 0.01)
setProperty('camHUD.visible', true)
setProperty('effect.visible', true)
setProperty('bg.visible', true)
setProperty('bench.visible', true)
setProperty('roses.visible', true)

setProperty('vig.alpha', 0.2)
setProperty('S2.alpha', 0.2)
setProperty('boyfriend.visible', true)
beat = 4
elseif curStep == 1280 then
setProperty('S2.alpha', 0.3)

removeLuaSprite('effect',true)
removeLuaSprite('bg',true)
removeLuaSprite('bench',true)
removeLuaSprite('roses',true)

setProperty('bg2.alpha', 1)
setProperty('bench2.alpha', 1)
setProperty('roses2.alpha', 1)
setProperty('effect2.alpha', 1)

setSpriteShader("S2", "file")
setSpriteShader("S", "file")
setSpriteShader("dad", "glitch2")
setProperty('dad.useFramePixels', true)
beat = 5
doTweenAlpha('di', 'S', 0.2, 5)
runTimer('m', 1, 0)
setProperty('1s.visible', true)
setProperty('2s.visible', true)
setProperty('3s.visible', true)
setProperty('4s.visible', true)
setProperty('5s.visible', true)
elseif curStep == 1404 then
setProperty('S.visible', false)
cancelTween('di')
cancelTween('di2')
setProperty('camGame.visible', false)
setProperty('iconP1.visible', false)
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('hBar.visible', false)
setProperty('iconP2.visible', false)
setProperty('timeTxt.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('scoreTxt.visible', false)
elseif curStep == 1408 then
setProperty('boyfriend.velocity.y', -30)
setObjectCamera('boyfriend', 'hud')
setProperty('boyfriend.x', 300)
setProperty('boyfriend.y', 300)
elseif curStep == 1472 then
setProperty('S.alpha', 0)
setProperty('boyfriend.velocity.y', 0)
setObjectCamera('boyfriend', 'game')
setProperty('boyfriend.y', defaultBoyfriendY + 200)
setProperty('boyfriend.x', defaultBoyfriendX - 150)

setProperty('dad.velocity.y', -30)
setObjectCamera('dad', 'hud')
setProperty('dad.x', 350)
setProperty('dad.y', 300)
elseif curStep == 1536 then
setProperty('dad.velocity.y', 0)
setObjectCamera('dad', 'game')
setProperty('dad.x', defaultOpponentX - 100)
setProperty('dad.y', defaultOpponentY - 100)
doTweenAlpha('di', 'S', 0.3, 5, 'sineInOut')
setProperty('S.visible', true)
setProperty('camGame.visible', true)
setProperty('iconP1.visible', true)
setProperty('healthBar.visible', true)
setProperty('healthBarBG.visible', true)
setProperty('hBar.visible', true)
setProperty('iconP2.visible', true)
setProperty('timeTxt.visible', true)
setProperty('timeBar.visible', true)
setProperty('timeBarBG.visible', true)
setProperty('scoreTxt.visible', true)
beat = 6
elseif curStep == 1615 then
beat = 5
elseif curStep == 1631 then
beat = 7
elseif curStep == 1663 or curStep == 1594 then
beat = 0
elseif curStep == 1599 then
beat = 6
elseif curStep == 1664 then
setProperty('camGame.visible', false)
setProperty('iconP1.visible', false)
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('hBar.visible', false)
setProperty('iconP2.visible', false)
setProperty('timeTxt.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('scoreTxt.visible', false)
setProperty('S.visible', false)
elseif curStep == 1680 then
doTweenAlpha('oeb', 'camHUD', 0, 3)
end
end

function onUpdatePost()
if curStep > 1280 then
setShaderFloat('S', 'iTime', os.clock())
setShaderFloat('S2', 'iTime', os.clock())
setShaderFloat('dad', 'iTime', os.clock())
end
end

function onBeatHit()
if curBeat %2 == 1 and beat == 1 then
triggerEvent('Add Camera Zoom', 0, 0.1)
elseif curBeat %1 == 0 and beat == 2 then
triggerEvent('Add Camera Zoom', 0, 0.05)
end
if beat == 3 then
if curBeat %2 == 0 then
triggerEvent('Add Camera Zoom', 0, 0.05)
else
 triggerEvent('Add Camera Zoom', 0, 0.1)
end
elseif beat == 4 then
if curBeat %1 == 0 then
triggerEvent('Add Camera Zoom', 0, 0.07)
end

elseif beat == 5 then
if curBeat %1 == 0 then
triggerEvent('Add Camera Zoom', 0, 0.12)
end

elseif beat == 6 then
if curBeat %1 == 0 then
triggerEvent('Add Camera Zoom', 0, 0.12)
triggerEvent('glitchy', 0.5, 0.5)
runTimer('nog', 0.05)
end

elseif beat == 7 then
if curBeat %1 == 0 then
triggerEvent('Add Camera Zoom', 0, 0.12)
triggerEvent('glitchy', 0.3, 0.5)
runTimer('nog', 0.05)
end

end
end


function onTweenComplicated(t)
if t == 'di' then
doTweenAlpha('di2', 'S', 0, 5, 'sineInOut')
elseif t == 'di2' then
doTweenAlpha('di', 'S', 0.2, 5, 'sineInOut')

end
end

function onTimerCompleted(t)
if t == 'nog' then
triggerEvent('glitchy', 0, 0)
elseif t == 'm' then
doTweenX('m', '1s', -300 + getRandomInt(-10, 10), 1)
doTweenX('dj2', '2s', 100 + getRandomInt(-10, 10), 1)
doTweenX('dj3', '3s', 100 + getRandomInt(-10, 10), 1)
doTweenX('dj4', '4s', -300 + getRandomInt(-10, 10), 1)
doTweenX('dj5', '5s', -100 + getRandomInt(-10, 10), 1)

doTweenY('sx', '1s', 0 + getRandomInt(-10, 10), 1)
doTweenY('sx2', '2s', 0 + getRandomInt(-10, 10), 1)
doTweenY('sx3', '3s', 300 + getRandomInt(-10, 10), 1)
doTweenY('sx4', '4s', 300 + getRandomInt(-10, 10), 1)
doTweenY('sx5', '5s', -150 + getRandomInt(-10, 10), 1)

end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
if curStep > 1281 then
if getProperty('health') > 0.2 then
setProperty('health', getProperty('health') - 0.02)
end
end
end