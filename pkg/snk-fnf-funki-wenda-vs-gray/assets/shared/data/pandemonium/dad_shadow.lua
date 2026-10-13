local ghostAlpha = 0.4 -- How visible the ghost trail is
local ghostDuration = 0.3 -- How long the ghost trail lasts
local trailCount = 0 -- Counter for unique ghost trail IDs
local isEnabled = false -- Track if the effect is currently enabled

-- Steps to toggle the ghost trail effect
local GhostStartOn = 516  -- Step when ghost trail begins
local GhostEndOn = 646    -- Step when ghost trail ends

-- Position offsets for each direction (can be adjusted with events)
local positionOffsets = {
    [0] = {x = 270, y = 90},  -- LEFT note offset
    [1] = {x = -50, y = -380},  -- DOWN note offset
    [2] = {x = 100, y = 370},  -- UP note offset
    [3] = {x = -300, y = -90}   -- RIGHT note offset
}

-- Store the alternative animations to play for each direction (reversed as requested)
local altAnims = {
    [0] = 'singRIGHT', -- When opponent goes LEFT, ghost goes RIGHT
    [1] = 'singUP',    -- When opponent goes DOWN, ghost goes UP
    [2] = 'singDOWN',  -- When opponent goes UP, ghost goes DOWN
    [3] = 'singLEFT'   -- When opponent goes RIGHT, ghost goes LEFT
}

-- Store the animation names from your character's JSON
local animNames = {
    ['singLEFT'] = 'Left',
    ['singDOWN'] = 'Down',
    ['singUP'] = 'uP',
    ['singRIGHT'] = 'right'
}

function getOpponent()
    return 'dad' -- This will work for any opponent character
end

function onCreatePost()
    precacheImage(getProperty(getOpponent() .. '.imageFile'))
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if not isEnabled or isSustainNote then return end -- Skip if disabled or sustain note
    
    local opponent = getOpponent()
    local tag = 'ghostTrail' .. trailCount
    
    local altAnim = altAnims[direction]
    local animName = animNames[altAnim]
    
    if not animName then
        debugPrint('Missing animation name for: ' .. tostring(altAnim))
        return
    end
    
    local offsetX = positionOffsets[direction].x
    local offsetY = positionOffsets[direction].y
    
    makeAnimatedLuaSprite(tag, getProperty(opponent .. '.imageFile'), 
        getProperty(opponent .. '.x') + offsetX, 
        getProperty(opponent .. '.y') + offsetY)
    
    addAnimationByPrefix(tag, 'anim', animName, 24, false)
    addLuaSprite(tag, false)
    
    setProperty(tag .. '.alpha', ghostAlpha)
    setProperty(tag .. '.scale.x', getProperty(opponent .. '.scale.x'))
    setProperty(tag .. '.scale.y', getProperty(opponent .. '.scale.y'))
    setProperty(tag .. '.flipX', getProperty(opponent .. '.flipX'))
    setProperty(tag .. '.offset.x', getProperty(opponent .. '.offset.x'))
    setProperty(tag .. '.offset.y', getProperty(opponent .. '.offset.y'))
    setObjectOrder(tag, getObjectOrder(opponent .. 'Group') - 1)
    
    objectPlayAnimation(tag, 'anim', true)
    
    doTweenAlpha(tag .. 'fade', tag, 0, ghostDuration, 'linear')
    
    trailCount = trailCount + 1
end

function onTweenCompleted(tag)
    if tag:sub(-4) == 'fade' then
        local spriteTag = tag:sub(1, -5)
        removeLuaSprite(spriteTag, true)
    end
end

function onStepHit()
    -- Enable ghost trail effect at start step
    if curStep == GhostStartOn then
        isEnabled = true
    end
    
    -- Disable ghost trail effect at end step
    if curStep == GhostEndOn then
        isEnabled = false
    end
end

-- Event handlers to customize the effect during gameplay
function onEvent(name, value1, value2)
    if name == 'Ghost Trail Alpha' then
        ghostAlpha = tonumber(value1) or 0.4
    elseif name == 'Ghost Trail Duration' then
        ghostDuration = tonumber(value1) or 0.6
    elseif name == 'Ghost Trail Offset' then
        local direction = tonumber(value1)
        if direction and direction >= 0 and direction <= 3 then
            local x, y = string.match(value2 or "", "([^,]+),([^,]+)")
            x = tonumber(x) or 0
            y = tonumber(y) or 0
            positionOffsets[direction].x = x
            positionOffsets[direction].y = y
        end
    end
end