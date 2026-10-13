function onCreate()
    --Sprites mods/characters
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-fallout')
    --Death sound mods/sounds
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fallout loss sfx')
    --Dead music mods/music
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'fallout gameover')
    --Retry sound mods/music
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'fallout gameover end')
end