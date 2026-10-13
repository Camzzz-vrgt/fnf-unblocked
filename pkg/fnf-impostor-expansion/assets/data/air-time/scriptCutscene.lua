local allowEndSong = false
local seenEndCutscene = false

function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then
        startVideo("purple1");
        allowCountdown = true;
        return Function_Stop;
    end
end
