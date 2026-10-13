local waza = -0.015
local happy = 0.01
local drain = false


function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
addHealth(happy)
end

function onStepHit()
  if drain then
  if curStep % 1 == 0 then
    if getProperty('health') >= 0.15 then
        addHealth(waza);
  end
 end
end
end

function onBeatHit()
  if curBeat == 72 or curBeat == 174 then 
    drain = true
  end
  if curBeat == 120 or curBeat == 222 then 
    drain = false
  end
  if curBeat == 418 then 
    happy = 0.03
    waza = -0.035
    drain = true
  end
end