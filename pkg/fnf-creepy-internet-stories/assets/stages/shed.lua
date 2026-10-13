function onCreatePost() 
    makeLuaSprite('back', 'stages/shed/ched')
    addLuaSprite('back') 

    makeLuaSprite('front', 'stages/shed/foreskin', -100, -200)
    setScrollFactor('front', 0.8, 0.8)
    
    addLuaSprite('front', true) 

    makeLuaSprite('logo', 'stages/shed/mov')

    setObjectCamera('logo', 'other')
    screenCenter('logo')
    

    setProperty('healthBar.scale.y', 2)

    loadGraphic('healthBarBG', 'stages/shed/brain')
    setObjectOrder('healthBarBG', getObjectOrder('iconP1') - 1)

    setProperty('healthBarBG.xAdd', -41)
    setProperty('healthBarBG.yAdd', -21)


    setProperty('camHUD.alpha', 0)
    cameraFade('camGame', '000000', 0)
end 

function onMoveCamera(focus) setProperty('defaultCamZoom', focus == 'dad' and 0.8 or 1) end

function onStepHit()
    if curStep % 4 == 0 and getProperty('camZoomingMult') == 2 then
        for i = 4, 7 do
            local angleFactor = ((curStep % 8 == 0) and i or 7 - i)

            for j, axis in pairs({'X', 'Y', 'Angle'}) do
                local origin = getPropertyFromGroup('strumLineNotes', i, axis:lower())

                local new = 40 / (j ^ 2)

                setPropertyFromGroup('strumLineNotes', i, axis:lower(), origin + (axis == 'Y' and (new + (angleFactor % 4) * new) or ((curStep % 8 == 0) and new or -new)))
                _G['noteTween' .. axis]('arrowBop' .. axis .. i, i, origin, (crochet / 1100) / playbackRate, 'circOut')
            end
        end
    end
end

local exclude = "4, 9, 12, 15, 20, 21, 22, 24, 26, 29, 30, 33, 36"

local drippie = 0

function onStartCountdown() 
    if drippie == 0 then
        playSound('shedIntro', 1, 'intro')
        runTimer('delay', 0.6) 

        return Function_Stop    
    end

    setProperty('skipCountdown', true)

    return Function_Continue
end

function onSoundFinished(tag) 
    if tag == 'intro' then 
        removeLuaSprite('logo', true) 

        for i = 1, drippie do
            cancelTween('stream' .. i)

            removeLuaSprite(i, true)
        end

        runTimer('delay', 0.6)
    end 
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'delay' then
        if drippie == 0 then 
            addLuaSprite('logo')
            doTweenColor('evil', 'logo', 'ff0000', 2, 'circIn')
        else
            startCountdown()
        end
    elseif tag == 'drip' then
        local number = getRandomInt(1, 39, exclude)

        spawnDrop(number * 10)
        exclude = exclude .. ', ' .. number
    end
end

function onTweenCompleted(tag) if tag == 'evil' then runTimer('drip', 0.1, 20) end end

function spawnDrop(x)
    drippie = drippie + 1

    makeLuaSprite(drippie, '', getProperty('logo.x') + x, getProperty('logo.y') + 82)
    makeGraphic(drippie, 5, 2, 'ff0000')

    setProperty(drippie .. '.origin.y', 0)
    setObjectCamera(drippie, 'camOther')

    doTweenY('stream' .. drippie, drippie .. '.scale', 200, 2.5)

    addLuaSprite(drippie)
end