local moveCamStop = true

function onCreatePost()
    makeLuaSprite("racism")
    makeGraphic("racism", screenWidth, screenHeight, "000000")
    setObjectCamera("racism", "hud")
    screenCenter("racism", "xy")
    addLuaSprite("racism", true)

    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
    end
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes', i, 'x', screenWidth + 128)
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.8)
    end
end

function onUpdate(elapsed)
    if botPlay then
        screenCenter("botplayTxt", 'xy')
    end
end

function onSongStart()
    for i = 0, 3 do
        j = i + 4
        noteTweenX("introTweenNoteX"..j, j, _G["defaultPlayerStrumX"..i] - 320, (240/curBpm)/playbackRate, "cubeOut")
        noteTweenAngle("introTweenNoteA"..j, j, -360, (240/curBpm)/playbackRate, "cubeOut")
    end
end

function onSectionHit()
    if curSection == 4 then
        doTweenAlpha("racismTween", "racism", 0, (480/curBpm)/playbackRate, "linear")
        moveCamStop = false
    end
    if curSection == 48 then
        moveCamStop = true
    end
    if curSection == 81 then
        setProperty('racism.alpha', 1)
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
    end
end

function onMoveCamera(c)
    if moveCamStop then
        -- debugPrint("Nothing should happen.")
    else
        -- debugPrint(c.." should be zoom target.")
        if c == "dad" then
            triggerEvent("cameraZoom", 0.8, "false")
        elseif c == "boyfriend" then
            triggerEvent("cameraZoom", 1, "false")
        end
    end
end

function onEvent(e, val1, val2, strumTime)
    if e == "midPoint" then
       if val1 == "true" then
            moveCamStop = true
       else
            moveCamStop = false
       end
   end
   if e == "Camera Follow Pos" then
       if val1 ~= "" then
            moveCamStop = true
       else
            camOverride = false
       end
    end
 end