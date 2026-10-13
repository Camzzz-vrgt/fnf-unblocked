function onCreatePost()
makeLuaSprite('bg', 'stages/ena/bg', -65, -60)
addLuaSprite('bg', false)
scaleObject('bg', 1.3, 1.3)
setScrollFactor('bg', 0, 0)

makeLuaSprite('polygons', 'stages/ena/polygons', -140, -136)
addLuaSprite('polygons', false)
setScrollFactor('polygons', 0.8, 0.8)

makeLuaSprite('platform', 'stages/ena/platform', -64, -107)
addLuaSprite('platform', false)

addShadow('boyfriend', 1)
addShadow('dad', 1)
addShadow('gf', 1)
end

local time = 0

function onUpdatePost(elapsed)
    time = time + elapsed

    setProperty('polygons.angle', math.cos(time/1) / 2)
    setProperty('polygons.x', -140 * (math.cos(time/2) / 8))
    setProperty('polygons.y', -136.25 * (math.sin(time/2) / 8))
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