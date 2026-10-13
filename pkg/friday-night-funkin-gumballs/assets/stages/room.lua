function onCreatePost()
makeLuaSprite('back', 'stages/room/back', -208, -292)
addLuaSprite('back', false)
setScrollFactor('back', 0.8, 0.8)

makeLuaSprite('tv', 'stages/room/tv', 41, 276)
addLuaSprite('tv', false)

makeLuaSprite('front', 'stages/room/front', 705, 524)
addLuaSprite('front', true)
setScrollFactor('front', 1.5, 1.5)

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
