function onCreatePost()
    for i, sprite in pairs({'sky', 'hills', 'foregroun d', 'skullemoji', 'part1'}) do
        makeLuaSprite(sprite, 'stages/pooch/' .. sprite)

        local factor = (i < 3 and 1 - (i / 4) or 1)
        setScrollFactor(sprite, factor, math.sqrt(factor))
        setProperty(sprite .. '.antialiasing', false)

        if i < 4 then addLuaSprite(sprite) else setObjectCamera(sprite, 'camHUD') end
    end

    for i = 1, 2 do
        loadGraphic('iconP' .. i, 'icons/icon-' .. getProperty((i == 1 and 'boyfriend' or 'dad') .. '.healthIcon'), 150)
	    addAnimation('iconP' .. i, getProperty('dad.healthIcon'), {0, 1, 2, 3, 4, 5}, 0, false)
    end
end

local lastFrame = 0
local shit = 0

function onUpdatePost(elapsed)
    if getSongPosition() - lastFrame > (1000 / 24) then
        shit = shit + 1

        lastFrame = getSongPosition()
    end

    setProperty('iconP2.animation.curAnim.curFrame', getProperty('healthBar.percent') < 80 and (curStep % 5) or 5) setProperty('iconP1.animation.curAnim.curFrame', getProperty('healthBar.percent') > 20 and (curStep % 5) or 5) runHaxeCode('game.iconP1.offset.set(0, 0); game.iconP2.offset.set(0, 0);')
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if not (getProperty('dad.curCharacter') == 'rotten' and (getRandomBool(15) or isSustainNote)) then return end

    cameraShake('camHUD', 0.002, 0.1)
    setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.02)

    removeLuaSprite('flash', true)

    makeLuaSprite('flash', 'stages/pooch/fart/' .. getRandomInt(1, 5), getRandomInt(300, 900), 450 + getRandomInt(-100, 100))
    addLuaSprite('flash', true)
end