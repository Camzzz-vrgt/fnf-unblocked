function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.15 and difficultyName == 'erect' then
        setProperty('health', health - 0.017);
    end
end