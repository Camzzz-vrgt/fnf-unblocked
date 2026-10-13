local angleshit = 0.7;
local anglevar = 0.7;
function onBeatHit()
    if curBeat > 71 and curBeat < 200 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camGame.angle',angleshit*2)
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.001, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*4, crochet*0.001, 'linear')
    end
end
