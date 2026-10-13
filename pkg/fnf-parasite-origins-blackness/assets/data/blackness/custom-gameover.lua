--data/'song'/

function onCreate()
    --Sprites mods/characters
    setPropertyFromClass('GameOverSubstate', 'characterName', 'dedblack')
    --Death sound mods/sounds
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'game_over')
    --Dead music mods/music
    setPropertyFromClass('GameOverSubstate', 'loopSoundname', 'loopyee')
    --Retry sound mods/music
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'retry')
end