function opponentNoteHit(name, value1, value2)
if name == 'drain sing' then
    health = getProperty('health')
    if getProperty('health') > value1 then
        setProperty('health', health- value2);
    end
end

end