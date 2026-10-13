-- i set it up like this in case i have to make more extra characters and i wanna be lazy

local charName = 'bob_flashback'
local singing = false
local loopingIdle = false
local flipX = false
local antialiasing = true
local scale = 1

local singAnims = {
    'singLEFT',
    'singDOWN',
    'singUP',
    'singRIGHT'
}

local animOffsets = {
    -400, -75, -- idle
    -400, -125, -- down
    -420, -46, -- up
    -438, -90, -- right
    -265, -90 -- left
}

local animNames = {
    'Bob flashback idle',
    'bob fb LEFT',
    'bob fb DOWN',
    'bob fb UP',
    'bob FB RIGHT'
}

beatShit = {
    [369] = function()
        doTweenAlpha('guh', 'bob_flashback', 1, 10)
        doTweenAlpha('wuh', 'glass', 1, 6)
        doTweenAlpha('buh', 'mirror', 1, 6)
		
		triggerEvent("mirrorArrows", "on", nil)
    end,

    [464] = function()
        doTweenAlpha('guh', 'bob_flashback', 0, 2)
        doTweenAlpha('wuh', 'glass', 0, 6)
        doTweenAlpha('buh', 'mirror', 0, 6)
		
		triggerEvent("mirrorArrows", "off", nil)
    end,
}

stepShit = {
    [1008] = function ()
        setProperty('bobAnims.visible', true)
        playAnim('bobAnims', 'kill', true)
        setProperty('dad.visible', false)
    end,

    [1073] = function ()
        doTweenX('walk', 'bobAnims', defaultBoyfriendX-600, 2.79)
    end,

    [1108] = function ()
        setProperty('box.visible', true)
    end,

    [1150] = function ()
        setProperty('bobAnims.x', defaultOpponentX-300)
    end,

    [1152] = function ()
        doTweenAlpha('boccs', 'box', 0, 1.5)
    end,

    [1153] = function ()
        playAnim('bobAnims', 'que', true)
    end,

    [1216] = function ()
        removeLuaSprite('bobAnims', true)
        removeLuaSprite('box', true)
        setProperty('dad.visible', true)
    end
}

function onCreate()
    makeLuaSprite('glass', 'bgs/flashback/glass')
    screenCenter('glass')
    setObjectCamera('glass', 'hud')
    scaleObject('glass', 0.62, 0.6)
    addLuaSprite('glass')

    createChar(charName, 'characters/bob/flashback_bob')
    setObjectCamera(charName, 'hud')

    makeLuaSprite('mirror', 'bgs/flashback/mirror')
    screenCenter('mirror')
    setObjectCamera('mirror', 'hud')
    setBlendMode('mirror', 'layer')
    scaleObject('mirror', 0.62, 0.6)
    addLuaSprite('mirror')

    makeLuaSprite('box')
    makeGraphic('box', screenWidth, screenHeight, '000000')
    setObjectCamera('box', 'hud')
    addLuaSprite('box')

    makeAnimatedLuaSprite('bobAnims', 'characters/bob/Bob_second', defaultOpponentX-300, 40)
    addAnimationByPrefix('bobAnims', 'kill', 'Bob kill anim', 24, false)
    addAnimationByPrefix('bobAnims', 'que', 'Bob did you know', 24, false)
    scaleObject('bobAnims', getProperty('dad.scale.x'), getProperty('dad.scale.y'))
    addLuaSprite('bobAnims')
    playAnim('bobAnims', 'que', true)
end

function onCreatePost()
    setProperty('bobAnims.visible', false)
    setProperty('box.visible', false)
    setProperty('bob_flashback.alpha', 0)
    setProperty('glass.alpha', 0)
    setProperty('mirror.alpha', 0)
    setProperty('mirror.offset.y', -30)
    setProperty('glass.offset.y',90)
    setProperty('mirror.offset.x',-10)
    setProperty('glass.offset.x',90)
end

function onUpdate()
    if curBeat %3 == 0 and not loopingIdle and not singing then
        playAnim(charName, 'idle')
    elseif loopingIdle and not singing then
        playAnim(charName, 'idle')
    end

    if beatShit[curBeat] then
        beatShit[curBeat]()
    end

    if stepShit[curStep] then
        stepShit[curStep]()
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    direction = direction+1
    for i = 1,4 do
        if direction == i then
            playAnim(charName, singAnims[i], true)
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

function onTweenCompleted(t)
    if t == 'walk' then
        setProperty('boyfriend.exists', false)
    end
end

function createChar(name, directory)
    makeAnimatedLuaSprite(name, directory)
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