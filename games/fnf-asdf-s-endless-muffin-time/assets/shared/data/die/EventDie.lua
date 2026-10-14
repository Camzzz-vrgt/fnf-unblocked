local bfSex = 0.5
local opSex = 0.65
local zoomSect = false
local ColorFuck = 'FFFFFF'
local camera = 'camOther'
local lerp = 2.8
local flyTom = false
local changeNote = false
local badEnding = false
local GoodEnding = false

function onMoveCamera(focus)
if zoomSect then
	if focus == 'boyfriend' then
    setProperty('defaultCamZoom', bfSex)
    elseif focus == 'dad' then
    setProperty('defaultCamZoom', opSex)
    end
	end 
end

function onSongStart()
local videoPath = callMethodFromClass('backend.Paths', 'video', {'intro'})
createInstance('intro', 'backend.VideoSpriteManager', {0, 0}) --xy
addInstance('intro', false)
callMethod('intro.startVideo', {videoPath})
setObjectCamera('intro','camOther')
end

function onCreatePost()
addCharacterToList("goodMuffin", "bf")

setProperty('camGame.visible', false)
setProperty('camHUD.visible', false)

makeLuaSprite("color", nil, 0, 0)
makeGraphic("color", 1280, 720, ColorFuck)
setObjectCamera("color", camera)
addLuaSprite("color", true)
setProperty('color.alpha', 0)
setScrollFactor('color', 0, 0)
setProperty('color.scale.x', 5)
setProperty('color.scale.y', 5)
setObjectOrder('color', getObjectOrder('color') + 150);

makeLuaSprite('blackScreen', nil, -650, -650);
makeGraphic('blackScreen', screenWidth * 3.5, screenHeight * 3.5, '000000');
scaleObject('blackScreen', 1, 1);
addLuaSprite('blackScreen', true)
setScrollFactor('blackScreen',0,0)
setProperty('blackScreen.alpha', 0)
setObjectOrder('blackScreen', getObjectOrder('blackScreen') + 10);

makeLuaSprite('bad', 'badEndingPic', 0, 0)
setObjectCamera('bad', 'hud')
screenCenter('bad')
addLuaSprite('bad')
setProperty('bad.alpha', 0)
scaleObject('bad', 0.62, 0.62, false)
setObjectOrder('bad', 0)

makeLuaSprite('good', 'goodEndingPic', 0, 0)
setObjectCamera('good', 'hud')
screenCenter('good')
addLuaSprite('good')
setProperty('good.alpha', 0)
scaleObject('good', 0.65, 0.65, false)
setObjectOrder('good', 0)
end

function onUpdate(elapsed)
setProperty('camGame.followLerp', lerp) --nose si esto funciona

if flyTom then
doTweenY('tomTween', 'head', -400-20*math.sin((currentBeat*0.25)*math.pi),0.001)
end
end

function endMuffin()
if GoodEnding then
setProperty('good.alpha', 1)
end
if badEnding then
setProperty('bad.alpha', 1)
end
end

function EndingVid() --Puede que esto salga mal
if getProperty('ratingPercent') > 0.1 then
local videoPath = callMethodFromClass('backend.Paths', 'video', {'bad'})
createInstance('badVid', 'backend.VideoSpriteManager', {0, 0})--xy
addInstance('badVid', false)
callMethod('badVid.startVideo', {videoPath})
setObjectCamera('badVid','camHUD')
setProperty('goodVid.visible', false)

badEnding = true
GoodEnding = false
end
if getProperty('ratingPercent') > 0.9 then
local videoPath = callMethodFromClass('backend.Paths', 'video', {'good'})
createInstance('goodVid', 'backend.VideoSpriteManager', {0, 0})--xy
addInstance('goodVid', false)
callMethod('goodVid.startVideo', {videoPath})
setObjectCamera('goodVid','camHUD')
setProperty('badVid.visible', false)

badEnding = false
GoodEnding = true
end
end

function onStepHit()
if curStep == 1384 then
EndingVid()
end
if curStep == 1591 then
noteTweenAlpha("NoteFade11", 4, 1, 0.5, quadOut)
noteTweenAlpha("NoteFade22", 5, 1, 0.5, quadOut)
noteTweenAlpha("NoteFade33", 6, 1, 0.5, quadOut)
noteTweenAlpha("NoteFade44", 7, 1, 0.5, quadOut)
end
if curStep == 2305 then
setProperty('blackScreen.alpha', 1)
cameraFlash('hud','FF0000', 0.5)
endMuffin()
end
end

function onBeatHit()
if curBeat == 40 then
setProperty('camGame.visible', true)
setProperty('camHUD.visible', true)
setProperty('intro.visible', false)
setProperty('defaultCamZoom', 0.8)
cameraFlash('hud', 'FFFFFF', 1)
end
if curBeat == 130 then
lerp = 0
end
if curBeat == 131 then
doTweenX('camera', 'camGame.scroll', -850, 2.4, 'expoInOut')
doTweenZoom('zoom', 'camGame', 0.9, 2.4, 'expoInOut')
setProperty('defaultCamZoom', 0.9)
end
if curBeat == 136 then
cancelTween('camera')
cancelTween('zoom')
startTween('camera2','camGame.scroll',{x = -480,y = -330},0.00001 ,{ease = 'linear'})
setProperty('camGame.zoom', 1)
setProperty('defaultCamZoom', 1)
setProperty('head.visible', true)
doTweenY('tomHeadApear', 'head', -400, 2, 'cubeOut')
setProperty('asdf_bg.visible', true)
cameraFlash('hud', '000000', 0.5)
end
if curBeat == 142 then
lerp = 2.8
end
if curBeat == 196 then
lerp = 0
startTween('camera3','camGame.scroll',{x = -100,y = -140},2.65 ,{ease = 'expoInOut'})
doTweenZoom('zoom2', 'camGame', 1.5, 2.5, 'expoInOut')
end
if curBeat == 200 then
cancelTween('camera3')
cancelTween('zoom2')
cameraFlash('hud', 'FF0000', 0.6)
setProperty('head.visible', false)

changeNote = true
bfSex = 0.55
opSex = 0.4
zoomSect = true
setProperty('asdf_bg.visible', false)
setProperty('sky.visible', true)
setProperty('train.visible', true)
setProperty('wagon.visible', true)
setProperty('debris1.visible', true)
setProperty('gradient.visible', true)
setProperty('backk.visible', true)
setProperty('ground.visible', true)
setProperty('eyes.visible', true)
setProperty('tomHeadEvil.visible', true)
setProperty('rocks.visible', true)
lerp = 2.8

for i = 0,7 do
          setPropertyFromGroup('strumLineNotes', i, 'texture', 'NOTE_assets_Aethos')
     end
  end
if curBeat == 312 then
doTweenZoom('zoom3', 'camGame', 0.8, 6, 'cubeIn')
end
if curBeat == 328 then
setProperty('camGame.alpha', 0.00001)

local adsf = {
    'score',
    'clock',
    'arm'
}

for i, adsf in ipairs(adsf) do
setProperty(adsf .. '.alpha', 0)
end
setPropertyFromGroup('opponentStrums', 0, 'alpha', 0)
setPropertyFromGroup('opponentStrums', 1, 'alpha', 0)
setPropertyFromGroup('opponentStrums', 2, 'alpha', 0)
setPropertyFromGroup('opponentStrums', 3, 'alpha', 0)

setPropertyFromGroup('playerStrums', 0, 'alpha', 0)
setPropertyFromGroup('playerStrums', 1, 'alpha', 0)
setPropertyFromGroup('playerStrums', 2, 'alpha', 0)
setPropertyFromGroup('playerStrums', 3, 'alpha', 0)
end
if curBeat == 432 then
setProperty('badVid.alpha', 0)
setProperty('goodVid.alpha', 0)

setProperty('camGame.alpha', 1)
setProperty('camHUD.alpha', 1)
bfSex = 1.2
opSex = 1.2
cameraFlash('hud', 'FF0000', 1)
setProperty('camZooming', true)
muffinEnding()
callMethod('camGame.snapToTarget', {''})

local adsf = {
    'score',
    'clock',
    'arm'
}

for i, adsf in ipairs(adsf) do
setProperty(adsf .. '.alpha', 1)
end
setPropertyFromGroup('opponentStrums', 0, 'alpha', 1)
setPropertyFromGroup('opponentStrums', 1, 'alpha', 1)
setPropertyFromGroup('opponentStrums', 2, 'alpha', 1)
setPropertyFromGroup('opponentStrums', 3, 'alpha', 1)

setPropertyFromGroup('playerStrums', 0, 'alpha', 1)
setPropertyFromGroup('playerStrums', 1, 'alpha', 1)
setPropertyFromGroup('playerStrums', 2, 'alpha', 1)
setPropertyFromGroup('playerStrums', 3, 'alpha', 1)
end
if curBeat == 464 then
lerp = 0
setProperty('camZooming', false)
startTween('camera6','camGame.scroll',{x = 950,y = 450},12 ,{ease = 'expoInOut'})
doTweenZoom('zoom5', 'camGame', 0.5, 12, 'expoInOut')
end
if curBeat == 496 then
cancelTween('zoom4')
doTweenZoom('zoom5', 'camGame', 0.56, 2.5, 'expoInOut')
end
if curBeat == 504 then
setProperty('camHUD.visible', false)
end
if curBeat == 505 then
setProperty('blackScreen.alpha', 1)
end
if curBeat == 508 then
lerp = 2.4
doTweenAlpha('colorAlp', 'color', 1, 1.4)
setProperty('camZooming', true)
end
if curBeat == 512 then
setProperty('blackScreen.alpha', 0)
setProperty('camHUD.visible', true)
cancelTween('colorAlp')
setProperty('color.alpha', 0)
cameraFlash('hud','FF0000', 1)
bfSex = 0.55
opSex = 0.4
end
if curBeat == 655 then
doTweenAlpha('ob', 'clock', 0, 3)
doTweenAlpha('ob1', 'arm', 0, 3)
doTweenAlpha('ob2', 'score', 0, 3)

noteTweenAlpha("NoteFade1", 4, 0, 3)
noteTweenAlpha("NoteFade2", 5, 0, 3)
noteTweenAlpha("NoteFade3", 6, 0, 3)
noteTweenAlpha("NoteFade4", 7, 0, 3)

noteTweenAlpha("NoteFadeOp000", 0, 0, 3)
noteTweenAlpha("NoteFadeOp111", 1, 0, 3)
noteTweenAlpha("NoteFadeOp222", 2, 0, 3)
noteTweenAlpha("NoteFadeOp333", 3, 0, 3)
end
if curBeat == 672 then
doTweenAlpha('thxforplayEnd', 'good', 0, 10)
doTweenAlpha('thxforplayEnd1', 'bad', 0, 10)
end
end

function muffinEnding()
if GoodEnding then
triggerEvent("Change Character", "bf", "goodMuffin")
end
end

function onTweenCompleted(tag)
    if tag == ('tomHeadApear') then
   flyTom = true
   end
end

function onSpawnNote(i, d, t)
  if changeNote then
       setPropertyFromGroup('notes', i, 'texture', 'NOTE_assets_Aethos')
       setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
     end
  end