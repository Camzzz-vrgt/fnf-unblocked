function onCreate()
if shadersEnabled then
initLuaShader('vhs')
makeLuaSprite('shaderSprite', '', 0, 0)
makeGraphic('shaderSprite', screenWidth, screenHeight, 'FFFFFF')
setSpriteShader('shaderSprite', 'vhs')

   runHaxeCode([[
        game.camGame.setFilters([
            new ShaderFilter(game.getLuaObject('shaderSprite').shader),
            ]);
       ]])
    end
end

function onCreatePost()
makeLuaSprite('sky', 'stages/highschool/sky', -48.05, -138)
addLuaSprite('sky', false)
setScrollFactor('sky', 0.1, 0.1)

makeLuaSprite('trees', 'stages/highschool/trees', -83.2, 441.25)
addLuaSprite('trees', false)
setScrollFactor('trees', 0.1, 0.1)

makeLuaSprite('school', 'stages/highschool/school', 122.9, 43)
addLuaSprite('school', false)
setScrollFactor('school', 0.3, 0.3)

makeLuaSprite('floor', 'stages/highschool/floor', -606.2, 531.9)
addLuaSprite('floor', false)
scaleObject('floor', 0.7, 0.7, false)
setScrollFactor('floor', 0.75, 0.75)

makeAnimatedLuaSprite('crowd', 'stages/highschool/crowd', 100.45, 340.8)
addAnimationByPrefix('crowd', 'crowd', 'crowd', 24, true)
addLuaSprite('crowd', false)
scaleObject('crowd', 0.8, 0.8, false)
setScrollFactor('crowd', 0.5, 0.5)

makeAnimatedLuaSprite('leaves', 'stages/highschool/leaves', -86 - 170, 21.95)
addAnimationByPrefix('leaves', 'leaves', 'leaves', 24, true)
addLuaSprite('leaves', true)
setScrollFactor('leaves', 1.5, 1.5)

makeAnimatedLuaSprite('petals', 'stages/highschool/petals', 77.5 - 150, 105.4)
addAnimationByPrefix('petals', 'petals', 'petals', 24, true)
addLuaSprite('petals', true)
setScrollFactor('petals', 1.5, 1.5)

setScrollFactor('boyfriend',0.7,0.7)
setScrollFactor('dad',0.7,0.7)
setScrollFactor('gf',0.6,0.6)
addShadow('crowd', 2.5, nil, 50)
setObjectOrder('crowd_shadow', getObjectOrder('crowd') - 0)
addShadow('boyfriend', 1)
addShadow('dad', 1)
addShadow('gf', 1)
setProperty('boyfriend.cameraPosition[0]', getProperty('boyfriend.cameraPosition[0]') + 100)
end

function onUpdatePost(elapsed)
    local camX = getProperty('camGame.scroll.x')
    local camY = getProperty('camGame.scroll.y')
    local camW = getPropertyFromClass('flixel.FlxG', 'width')
    local camH = getPropertyFromClass('flixel.FlxG', 'height')

    local midX = getMidpointX('floor')
    local midY = getMidpointY('floor')

    local floorW = getProperty('floor.width')
    local floorH = getProperty('floor.height')

    setProperty('floor.x', ((-((camX + (camW / 2)) - midX) / 0.001) / math.pi) / floorW - 600)
    setProperty('floor.scale.y', (((-((camY + (camH / 2)) - midY - 200) / 0.002) / math.pi) / floorH) / (floorH / 2.5))
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