local camTilted = false

function onUpdate()
    if keyJustPressed('left') then
        triggerCameraTween(-2,-0.5)
        camTilted = true
    elseif keyJustPressed('right') then
        triggerCameraTween(2,0.5)
        camTilted = true
    elseif keyJustPressed('up') or keyJustPressed('down') then
        if camTilted then
            resetCameraTween()
            camTilted = false
        end
    end
end

function triggerCameraTween(angle1,angle2)
    doTweenAngle('camGameTilt', 'camGame', angle1, 0.1, 'sineInOut')
    doTweenAngle('camHUDTilt', 'camHUD', angle2, 0.1, 'sineInOut')
end

function resetCameraTween()
    doTweenAngle('camGameReset', 'camGame', 0, 0.3, 'sineInOut')
    doTweenAngle('camHUDReset', 'camHUD', 0, 0.3, 'sineInOut')
end
