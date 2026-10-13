local canTaunt = false
local Taunting = false
local TauntTiming = 0.8
local TauntCooldown = 0.1
local introEnded = false

function onSongStart()
    canTaunt = true
end

function Taunt()
    Taunting = true
    canTaunt = false

    characterPlayAnim('nan pengyou', 'respect', true)
    setProperty('nan pengyou.specialAnim', true)
    playSound('gong')

    runTimer('Taunt', TauntTiming)
end

function onUpdate(elapsed)
    local currentBeat = getSongPosition() / crochet

    if curBeat >= 512 and curBeat < 640 then
        local danced = getProperty('gf.danced')
        local angle = math.abs(fastSin(currentBeat))

        if danced then
            setProperty('camHUD.angle', 4 * angle)
        else
            setProperty('camHUD.angle', -4 * angle)
        end

    elseif curBeat >= 704 and curBeat < 832 then
        for i = 0, 7 do
            setStrumX(_G['defaultStrumX' .. i] + 10 * fastSin(currentBeat + i / 4), i)
            noteTweenX('noteTween' .. i, i, _G['defaultStrumX' .. i], crochet / 1000, 'sineOut')
        end

        setProperty('defaultCamZoom', 0.775)
    elseif introEnded then
        setProperty('defaultCamZoom', 0.8125)

        if getProperty('camHUD.angle') ~= 0 then
            setProperty('camHUD.angle', 0)
        end
    end

    local SPACE = keyJustPressed('space')
    if SPACE and not Taunting and canTaunt and not botPlay then
        Taunt()
    end
end

function onTimerCompleted(tag)
    if tag == 'Taunt' then
        Taunting = false
        characterDance('nan pengyou')

        runTimer('TauntCooldown', TauntCooldown)
    elseif tag == 'TauntCooldown' then
        canTaunt = true
    elseif tag == 'checkTaunting' then
        if canTaunt and not Taunting and not botPlay then

        end
    end
end