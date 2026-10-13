function onCreate()
    --Sprites mods/characters
    setPropertyFromClass('GameOverSubstate', 'characterName', 'boiler gameover')
    --Death sound mods/sounds
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'loss boilertest')
    --Dead music mods/music
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'loop boilertest')
    --Retry sound mods/music
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'end boilertest')
end