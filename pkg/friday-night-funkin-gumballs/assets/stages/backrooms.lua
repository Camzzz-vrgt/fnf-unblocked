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
makeLuaSprite('bg', 'stages/backrooms/bg', -263.35, -359.5)
addLuaSprite('bg', false)
setScrollFactor('bg', 0.6, 0.7)

makeAnimatedLuaSprite('boy','stages/backrooms/boy', 42.5, -315.7)
addAnimationByPrefix('boy', 'boy', 'boy', 24, false)
setScrollFactor('boy', 0.8, 0.8)
setProperty('boy.offset.x', 80)
addLuaSprite('boy', false)

addShadow('boy', 1)
addShadow('boyfriend', 1)
addShadow('dad', 1)
addShadow('gf', 1)
end

function onBeatHit()
playAnim('boy', 'boy')
setProperty('boy.flipX', not getProperty('boy.flipX'))
setProperty('boy.x', (getProperty('boy.flipX') and 220 or 113))
end

function onCountdownTick(c)
    if c > 0 then
          onBeatHit()
    end
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