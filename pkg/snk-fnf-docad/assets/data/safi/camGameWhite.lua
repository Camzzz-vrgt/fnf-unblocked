local oppNotes = false
local middle   = false

local noteYOffset = 15
local noteScale   = 0.4
local playerXOffsets = {-225, -175, -125, -75}

function onCreate()
    setProperty('camGame.bgColor', getColorFromHex('F3F3F3'))
    setObjectCamera('boyfriendGroup', 'other')
    setObjectCamera('dadGroup', 'other')
    setProperty('isCameraOnForcedPos', true)
    setPropertyFromClass('PlayState.SONG', 'disableNoteRGB', true)
end

function onCreatePost()
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)

    for i = 0, 7 do
        local x = getPropertyFromGroup('strumLineNotes', i, 'x')
        local y = getPropertyFromGroup('strumLineNotes', i, 'y')
        setPropertyFromGroup('strumLineNotes', i, 'y', y + noteYOffset)
        setPropertyFromGroup('strumLineNotes', i, 'scale.x', noteScale)
        setPropertyFromGroup('strumLineNotes', i, 'scale.y', noteScale)
    end

    for i = 0, getProperty('unspawnNotes.length') - 1 do
        setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
        if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
            setPropertyFromGroup('unspawnNotes', i, 'alpha', 1)
            setPropertyFromGroup('unspawnNotes', i, 'multAlpha', 1)
        end
    end
end

function opponentNoteHit()
    setProperty('camZooming', false)
end

function onUpdate(elapsed)
    for idx = 0, 3 do
        local noteID = 4 + idx
        local defaultX = _G['defaultPlayerStrumX' .. idx]
        noteTweenX(
            'tweenPlayer' .. idx,
            noteID,
            defaultX - playerXOffsets[idx + 1],
            0.025,
            'cubeInOut'
        )
    end
end

function onUpdatePost()
    local noteCount = getProperty('notes.length')
    for i = 0, noteCount - 1 do
        setPropertyFromGroup('notes', i, 'scale.x', noteScale)
        setPropertyFromGroup('notes', i, 'scale.y', noteScale)
        if getPropertyFromGroup('notes', i, 'isSustainNote') then
            setPropertyFromGroup('notes', i, 'alpha', 1)
            setPropertyFromGroup('notes', i, 'multAlpha', 1)
        end
        updateHitbox('notes', i)
    end
end
