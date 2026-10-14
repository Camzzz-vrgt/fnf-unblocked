local spinnythingy = 0
local ifumode = false
local bopping = false

function onCreate()
makeLuaSprite('abyss','ifunnyhell/abyss', -1000, -1000)
addLuaSprite('abyss',false)
setLuaSpriteScrollFactor('abyss',0.1,0.1)
scaleObject('abyss', 2, 2)

makeAnimatedLuaSprite('flames', 'FLAMESFLAMESBURNINGFLAMES', -700, -500)
addAnimationByPrefix('flames', 'burning', 'FlamesBurn', 24, true)
objectPlayAnimation('flames', 'FlamesBurn')
scaleObject('flames', 3, 3)
setProperty('flames.alpha', 0.2)
addLuaSprite('flames', false)

makeLuaSprite('darkpillar','ifunnyhell/darkpillar', -1090, -1000)
setLuaSpriteScrollFactor('darkpillar',0.4,0.4)
scaleObject('darkpillar', 2.1, 2.1)
addLuaSprite('darkpillar',false)

makeLuaSprite('humor','ifunnyhell/humorbindings', -850, -1000)
setLuaSpriteScrollFactor('humor',1,1)
scaleObject('humor', 2.1, 2.1)

makeLuaSprite('pillar','ifunnyhell/closerpillars', -850, -1000)
setLuaSpriteScrollFactor('pillar',1.5,1.5)
scaleObject('pillar', 2, 2)

makeLuaSprite('verynotclosepillars','farpillar', -1275, 500)
setLuaSpriteScrollFactor('verynotclosepillars',0.55 ,0.55 )
scaleObject('verynotclosepillars', 2, 2)
addLuaSprite('verynotclosepillars', false)

makeLuaSprite('lessclosepillars','midpillar', -1150, 500)
setLuaSpriteScrollFactor('lessclosepillars',0.75 ,0.75 )
scaleObject('lessclosepillars', 2, 2)
addLuaSprite('lessclosepillars', false)

makeLuaSprite('closepillars','closepillar', -990, 500)
setLuaSpriteScrollFactor('closepillars',1 ,1 )
scaleObject('closepillars', 2, 2)
addLuaSprite('closepillars', false)

makeLuaSprite('spiral','ifuspiral', -1350, -1850)
setLuaSpriteScrollFactor('spiral',0.4 ,0.4 )
scaleObject('spiral', 2, 2)

makeLuaSprite('brim','ifunnyhell/brimstone', -1000, -500)
addLuaSprite('brim', true)
setLuaSpriteScrollFactor('brim',0.1,0.1)
scaleObject('brim', 2, 2)


end

stepHitFuncs = {

    [128] = function()
    doTweenY('backpillarsrise', 'verynotclosepillars', -1200, 7, 'linear')
    end,

    [608] = function()
    doTweenY('midpillarsrise', 'lessclosepillars', -1200, 7, 'linear')
    end,

    [928] = function()
    doTweenY('frontpillarsrise', 'closepillars', -1200, 7, 'linear')
    end,

    [1104] = function()
    ifumode = true
    doTweenY('brimrise', 'brim', -1000, 0.1, 'linear')
    doTweenY('firerise', 'flames', -1000, 0.1, 'linear')
    end,

    [1168] = function()
    bopping = true
    end,

    [2096] = function()
    bopping = false
    end,
}

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]() 
    elseif curStep % 2 == 0 and bopping == true then
    triggerEvent('Add Camera Zoom', 0.015, 0.015)
    end 
end

function onBeatHit()
    if curBeat % 2 == 0 and ifumode == true then
    doTweenX('backpillarbumpx', 'verynotclosepillars.scale', 2.1, 0.1, 'quartInOut')
    doTweenY('backpillarbumpy', 'verynotclosepillars.scale', 2.1, 0.1, 'quartInOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'backpillarbumpx' then
        doTweenX('midpillarbumpx', 'lessclosepillars.scale', 2.1, 0.1, 'quartInOut')
        doTweenY('midpillarbumpy', 'lessclosepillars.scale', 2.1, 0.1, 'quartInOut')
        doTweenX('backpillarbumpxback', 'verynotclosepillars.scale', 2, 0.1, 'quartInOut')
        doTweenY('backpillarbumpyback', 'verynotclosepillars.scale', 2, 0.1, 'quartInOut')
    elseif tag == 'midpillarbumpx' then
        doTweenX('frontpillarbumpx', 'closepillars.scale', 2.1, 0.1, 'quartInOut')
        doTweenY('frontpillarbumpy', 'closepillars.scale', 2.1, 0.1, 'quartInOut')
        doTweenX('midpillarbumpxback', 'lessclosepillars.scale', 2, 0.1, 'quartInOut')
        doTweenY('midpillarbumpyback', 'lessclosepillars.scale', 2, 0.1, 'quartInOut')
    elseif tag == 'frontpillarbumpx' then
        doTweenX('frontpillarbumpxback', 'closepillars.scale', 2, 0.1, 'quartInOut')
        doTweenY('frontpillarbumpyback', 'closepillars.scale', 2, 0.1, 'quartInOut')
    end
end
