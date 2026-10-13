local allowEndSong = false
function onEndSong()
    if not allowEndSong and isStoryMode then
        startVideo('Jinkies-endcutscene')
        allowEndSong = true
        return Function_Stop;
    end
    return Function_Continue;
end