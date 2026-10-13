local stupidheads = {}
local tankX = 0
local beatMode = 0
local beated = 0

function onCreatePost()
tankX = getProperty('dad.x')

makeLuaSprite('sky', 'stages/tank/sky', -20.05, -22)
addLuaSprite('sky', false)
setScrollFactor('sky', 0, 0)

createInstance('clouds', 'flixel.addons.display.FlxBackdrop', {0x01, 0x01})
loadGraphic('clouds', 'stages/tank/clouds')
setProperty('clouds.velocity.x', -30)
addInstance('clouds')
setProperty('clouds.y', -10.7)
setScrollFactor('clouds', 0.1, 0.4)

makeLuaSprite('mountains', 'stages/tank/mountains', -169, 28)
addLuaSprite('mountains', false)
setScrollFactor('mountains', 0.2, 0.2)

makeLuaSprite('bg2', 'stages/tank/bg2', -65.6, 264.2)
addLuaSprite('bg2', false)
setScrollFactor('bg2', 0.3, 0.6)

makeLuaSprite('bg1', 'stages/tank/bg1', -64.5, 243.7)
addLuaSprite('bg1', false)
setScrollFactor('bg1', 0.5, 0.8)

makeLuaSprite('ground', 'stages/tank/ground', -232.5, 379.5)
addLuaSprite('ground', false)

for i = 0,7 do
makeAnimatedLuaSprite('stupid'..i, 'stages/tank/stupidma', -100 + (i * 180), 301)
addAnimationByPrefix('stupid'..i, 'stupid', 'stupidman000'..getRandomInt(0,7), 0, false)
setProperty('stupid'..i..'.antialiasing', false)
scaleObject('stupid'..i, 0.8, 0.8, false)
playAnim('stupid'..i, 'stupid', true)
addLuaSprite('stupid'..i, false)
table.insert(stupidheads, 'stupid'..i)
end

makeLuaSprite('box', 'stages/tank/box', 990.2, 344.95)
addLuaSprite('box', false)

makeLuaSprite('objects', 'stages/tank/objects', -120.9, 395.9)
addLuaSprite('objects', false)

makeAnimatedLuaSprite('boom','stages/tank/boom', -29.55, -159.25)
addAnimationByPrefix('boom', 'boom', 'boom', 24, false)
setProperty('boom.visible', false)
addLuaSprite('boom', true)

addShadow('boyfriend', 1)
addShadow('dad', 1, 70)
addShadow('gf', 1)

runTimer('tankLoop', 0.08, 0)
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

function beatSwitch(b)
    beatMode = tonumber(b)
    beated = 0
end

function onBeatHit()
    if beatMode == 0 then
        for i = 1, #stupidheads do
            scaleObject(stupidheads[i], 0.85, 0.75, false)
            setProperty(stupidheads[i]..'.y', 309)
        end

    elseif beatMode == 1 then
        for i = 1, #stupidheads do
            scaleObject(stupidheads[i], 0.81, 0.79, false)
            setProperty(stupidheads[i]..'.y', 302)
        end

        beated = beated + 1
        if beated >= #stupidheads then beated = 0 end

        scaleObject(stupidheads[beated+1], 0.70, 0.9, false)
        setProperty(stupidheads[beated+1]..'.y', 288)

    elseif beatMode == 2 then
        beated = beated + 1
        if beated >= 2 then beated = 0 end

        for i = 1, #stupidheads do
            scaleObject(stupidheads[i], 0.85, 0.75, false)
            setProperty(stupidheads[i]..'.y', 309)
            if (i-1) % 2 == beated then
                scaleObject(stupidheads[i], 0.75, 0.85, false)
                setProperty(stupidheads[i]..'.y', 293)
            end
        end

    elseif beatMode == 3 then
        beated = beated + 1
        if beated >= 2 then beated = 0 end

        for i = 1, #stupidheads do
            scaleObject(stupidheads[i], 0.85, 0.75, false)
            setProperty(stupidheads[i]..'.y', 309)
            if beated % 2 == 0 then
                scaleObject(stupidheads[i], 0.75, 0.85, false)
                setProperty(stupidheads[i]..'.y', 293)
            end
        end

    elseif beatMode == 4 then
        beated = 0
    end
end

function tankShoot()
    setProperty('boom.visible', true)
    playAnim('boom', 'boom')
    setProperty('dad.skipDance',true)
    playAnim('dad', 'die', true)
    playSound('gun')

    runTimer('tankShootMove', 0.4)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'tankLoop' then
        for i = 1, #stupidheads do
            setProperty(stupidheads[i]..'.scale.x', lerp(getProperty(stupidheads[i]..'.scale.x'), 0.8, 0.5))
            setProperty(stupidheads[i]..'.scale.y', lerp(getProperty(stupidheads[i]..'.scale.y'), 0.8, 0.5))
            setProperty(stupidheads[i]..'.y', lerp(getProperty(stupidheads[i]..'.y'), 301, 0.5))
        end

    elseif tag == 'tankShootMove' then
        setProperty('dad.x', getProperty('dad.x') - 700)
        setProperty('dad.skipDance',true)
        playAnim('dad', 'walk', true)
        doTweenX('dadBack', 'dad', tankX, 1, 'linear')
        runTimer('dadIdle', 1)

    elseif tag == 'dadIdle' then
        setProperty('dad.skipDance',false)
        playAnim('dad', 'idle', true)
    end
end

function lerp(a, b, ratio)
    return a + ratio * (b - a)
end

function onDestroy()
    cancelTimer('tankLoop')
end