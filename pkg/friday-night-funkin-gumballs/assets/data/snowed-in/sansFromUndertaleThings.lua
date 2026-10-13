local comic = 0
function opponentNoteHit(id, direction, noteType, isSustainNote)
addComic(direction)
end

function addComic(note)
comic = comic + 1
local comicName = 'note_'..comic

makeLuaSprite(comicName, 'stages/snowdin/comicsans/'..note, getProperty('dad.x') + 200, getProperty('dad.y') + 30)
addLuaSprite(comicName, true)
setProperty(comicName .. '.velocity.y', -500)
setProperty(comicName .. '.acceleration.y', 1000)
setProperty(comicName .. '.velocity.x', getRandomFloat(0, 300))
doTweenAlpha('fade_' .. comicName, comicName, 0, 1, 'linear')
runTimer('remove_'..comicName, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if string.sub(tag, 1, 7) == 'remove_' then
        local name = string.sub(tag, 8)
        removeLuaSprite(name, true)
    end
end

function onBeatHit()
if curBeat == 28 or curBeat == 32 then
setProperty('camGame.visible', not getProperty('camGame.visible'))
 end
end