function onStepHit()

if curStep == 824 then
setProperty("dad.alpha", 1)
doTweenAlpha('iconP2', 'iconP2', 1, 1, 'linear')
end
end
function onCreatePost()
    setProperty("iconP2.alpha", 0)
    setProperty("dad.alpha", 0)
    setProperty("health",getProperty('health') +2)
    end