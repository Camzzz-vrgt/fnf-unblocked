range = 1
local defaultNotePos = {};

function onSongStart()
	for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdate(elapsed)
    if difficulty == 2 and curStep > 703 then
        songPos = getPropertyFromClass('Conductor', 'songPosition');
    	currentBeat = (songPos / 1000) * (bpm / 60)
		for i=0,7 do
			setPropertyFromGroup('strumLineNotes', i, 'x',defaultNotePos[i + 1][1] + range * math.sin((currentBeat + i*0.25) * math.pi), i)
			setPropertyFromGroup('strumLineNotes', i, 'y',defaultNotePos[i + 1][2] + range * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
    end
end

function onStepHit()
	if curStep >= 704 and curStep <= 840 then
		range = range + 0.3
	end

end