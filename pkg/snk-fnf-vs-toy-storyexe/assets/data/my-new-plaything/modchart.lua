local defaultNotePos = {};
local move = 7;
 
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdate(elapsed)
 
    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 350) * (bpm / 160)


    for i = 0,7 do 
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + move * math.sin((currentBeat + i*4) * math.pi))
        
        setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + move * math.cos((currentBeat + i*0.6) * math.pi))
    end
end