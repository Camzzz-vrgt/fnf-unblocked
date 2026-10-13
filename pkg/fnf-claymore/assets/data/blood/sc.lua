local angleshit = 0.3;
local anglevar = 0.3;
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if difficulty == 5 then
		if curBeat < 3 then
			if curBeat > 240 then
				cameraShake('cam', '0.015', '0.1')
			end
		end
	end
end

function onBeatHit()
    if curBeat > 3 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*0)
        setProperty('camGame.angle',angleshit*0)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*10, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*10, crochet*0.001, 'linear')
    end
end