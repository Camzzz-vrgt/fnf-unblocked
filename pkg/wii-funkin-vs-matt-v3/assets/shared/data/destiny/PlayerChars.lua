
local characterList = {}

local charToNoteTypeMap = {
    {'mattdestiny', 'Darnote'},
}

function onCreatePost()
    triggerEvent('createCharacter', 'mattdestiny', '')

    setObjectOrder('mattdestiny', getObjectOrder('dadGroup')+1)
    setProperty('mattdestiny.x', getProperty('boyfriend.x'))
    setProperty('mattdestiny.y', getProperty('boyfriend.y'))
    setProperty('mattdestiny.visible', false)
    --playAnim('mattdestiny', 'intro', true)
end

function onEvent(tag, val1, val2)
    if tag == 'createCharacter' then
        local character = val1
        createInstance(character, "objects.Character", {0, 0, character, true})
        addInstance(character, true)
        table.insert(characterList, character)
    end
end

function onStepHit()

    if curStep == 1456 then 
        setProperty('mattdestiny.visible', true)
        setProperty('mattdestiny.x', 530)
        setProperty('mattdestiny.y', -30)
        playAnim('mattdestiny', 'intro', true)
    elseif curStep == 1988 then 
        triggerEvent('Play Animation', 'crys', 'dad')
    elseif curStep == 2008 then 
        setProperty('mattdestiny.visible', true)
        setProperty('boyfriend.visible', false)
        playAnim('mattdestiny', 'end', true)
    elseif curStep == 2112 then 
        playAnim('mattdestiny', 'punch', true)
    end
end

function onGameOver()
    setPropertyFromClass('substates.GameOverSubstate', 'characterName', '');
end
function onGameOverStart()
    runTimer('restart', 1.5)
end

function onTimerCompleted(tag, l, left)
    if tag == 'restart' then 
        restartSong()
    end
end