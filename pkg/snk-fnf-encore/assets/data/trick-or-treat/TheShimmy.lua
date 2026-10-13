local angleshit = 1;
local anglevar = 1;
function onBeatHit()
    if curBeat > 68 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
    end
if curBeat > 99 then
        setProperty('camHUD.angle',0)
        setProperty('camGame.angle',0)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.000, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*0, crochet*0.000, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.000, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*0, crochet*0.000, 'linear')
    end

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.5 then
            setProperty('health', health- 0.008);
            end
        end
    end
end