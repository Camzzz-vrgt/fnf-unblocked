function onCreate()
    setProperty('skipCountdown', true)
    
    setProperty('camHUD.alpha', 0)

    makeLuaSprite('white', nil, -100, -100)
    makeGraphic('white', screenWidth + 1000, screenHeight + 1000, 'FFFFFF')
    setScrollFactor("white", 0.0, 0.0)
    addLuaSprite('white', true)
    setProperty('white.alpha', 0)

    makeLuaSprite('black', nil, -100, -100)
    makeGraphic('black', screenWidth + 1000, screenHeight + 1000, '000000')
    setScrollFactor("black", 0.0, 0.0)
    addLuaSprite('black', true)

    makeLuaSprite('red', nil, -100, -100)
    makeGraphic('red', screenWidth + 1000, screenHeight + 1000, 'FF0000')
    setScrollFactor("red", 0.0, 0.0)
    addLuaSprite('red', true)
    setProperty('red.alpha', 0)
end

function onSongStart()
    doTweenAlpha('blTw', 'black', 0, 5.5, 'linear')
end

---
--- @param elapsed float
---
function onUpdate(elapsed)
    if curBeat == 32 then
        doTweenAlpha("blTw1", "black", 1, 0.00001, "linear")
        if flashingLights == true then
            setProperty('red.alpha', 1)
            doTweenAlpha("rdTw", "red", 0, 1.5, "linear")
            setProperty('white.alpha', 1)
        end
        doTweenAlpha('cHTw', "camhud", 1, 4, "linear")
    elseif curBeat == 40 then
        doTweenAlpha("blTw2", "black", 0, 0.000001, "linear")
        if flashingLights == true then
            doTweenAlpha("wtTw", "white", 0, 0.2, "linear")
        end
    end
end