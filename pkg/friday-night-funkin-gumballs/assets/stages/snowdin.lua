function onCreatePost()
makeLuaSprite('sky', 'stages/snowdin/sky', -112, -146.05)
addLuaSprite('sky', false)
setScrollFactor('sky', 0.1, 0.1)

makeLuaSprite('forest', 'stages/snowdin/forest', -165, 3)
addLuaSprite('forest', false)
setScrollFactor('forest', 0.5, 0.5)

makeLuaSprite('trees', 'stages/snowdin/trees', -82, -121)
addLuaSprite('trees', false)
setScrollFactor('trees', 0.8, 0.8)

makeLuaSprite('snow', 'stages/snowdin/snow', -116, 455.1)
addLuaSprite('snow', false)

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
