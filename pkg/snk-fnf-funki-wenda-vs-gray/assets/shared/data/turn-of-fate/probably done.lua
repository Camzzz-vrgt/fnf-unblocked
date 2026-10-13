-- Table to store custom camera movements
local cameraMovements = {
    [2058] = {1250, 500, 1.3, "quadOut", 0.28}, -- Añadido zoom (último parámetro)
    [2075] = {800, 900, 0.4, "quadOut", 0.4},
    [2086] = {3000, 900, 0.6, "quadOut", 0.32},
    -- Agrega más si es necesario
}

local lastCameraX = nil
local lastCameraY = nil
local lastCameraZoom = nil
local isCameraMoving = false

function onStepHit()
    if cameraMovements[curStep] then
        local movement = cameraMovements[curStep]
        local x = movement[1]
        local y = movement[2]
        local duration = movement[3]
        local easing = movement[4] or "linear" -- Por defecto será "linear" si no se especifica
        local zoom = movement[5] or getProperty("defaultCamZoom") -- Por defecto el zoom del juego

        -- Guardar la posición y zoom actuales
        lastCameraX = x
        lastCameraY = y
        lastCameraZoom = zoom

        -- Hacer los Tweens para mover la cámara y cambiar el zoom
        doTweenX("cameraMoveX", "camGame.scroll", x, duration, easing)
        doTweenY("cameraMoveY", "camGame.scroll", y, duration, easing)
        doTweenZoom("cameraZoom", "camGame", zoom, duration, easing)

        -- Indicar que la cámara está en movimiento
        isCameraMoving = true

        -- Temporizador para finalizar el movimiento
        runTimer("cameraMovementComplete", duration)
    end
end

function onTimerCompleted(tag)
    if tag == "cameraMovementComplete" then
        isCameraMoving = false
    end
end

-- Asegurar que la cámara permanezca en su última posición y zoom
function onUpdate()
    if lastCameraX and lastCameraY and lastCameraZoom and not isCameraMoving then
        setProperty("camGame.scroll.x", lastCameraX)
        setProperty("camGame.scroll.y", lastCameraY)
        setProperty("camGame.zoom", lastCameraZoom)
    end
end
