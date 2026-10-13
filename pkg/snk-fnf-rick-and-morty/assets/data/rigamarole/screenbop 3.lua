local angleshit = 1;
local anglevar = 1;
function onBeatHit()
    if curBeat > 332 and curBeat < 392 then
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
