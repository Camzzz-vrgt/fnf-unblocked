function onCreate()
    --Sprites mods/characters
    setPropertyFromClass('GameOverSubstate', 'characterName', 'driverbf-encore')
    --Death sound mods/sounds
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'tonic loss')
    --Dead music mods/music
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover new')
    --Retry sound mods/music
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover new end')
end