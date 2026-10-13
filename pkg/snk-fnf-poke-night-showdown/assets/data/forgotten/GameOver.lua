function onGameOver()
    local substate = 'substates.GameOverSubstate'
    if version <= '0.6.3' then
        substate = 'GameOverSubstate'
    end

    setPropertyFromClass(substate,'deathSoundName', 'silencio')
    setPropertyFromClass(substate,'loopSoundName', 'silencio')
    setPropertyFromClass(substate,'endSoundName', 'silencio')

    playSound('BanetteGameOver', 0, 'thingie')
    soundFadeIn('thingie', 20, 0, 1)
end

function onGameOverStart()
    makeLuaSprite('gm', 'room/gameover', 0, 0)
    scaleObject('gm', 1.25, 1.25)
    screenCenter('gm')
    setScrollFactor('gm', 0)
    setProperty('gm.alpha', 0)
    addLuaSprite('gm', true)
    setProperty('boyfriend.visible', false)

    doTweenAlpha('gma', 'gm', 1, 20, 'quadinout')
end

function onGameOverConfirm(retry)
    if luaSoundExists('thingie') then
        soundFadeOut('thingie', 0.1, 0)
    end
end