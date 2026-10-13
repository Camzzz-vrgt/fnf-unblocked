function onCreate()
    precacheImage('characters/selene delgado')
    precacheImage('characters/selene normal')
end

function onCreatePost()
    setProperty('scoreTxt.alpha', 0)
end

function onUpdate()

end

function onStepHit()
    if curStep >= 127 and curStep <= 2464 then
        doTweenAlpha('scoreAlpha','scoreTxt', 1, 0.5, "sineInOut")
    end

    if curStep == 1552 then
        setProperty("bg1.color", getColorFromHex("616161"))
    end

    if curStep == 1952 then
        setProperty("bg1.color", getColorFromHex("ff7a7a"))
    end

    if curStep == 2464 or curStep == 1680 then
        setProperty("bg1.color", getColorFromHex("ffffff"))
    end
end