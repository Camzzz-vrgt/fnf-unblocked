function opponentNoteHit()
    health = getProperty('health')
    if difficulty == 2 then
        if getProperty('health') > 0.022 then
            setProperty('health', health - 0.02);
        end
    end
end

