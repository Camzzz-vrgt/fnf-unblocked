
function onCreatePost()
    triggerEvent('Camera Follow Pos',600,500)
    setProperty('camGame.zoom',0.7)

    makeLuaSprite('red','', 0, 0);
    makeGraphic('red',1290,720,'AA0000')
    addLuaSprite('red')
    setObjectCamera('red','hud')
    setProperty("red.alpha", 0)

    if getRandomInt(1,2) == 1 then
        setBlendMode('red','add')
    else
        setBlendMode('red','MULTIPLY')
    end

    setObjectOrder('red',1)
end
function onSongStart()
    triggerEvent('Camera Follow Pos') 
    doTweenZoom('camz','camGame',getProperty('defaultCamZoom'),1,'circInOut')
end

function onBeatHit()
    if (curBeat >= 64 and curBeat < 126) or (curBeat >= 160 and curBeat < 356) then
        if curBeat % 8 == 0 then
            setProperty("red.alpha", 1)
            cancelTween("red_twn")
            doTweenAlpha("red_twn", "red", 0, 0.5)
        end
    end
    if curBeat >= 64 and curBeat < 128 then
        triggerEvent('Add Camera Zoom',0.02,0)
    end
    if curBeat >= 128 and curBeat < 160 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom',0.02,0)
        elseif curBeat % 2 == 1 then
            --triggerEvent('Add Camera Zoom',0.02,0)
        end
    end
    if curBeat >= 160 and curBeat < 288 then
        triggerEvent('Add Camera Zoom',0.02,0)
    end
    if curBeat >= 288 and curBeat < 352 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom',0.02,0)
        elseif curBeat % 2 == 1 then
            --triggerEvent('Add Camera Zoom',0.02,0)
        end
    end
end

function alphahud(yep,yea)
    if not hideHud then
        doTweenAlpha('1', 'healthBar', yep, yea, 'linear')
        doTweenAlpha('2', 'healthBarBG', yep, yea, 'linear')
        doTweenAlpha('3', 'iconP1', yep, yea, 'linear')
        doTweenAlpha('4', 'iconP2', yep, yea, 'linear')
        if not botPlay then
            doTweenAlpha('5', 'scoreTxt', yep, yea, 'linear')
        end
    end
end
