function opponentNoteHit(id, direction, noteType, isSustainNote) --goofy ahh health drain
	if getProperty("health") > 0.02 then
			setProperty("health", getProperty("health") - 0.02)
	end
end