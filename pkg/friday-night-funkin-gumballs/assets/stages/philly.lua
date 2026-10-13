curColor = 1
colors = {
    '00F7FF',
    '00FF22',
    'FF00F7',
    'FF1313',
    'FBFF00'
}

function onCreatePost()
makeLuaSprite('sky', 'stages/philly/sky', -80.05, -78)
addLuaSprite('sky', false)
setScrollFactor('sky', 0.1, 0.1)

makeLuaSprite('buildings', 'stages/philly/buildings', -91, -8)
addLuaSprite('buildings', false)
setScrollFactor('buildings', 0.3, 0.3)

makeLuaSprite('windows', 'stages/philly/windows', -31, 12.4)
addLuaSprite('windows', false)
setScrollFactor('windows', 0.3, 0.3)
setProperty('windows.color', getColorFromHex(colors[curColor]))

makeLuaSprite('ground', 'stages/philly/ground', -133, 392)
addLuaSprite('ground', false)

addShadow('boyfriend', 1)
addShadow('dad', 1)
addShadow('gf', 1)
end

function addShadow(character, scaleX, fox, foy)
    fox = fox or 0
    foy = foy or 0

    makeLuaSprite(character..'_shadow', 'shadow', 0, 0)
    setProperty(character..'_shadow.antialiasing', false)
    setProperty(character..'_shadow.scale.x', scaleX)
    setProperty(character..'_shadow.scrollFactor.x', getProperty(character..'.scrollFactor.x'))
    setProperty(character..'_shadow.scrollFactor.y', getProperty(character..'.scrollFactor.y'))
    
    local charX = getProperty(character..'.x')
    local charY = getProperty(character..'.y')
    local charWidth = getProperty(character..'.width')
    local charHeight = getProperty(character..'.height')
    local shadowWidth = getProperty(character..'_shadow.width')
    local shadowHeight = getProperty(character..'_shadow.height')

    setProperty(character..'_shadow.x', charX + ((charWidth / 2) - (shadowWidth / 2) + 10))
    setProperty(character..'_shadow.y', charY + charHeight - (shadowHeight / 1.25))
    setProperty(character..'_shadow.offset.x', fox)
    setProperty(character..'_shadow.offset.y', foy)
    addLuaSprite(character..'_shadow', false)
end

function onBeatHit()
    if curBeat % 4 == 0 then
        local newColor = math.random(1, #colors-1)
        if newColor >= curColor then
            newColor = newColor + 1
        end
        curColor = newColor
        setProperty('windows.color', getColorFromHex(colors[curColor]))
    end
end

function onUpdatePost(elapsed)
    local curBeatFloat = (getSongPosition() / 1000) * (bpm / 60)
    if getSongPosition() > 0 then
        local ease = math.pow((curBeatFloat / 4) % 1, 3)
        setProperty('windows.alpha', 1 - (ease * 0.85))
    else
        setProperty('windows.alpha', 0)
    end

    color = getProperty('windows.color')
end