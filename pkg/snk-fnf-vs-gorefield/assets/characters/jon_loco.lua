function opponentNoteHit()
if getProperty('dad.curCharacter') == "jon_loco" then
health = getProperty('health')
    if getProperty('health') > 0.15 then
        setProperty('health', health- 0.08);
      end
    end
end