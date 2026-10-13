function onCreate()
    --Sprites mods/characters
    setPropertyFromClass('GameOverSubstate', 'characterName', 'driverbf')
    --Death sound mods/sounds
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx')
    --Dead music mods/music
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover new')
    --Retry sound mods/music
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover new end')
end