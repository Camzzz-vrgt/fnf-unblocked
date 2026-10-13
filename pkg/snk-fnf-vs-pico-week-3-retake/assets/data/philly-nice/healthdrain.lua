function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.15 and difficultyName == 'hard' then
        setProperty('health', health - 0.008);
    end
end