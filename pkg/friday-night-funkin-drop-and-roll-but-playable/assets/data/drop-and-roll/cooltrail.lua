-- by latter

speed = 0.01--who fast do you want the effect to apply

timething = 0.5--timer for when the effect fully done

sizething = 0--how much do you want the effect to grow

above = false-- you can ether make it above the character or behind the character(true for above)

blend = 'SUBTRACT'--do you want to enable blend mode? (ADD,SUBTRACT,MULTIPLY,DIFFERENCE,NORMAL)

transparency = 1--i think that's pretty obvious



colortimer = 0.000000001

easeY = 'BackIn'--Y
easeX = 'BackIn'--X
easeSY = 'BackIn'--Scale Y
easeSX = 'BackIn'--Scale X
easeA = 'linear'--Alpha

distance = 3000

cooltrail = true

play_trail = false

char = 'bfdad'
function onEvent(n,v1,v2)
if n == 'cooltrail' then
if tonumber(v1) and play_trail then
cooltrail = true
play_trail = false
elseif tonumber(v1) and not play_trail then
cooltrail = false
play_trail = true
end

if v2 == 'bf' then
char = 'bf'
elseif v2 == 'dad' then
char = 'dad'
elseif v2 == 'bfdad' then
char = 'bfdad'
end
end
end



function onCreate()
runTimer('coale', speed, 0)

end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

i = 1
colorHex = {'80FF00'--[[green]]       ,                 'FF8000'--[[Orange]]                     , 'FF0600'--[[red]]                        , '007FFF'--[[blue]]                       , '9200FF'--[[purple]]                     , 'FD00FF'--[[pink]]                       , 'FFE600'--[[yellow]]                     , '00F3FF'--[[cyan]]                       , 'FF0061'--[[red?]]                       , '00FF5E'--[[green?]]}
function onUpdate()
colododo = math.random(1,#colorHex)
end

function onTimerCompleted(tag)
if tag == 'coale' then
if cooltrail then
i = i + 1
if i >= 100 then
i = 0
end


tagn = ('jojo_reference'..i)
tagn2 = ('jojo_reference2'..i)

if char == 'dad' or char == 'bfdad' then

makeAnimatedLuaSprite(tagn, getProperty('dad.imageFile'), getProperty('dad.x'), getProperty('dad.y'))
doTweenAlpha('jojAOpp'..tagn, tagn, 0, timething, easeA)

doTweenX(tagn..'jojXOpp', tagn..'.scale', getProperty('dad.scale.x') + sizething, timething, easeSX)

doTweenY(tagn..'jojYOpp', tagn..'.scale', getProperty('dad.scale.y') + sizething, timething, easeSY)

updateHitbox(tagn)
setProperty(tagn..'.offset.x', getProperty('dad.offset.x'))
setProperty(tagn..'.offset.y', getProperty('dad.offset.y'))
setProperty(tagn..'.animation.frameName', getProperty('dad.animation.frameName'))
setProperty(tagn..'.flipX', getProperty('dad.flipX'))
setProperty(tagn..'.scale.x', getProperty('dad.scale.x'))
setProperty(tagn..'.scale.y', getProperty('dad.scale.y'))

setProperty(tagn..'.alpha', transparency)
setBlendMode(tagn, blend)
end


if char == 'bf' or char == 'bfdad' then

makeAnimatedLuaSprite(tagn2, getProperty('boyfriend.imageFile'), getProperty('boyfriend.x'), getProperty('boyfriend.y'))
doTweenAlpha('jojAbf'..tagn2, tagn2, 0, timething, easeA)

doTweenX(tagn2..'jojXbf', tagn2..'.scale', getProperty('boyfriend.scale.x') + sizething, timething, easeSX)

doTweenY(tagn2..'jojYbf', tagn2..'.scale', getProperty('boyfriend.scale.y') + sizething, timething, easeSY)

updateHitbox(tagn2)
setProperty(tagn2..'.offset.x', getProperty('boyfriend.offset.x'))
setProperty(tagn2..'.offset.y', getProperty('boyfriend.offset.y'))
setProperty(tagn2..'.animation.frameName', getProperty('boyfriend.animation.frameName'))
setProperty(tagn2..'.flipX', getProperty('boyfriend.flipX'))
setProperty(tagn2..'.scale.x', getProperty('boyfriend.scale.x'))
setProperty(tagn2..'.scale.y', getProperty('boyfriend.scale.y'))

setProperty(tagn2..'.alpha', transparency)
setBlendMode(tagn2, 'add')
end



doTweenY(tagn..'jo', tagn..'.velocity',  getRandomInt(-distance, distance),timething,easeY)
doTweenX(tagn..'jo2', tagn..'.velocity',  getRandomInt(-distance, distance),timething,easeX)

doTweenY(tagn2..'jo3', tagn2..'.velocity',  getRandomInt(-distance, distance),timething,easeY)
doTweenX(tagn2..'jo4', tagn2..'.velocity',  getRandomInt(-distance, distance),timething,easeX)

function opponentNoteHit(id, direction, noteType, isSustainNote)
if char == 'dad' or char == 'bfdad' then
addLuaSprite(tagn, above)
end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
if char == 'bf' or char == 'bfdad' then
addLuaSprite(tagn2, above)

end
end



doTweenColor(tagn..'jojcolor', tagn, colorHex[colododo], colortimer, 'linear')
doTweenColor(tagn2..'jojcolor2', tagn2, colorHex[colododo], colortimer, 'linear')
end
end
end