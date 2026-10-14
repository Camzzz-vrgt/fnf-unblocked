function onStepHit()
    if curStep == 1 then
        setProperty("gf.alpha", 0)

    end
    if curStep == 1321 then
 
        doTweenAlpha('gf.alpha', 'gf', 1, 1, 'linear')
    end
    if curStep == 1568 then
 
        doTweenAlpha('gf.alpha', 'gf', 0, 1, 'linear')
    end
end