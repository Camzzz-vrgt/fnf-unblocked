function onMoveCamera(focus)
	if focus == 'boyfriend' then
     playAnim("head", "right", true)
     doTweenX('tomMuffin', 'eyes', 1440, 1, 'sineInOut')
    elseif focus == 'dad' then
    playAnim("head", "left", true)
    doTweenX('tomAsdf', 'eyes', 1390, 1, 'sineInOut')
    end
	end

function onCreate()
setProperty('skipCountdown', true)
end

function onCreatePost()
setProperty('comboGroup.visible', false)

makeLuaSprite("whiteBG", nil, 0, 0)
makeGraphic("whiteBG", 1280, 720, "0xFFFFFFFF")
addLuaSprite("whiteBG", false)
setScrollFactor('whiteBG', 0, 0)
setProperty('whiteBG.scale.x', 5)
setProperty('whiteBG.scale.y', 5)

--PHASHE2

makeLuaSprite('asdf_bg', 'stages/corleyIsAFart/asdf_bg', -700, -400)
addLuaSprite('asdf_bg', false)
scaleObject('asdf_bg', 1.6, 1.3)
setProperty('asdf_bg.flipY', true)
setProperty('asdf_bg.visible', false)

makeAnimatedLuaSprite('head', 'stages/corleyIsAFart/Tom', 150, -1100)
addAnimationByPrefix('head', 'left', 'tomskalookatasdf', 6, true)
addAnimationByPrefix('head', 'right', 'tomskalookatmuffin', 6, true)
addLuaSprite('head', false)
scaleObject('head', 1.3, 1.3)
setProperty('head.visible', false)

--PHASE3

makeLuaSprite('sky', 'stages/corleyIsAFart/evil/sky', -1902, -1120)
addLuaSprite('sky', false)
scaleObject('sky', 3, 3)
setScrollFactor('sky', 0, 0)
setProperty('sky.visible', false)

makeLuaSprite('train', 'stages/corleyIsAFart/evil/train', -1400, -1019)
addLuaSprite('train', false)
scaleObject('train', 2.2, 2.2)
setScrollFactor('train', 0.3, 0.3)
setProperty('train.visible', false)

makeLuaSprite('wagon', 'stages/corleyIsAFart/evil/wagon', -1153, -1216)
addLuaSprite('wagon', false)
scaleObject('wagon', 2.2, 2.2)
setScrollFactor('wagon', 0.3, 0.3)
setProperty('wagon.visible', false)

makeLuaSprite('debris1', 'stages/corleyIsAFart/evil/debris1', -1500, -850)
addLuaSprite('debris1', false)
scaleObject('debris1', 2.2, 2.2)
setScrollFactor('debris1', 0.3, 0.3)
setProperty('debris1.visible', false)

makeLuaSprite('gradient', 'stages/corleyIsAFart/evil/gradient', -1000, -960)
addLuaSprite('gradient', false)
scaleObject('gradient', 2.2, 2.2)
setScrollFactor('gradient', 0.4, 0.4)
setProperty('gradient.visible', false)

makeLuaSprite('backk', 'stages/corleyIsAFart/evil/backk', -828, -497)
addLuaSprite('backk', false)
scaleObject('backk', 2, 2)
setScrollFactor('backk', 0.7, 0.7)
setProperty('backk.visible', false)

makeLuaSprite('ground', 'stages/corleyIsAFart/evil/ground', -1502, -1011)
addLuaSprite('ground', false)
scaleObject('ground', 2.8, 2.8)
setProperty('ground.visible', false)

makeLuaSprite('eyes', 'stages/corleyIsAFart/tomeyes', 1420, -900)
addLuaSprite('eyes', false)
scaleObject('eyes', 1.6, 1.6)
setProperty('eyes.angle', 6) --NUNCA LO CAMBIES A 0
setProperty('eyes.visible', false)

makeAnimatedLuaSprite('tomHeadEvil', 'stages/corleyIsAFart/tomska', 400, -300)
addAnimationByPrefix('tomHeadEvil', 'idle', 'tomska idle', 6, true)
addLuaSprite('tomHeadEvil', false)
setProperty('tomHeadEvil.visible', false)

makeLuaSprite('rocks', 'stages/corleyIsAFart/evil/rocksfg', -2600, -1800)
addLuaSprite('rocks', true)
scaleObject('rocks', 4.4, 4.4)
setScrollFactor('rocks', 1.4, 1.4)
setProperty('rocks.visible', false)
end

function onUpdate()
songPos = getSongPosition()
local currentBeat = (songPos/1000)*(bpm/60)
doTweenY('trainTween', 'train', -1019-30*math.sin((currentBeat*0.25)*math.pi),0.001)
doTweenY('wagonTween', 'wagon', -1216-40*math.sin((currentBeat*0.25)*math.pi),0.001)
doTweenY('drebisTween', 'debris1', -850-20*math.sin((currentBeat*0.45)*math.pi),0.001)

setProperty('eyes.y', getProperty('tomHeadEvil.y') + 370)

local angleOfs = math.random(-2, 2)
setProperty('head.angle', angleOfs)
local angleOfs2 = math.random(-1, 1)
setProperty('tomHeadEvil.angle', angleOfs2)

doTweenY('tomTweenEvil', 'tomHeadEvil', -300-20*math.sin((currentBeat*0.25)*math.pi),0.001)
end


