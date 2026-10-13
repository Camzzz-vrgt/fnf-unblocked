local oppNotes = false
local middle   = false

local noteYOffset = 30
local noteScale   = 0.4
local playerXOffsets = {25, 75, 125, 175}

function onCreate()
    -- From bodymind.lua
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf_ourple')
    makeAnimatedLuaSprite('backstage','bgs/bodymind3', 0,0)
    scaleObject('backstage', 1, 1)
    updateHitbox('backstage')
    setProperty('backstage.antialiasing', true)
    setObjectCamera('backstage', 'other')
    addLuaSprite('backstage',false)
    addAnimationByPrefix('backstage', 'backstage', 'Symbol', 20, true)

    makeAnimatedLuaSprite('ring','things/ring1', 140, 460)
    scaleObject('ring',1,1)
    setProperty('ring.antialiasing', true)
    setObjectCamera('ring', 'other')
    setObjectOrder('ring', getObjectOrder('dadGroup')-1)
    addLuaSprite('ring', false)
    addAnimationByPrefix('ring', 'ring', 'ring', 24, true)

    -- From cageshit.lua
    setProperty('camGame.bgColor', getColorFromHex('DBFF00'))
    setObjectCamera('boyfriendGroup', 'other')
    setObjectCamera('dadGroup', 'other')
    setProperty('isCameraOnForcedPos', true)
    setPropertyFromClass('PlayState.SONG', 'disableNoteRGB', true)
end

function onCreatePost()
    -- From cageshit.lua
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
    -- From cageshit.lua
    setProperty('camZooming', false)
end

function onUpdate(elapsed)
    -- From cageshit.lua
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
    -- From cageshit.lua
    local noteCount = getProperty('notes.length')
    for i = 0, getProperty('notes.length') - 1 do
        setPropertyFromGroup('notes', i, 'scale.x', noteScale)
        setPropertyFromGroup('notes', i, 'scale.y', noteScale)
        updateHitbox('notes', i)
    end
end