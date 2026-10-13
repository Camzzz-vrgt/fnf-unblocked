function onCreatePost()
makeLuaSprite('backWall', 'stages/bro/backWall', -66, -76)
addLuaSprite('backWall', false)
setScrollFactor('backWall', 0.85, 0.85)

makeLuaSprite('floor', 'stages/bro/floor', -82, 184)
addLuaSprite('floor', false)
setScrollFactor('floor', 0.9, 0.9)

makeLuaSprite('backShelf', 'stages/bro/backShelf', 9, 188)
addLuaSprite('backShelf', false)
setScrollFactor('backShelf', 0.85, 0.85)

makeLuaSprite('stairs', 'stages/bro/stairs', 109, 102)
addLuaSprite('stairs', false)
setScrollFactor('stairs', 0.85, 0.85)

makeLuaSprite('wall', 'stages/bro/wall', 145, -84)
addLuaSprite('wall', false)
setScrollFactor('wall', 0.85, 0.85)

makeLuaSprite('tv', 'stages/bro/tv', 639, 5)
addLuaSprite('tv', false)
setScrollFactor('tv', 0.85, 0.85)

makeLuaSprite('plant', 'stages/bro/plant', 1051, 207)
addLuaSprite('plant', false)
setScrollFactor('plant', 0.9, 0.9)

makeLuaSprite('shell', 'stages/bro/shell', 352, 231)
addLuaSprite('shell', false)
setScrollFactor('shell', 0.9, 0.9)

makeLuaSprite('chair', 'stages/bro/chair', 948, 496)
addLuaSprite('chair', true)
setScrollFactor('chair', 1.2, 1.2)

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
