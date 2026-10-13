function onCreate()
    makeLuaSprite('bg', 'bgs/factory/factory', -1000, -280)
    scaleObject('bg', 0.6, 0.5)
    addLuaSprite('bg')

    makeLuaSprite('light', 'bgs/factory/light', -2400, -1030)
    scaleObject('light', 0.55, 0.6)
    setBlendMode('light', 'add')
    addLuaSprite('light', true)

    makeLuaSprite('table', 'bgs/factory/table', 50, 80)
    scaleObject('table', 1.6, 1.5)
    setScrollFactor('table', 1.2, 0.95)
    addLuaSprite('table', true)

    makeLuaSprite('boxes', 'bgs/factory/boxes', -760, 100)
    scaleObject('boxes', 1.5, 1.5)
    setScrollFactor('boxes', 1.2, 0.95)
    addLuaSprite('boxes', true)
end

function onCreatePost()
    setProperty('light.alpha', 0.4)
end

local floar = 1

function onUpdatePost(elapsed)
    floar = floar + 0.01
    if mustHitSection then
        triggerEvent('Camera Follow Pos', 1000+math.cos(floar*3)*10, 500+math.sin(floar*5)*8)
    else
        triggerEvent('Camera Follow Pos', 500+math.cos(floar*3)*10, 500+math.sin(floar*5)*8)
    end

    for i = 0,3 do
        noteTweenAlpha('uh'..i, i, 0, 0.001)
    end
end