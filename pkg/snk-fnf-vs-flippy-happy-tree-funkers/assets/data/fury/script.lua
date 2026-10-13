local allowCountdown = false
function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
        startVideo('cutscene3');
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end

function onCreate()
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-htf');
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bunfriend_death_sound');
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover1');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover2');

end

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('cutscene4')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end