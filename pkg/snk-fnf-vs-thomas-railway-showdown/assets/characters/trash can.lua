function onGameOverStart()
         startVideo('asboi')
end
function onCreate()
    --Sprites mods/characters
    setPropertyFromClass('GameOverSubstate', 'characterName', 'gameover invis')
    --Death sound mods/sounds
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'N/A')
    --Dead music mods/music
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'N/A')
    --Retry sound mods/music
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover new end')
end