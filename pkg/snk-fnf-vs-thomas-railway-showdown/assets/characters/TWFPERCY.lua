function onCreate()
    --Sprites mods/characters
    setPropertyFromClass('GameOverSubstate', 'characterName', 'gameover invis')
    --Death sound mods/sounds
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'N/A')
    --Dead music mods/music
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover new')
    --Retry sound mods/music
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover new end')
end