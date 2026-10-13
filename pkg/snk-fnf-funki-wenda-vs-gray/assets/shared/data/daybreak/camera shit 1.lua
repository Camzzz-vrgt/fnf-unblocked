-- Variables to define the steps for zoom activation/deactivation
local ZoomStartOn = 400  -- Step when zoom begins
local ZoomEndOn = 656    -- Step when zoom ends

-- Zoom level variables
local zoomOpponent = 0.32  -- Zoom level when focused on opponent
local zoomPlayer = 0.45    -- Zoom level when focused on player

function onStepHit()
    -- Check if we've reached the start step
    if curStep == ZoomStartOn then
        -- Apply appropriate zoom based on current section
        if not mustHitSection then
            setProperty('defaultCamZoom', zoomOpponent)
        else
            setProperty('defaultCamZoom', zoomPlayer)
        end
    end
    
    -- Reset zoom when reaching end step
    if curStep == ZoomEndOn then
        setProperty('defaultCamZoom', zoomPlayer)
    end
end

-- Add camera movement update function for smoother transitions
function onUpdate()
    -- This ensures the camera follows section changes between start and end steps
    if curStep >= ZoomStartOn and curStep < ZoomEndOn then
        if not mustHitSection then
            setProperty('defaultCamZoom', zoomOpponent)
        else
            setProperty('defaultCamZoom', zoomPlayer)
        end
    end
end