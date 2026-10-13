function onCreate()
    makeAnimatedLuaSprite('a','characters/a',51,369)
    addAnimationByPrefix('a','idle','idle',24,true)
    addAnimationByPrefix('a','singDOWN','down',24,false)
    addLuaSprite('a',true)
    setObjectCamera('a','other')
    objectPlayAnimation('a','idle',true)

    makeAnimatedLuaSprite('f','characters/f',316,64)
    addAnimationByPrefix('f','idle','idle',24,true)
    addAnimationByPrefix('f','singUP','up',24,false)
    addLuaSprite('f',true)
    setObjectCamera('f','other')
    objectPlayAnimation('f','idle',true)

    makeAnimatedLuaSprite('i','characters/i',317,369)
    addAnimationByPrefix('i','idle','idle',24,true)
    addAnimationByPrefix('i','singRIGHT','right',24,false)
    addLuaSprite('i',true)
    setObjectCamera('i','other')
    objectPlayAnimation('i','idle',true)
end

function opponentNoteHit(id, direction, noteType, isSustain)
    if direction == 1 then
        objectPlayAnimation('a','singDOWN',true)
        runTimer('returnA', 0.4)
    elseif direction == 2 then
        objectPlayAnimation('f','singUP',true)
        runTimer('returnF', 0.4)
    elseif direction == 3 then
        objectPlayAnimation('i','singRIGHT',true)
        runTimer('returnI', 0.4)
    end
end

function onTimerCompleted(tag, loops)
    if tag == 'returnA' then
        objectPlayAnimation('a','idle',true)
    elseif tag == 'returnF' then
        objectPlayAnimation('f','idle',true)
    elseif tag == 'returnI' then
        objectPlayAnimation('i','idle',true)
    end
end

function onCreatePost()
    setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')+1)
    setObjectOrder('boyfriendGroup', getObjectOrder('a')+1)
    setObjectOrder('boyfriendGroup', getObjectOrder('f')+1)
    setObjectOrder('boyfriendGroup', getObjectOrder('i')+1)
end

function onStepHit()
    if curStep == 618 then
        setProperty('dadGroup.visible', false)
        setProperty('a.visible', false)
        setProperty('f.visible', false)
        setProperty('i.visible', false)
    end
end
