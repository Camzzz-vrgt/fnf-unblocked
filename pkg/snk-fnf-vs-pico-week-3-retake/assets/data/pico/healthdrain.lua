function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.15 and difficultyName == 'Hard' then
        setProperty('health', health - 0.008);
    end
end