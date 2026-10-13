function onCreate()
    makeLuaSprite("white", "", 0, 0)
    makeGraphic("white", 3000, 3000, "FFFFFF")
    setObjectCamera("white", 'other')
    addLuaSprite("white", true)
    setProperty('white.alpha', 0)

    makeLuaSprite('gun', 'bg/npcs/gun', -700, 250)
    addLuaSprite('gun', false)
	scaleObject('gun', 0.3, 0.3)
end

function onBeatHit()
    if curBeat == 125 then
        doTweenX('move', 'gun', 600, 5, 'quadInOut')
    elseif curBeat == 133 then
        setProperty('white.alpha', 1)
        doTweenAlpha('flashfade', 'white', 0, 0.5, 'easeIn')
    end
end