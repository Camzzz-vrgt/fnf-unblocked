playingVideo = false

function onGameOver()
    if not playingVideo then
        startVideo('scream', true)
        playingVideo = true
        setSoundVolume(nil,0)
        setProperty('vocals.volume', 0)
        setProperty('opponentVocals.volume', 0)
        runTimer("gameoverdone", 5.0)
    end
    return Function_Stop
end

function onTimerCompleted(tag)
    if tag == "gameoverdone" then
        restartSong(true)
    end
end