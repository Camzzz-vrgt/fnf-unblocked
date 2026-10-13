1.6 = 1.6
function onCreate()
makeLuaSprite('bg1', 'weekblitz/nightsky',0,0)
scaleObject('bg1', 1.6, 1.6)
addLuaSprite('bg1', false)

makeLuaSprite('bg2', 'weekblitz/cityslick',0,0)
scaleObject('bg2', 1.6, 1.6)
addLuaSprite('bg2', false)

makeLuaSprite('bg3', 'weekblitz/roadtodeath',0,0)
scaleObject('bg3', 1.6, 1.6)
addLuaSprite('bg3', false)

makeLuaSprite('bg4', 'weekblitz/ground',0,0)
scaleObject('bg4', 1.6, 1.6)
addLuaSprite('bg4', false)

makeLuaSprite('bg5', 'weekblitz/brickedup',0,0)
scaleObject('bg5', 1.6, 1.6)
addLuaSprite('bg5', false)

makeLuaSprite('bg6', 'weekblitz/insectguy',0,200)
scaleObject('bg6', 1.6, 1.6)
addLuaSprite('bg6', false)

makeLuaSprite('bg7', 'weekblitz/wall-e',0,0)
scaleObject('bg7', 1.6, 1.6)
addLuaSprite('bg7', true)

makeAnimatedLuaSprite('bg8', 'weekblitz/helluva_char', 855,1510)
addAnimationByPrefix('bg8', 'idle', 'public front', 24, false)
scaleObject('bg8', 1.6, 1.6)
addLuaSprite('bg8', true)

makeAnimatedLuaSprite('bg9', 'weekblitz/helluva_char2', 910,935)
addAnimationByPrefix('bg9', 'idle', 'back public', 24, false)
scaleObject('bg9', 1.6 + 0.4, 1.6 + 0.4)
addLuaSprite('bg9', false)

makeAnimatedLuaSprite('bg10', 'weekblitz/Boombox', 1755,695)
addAnimationByPrefix('bg10', 'idle', 'GF Dancing Beat', 24, false)
scaleObject('bg10', 1.6, 1.6)
addLuaSprite('bg10', false)

end

function onCreatePost()

setObjectOrder('dadGroup',getObjectOrder('boyfriendGroup'))

end

function onBeatHit()
if curBeat %2 == 0 then
playAnim('bg8', 'idle', true)
playAnim('bg9', 'idle', true)
playAnim('bg10', 'idle', true)
end
end


--[[
chr = 'bg10'
x = 910
y = 935
function onUpdate()
if keyPressed ('left') then
x = x - 5
debugPrint('X',x)
elseif keyPressed ('down') then
y = y + 5
debugPrint('Y',y)
elseif keyPressed ('up') then
y = y - 5
debugPrint('Y',y)
elseif keyPressed ('right') then
x = x + 5
debugPrint('X',x)
end

setProperty(chr..'.x', x)
setProperty(chr..'.y', y)
end]]

