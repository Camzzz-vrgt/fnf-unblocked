local Nps = 0;
local NoteHit = false;

function onStepHit()
    if NoteHit == true then
        Nps = Nps - 2 * 4 -- math is funny
    end
end

function onUpdate()
 if hits < 1 and misses < 1 then
 setTextString('nps','NPS: 0')
else
 setTextString('nps','NPS: '..Nps)
end

  if Nps < 0 then
        Nps = 0
        NoteHit = false;
    end

    setTextString('accuracy','Accuracy: '..getProperty('ratingPercent') * 100)
    setTextString('misses','Misses: '..getProperty('songMisses'))
    setTextString('score','Score: '..getProperty('songScore'))
end

 function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        Nps = Nps + 1
        NoteHit = false;
    end
    ezTimer('drain', 1, function()
        NoteHit = true;
    end)
end

timers = {}

function ezTimer(tag, timer, callback) -- Better
    table.insert(timers,{tag, callback})
    runTimer(tag, timer)
end

function onTimerCompleted(tag)
    for k,v in pairs(timers) do
        if v[1] == tag then
            v[2]()
        end
    end
    if tag == 'zoomCamGameOut' then
        doTweenZoom('camGameZoom', 'camGame', 1, 0.2, 'linear')
    end
    if tag == 'zoomCamHUDOut' then
        doTweenZoom('CamHUDZoom', 'camHUD', 1, 0.2, 'linear')
    end
end

function onBeatHit()
    if curBeat % 4 == 0 then
        doTweenZoom('quickCamGameZoom', 'camGame', 1.15, 0.01, 'linear')
        doTweenZoom('quickCamHUDZoom', 'camHUD', 1.20, 0.01, 'linear')
        runTimer('zoomCamGameOut', 0.01)
        runTimer('zoomCamHUDOut', 0.01)
    end
end