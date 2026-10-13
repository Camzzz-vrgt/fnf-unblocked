-- i set it up like this in case i have to make more extra characters and i wanna be lazy

local singing = false
local loopingIdle = false
local charX = 1600
local charY = 580
local flipX = false
local antialiasing = true
local scale = 1
local noteTypeToTriggerAnim = 'No Animation' -- in case i wanna attach the anims to a noteType :P

local singAnims = {
    'singLEFT',
    'singDOWN',
    'singUP',
    'singRIGHT'
}

local animOffsets = {
    -60, 0,
    -60, -75,
    -120, 16,
    -68, 0,
    -17, 0
}

local animNames = {
    'Pump IDLE',
    'Pump LEFT',
    'Pump DOWN',
    'Pump UP',
    'Pump RIGHT'
}

function onCreate()
    createChar('pump', 'characters/pump/pump')
end

function onCreatePost()
    setObjectOrder('pump', 6)
end

function onUpdate()
    if curBeat %2 == 0 and not loopingIdle and not singing then
        playAnim('pump', 'idle')
    elseif loopingIdle and not singing then
        playAnim('pump', 'idle')
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    direction = direction+1
    for i = 1,4 do
        if direction == i and noteType == noteTypeToTriggerAnim then
            playAnim('pump', singAnims[i], true)
            singing = true
            runTimer('idleTimer', 0.3, 0)
        end
    end
end

function onTimerCompleted(t)
    if t == 'idleTimer' then
        singing = false
    end
end

function createChar(name, directory)
    makeAnimatedLuaSprite(name, directory, charX, charY)
    addAnimationByPrefix(name, 'idle', animNames[1], 24, loopingIdle)
    addAnimationByPrefix(name, 'singLEFT', animNames[2], 24, false)
    addAnimationByPrefix(name, 'singDOWN', animNames[3], 24, false)
    addAnimationByPrefix(name, 'singUP', animNames[4], 24, false)
    addAnimationByPrefix(name, 'singRIGHT', animNames[5], 24, false)
    addLuaSprite(name)

    addOffset(name, 'idle', animOffsets[1], animOffsets[2])
    addOffset(name, 'singDOWN', animOffsets[3], animOffsets[4])
    addOffset(name, 'singUP', animOffsets[5], animOffsets[6])
    addOffset(name, 'singRIGHT', animOffsets[7], animOffsets[8])
    addOffset(name, 'singLEFT', animOffsets[9], animOffsets[10])

    setProperty(name..'.flipX', flipX)
    setProperty(name..'.antialiasing', antialiasing)
    setProperty(name..'.scale.x', scale)
    setProperty(name..'.scale.y', scale)
end