local allowCountdown = false
local def = 0
local gameIntensity = 0.001
local HudIntensity = 0.0005

function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then
        startVideo('hasshaku1_cutscene')
        allowCountdown = true
        return Function_Stop
    end
    setPropertyFromGroup("strumLineNotes.members", 0, "x", defaultPlayerStrumX0)
    setPropertyFromGroup("strumLineNotes.members", 1, "x", defaultPlayerStrumX1)
    setPropertyFromGroup("strumLineNotes.members", 2, "x", defaultPlayerStrumX2)
    setPropertyFromGroup("strumLineNotes.members", 3, "x", defaultPlayerStrumX3)
    setPropertyFromGroup("strumLineNotes.members", 4, "x", defaultOpponentStrumX0)
    setPropertyFromGroup("strumLineNotes.members", 5, "x", defaultOpponentStrumX1)
    setPropertyFromGroup("strumLineNotes.members", 6, "x", defaultOpponentStrumX2)
    setPropertyFromGroup("strumLineNotes.members", 7, "x", defaultOpponentStrumX3)

    return Function_Continue
end

function opponentNoteHit()

    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health - 0.01)
    end
end

function onCreate()
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Hurt Note' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'HURTNOTE_assets')

            if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
            end
        end
    end

    setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'BF_Hasshaku1_dead')
    setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx_hasshaku1') --file goes inside sounds/ folder
    setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver_hasshaku1')      --file goes inside music/ folder
    setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd_hasshaku1')    --file goes inside music/ folder

end

function onGameOver()
    setProperty("defaultCamZoom", 1)
    setProperty("camGame.zoom", 0.8)
end

function onGameOverConfirm(retry)
    if retry then
        cameraFlash("other", 'ffffff', 1.0 / playbackRate, true)
    end
end

function onUpdate()
    setPropertyFromGroup("strumLineNotes.members", 0, "x", defaultPlayerStrumX0)
    setPropertyFromGroup("strumLineNotes.members", 1, "x", defaultPlayerStrumX1)
    setPropertyFromGroup("strumLineNotes.members", 2, "x", defaultPlayerStrumX2)
    setPropertyFromGroup("strumLineNotes.members", 3, "x", defaultPlayerStrumX3)
    setPropertyFromGroup("strumLineNotes.members", 4, "x", defaultOpponentStrumX0)
    setPropertyFromGroup("strumLineNotes.members", 5, "x", defaultOpponentStrumX1)
    setPropertyFromGroup("strumLineNotes.members", 6, "x", defaultOpponentStrumX2)
    setPropertyFromGroup("strumLineNotes.members", 7, "x", defaultOpponentStrumX3)
end

function onStepHit()
    if curStep == 394 then
        doTweenAlpha('hudGone', 'camHUD', 0, 0.3 / playbackRate, "linear")
    elseif curStep == 415 then
        doTweenAlpha('hudGone', 'camHUD', 1, 0.3 / playbackRate, "linear")
    elseif curStep == 650 then
        doTweenAlpha('hudGone', 'camHUD', 0, 0.3 / playbackRate, "linear")
    elseif curStep == 672 then
        doTweenAlpha('hudGone', 'camHUD', 1, 0.3 / playbackRate, "linear")
    elseif curStep == 1456 then
        doTweenAlpha('black', 'black', 1, 0.0001 / playbackRate, 'linear')
    elseif curStep == 1472 then
        doTweenAlpha('black', 'black', 0, 20 / playbackRate, 'linear')
    elseif curStep == 2752 then
        doTweenAlpha('hudGone', 'camHUD', 0, 0.3 / playbackRate, "linear")
    end
end

function onEndSong()
    if isStoryMode and not seenCutscene then
        setProperty("camGame.alpha", .0)
        setProperty("camHUD.alpha", .0)
        startVideo('hasshaku1_end')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end