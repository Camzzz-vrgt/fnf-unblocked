stepHitFuncs = { --a bunch of timed events, timed to steps
[5] = function()

end
}

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]() -- Executes function at curStep in stepHitFuncs
    end
end