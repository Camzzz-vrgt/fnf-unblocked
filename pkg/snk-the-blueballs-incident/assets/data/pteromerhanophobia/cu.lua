--yes i did use kade engine's modchart blah blah blah, my man until there isn't a proper tutorial i'm gonna use his and edit it >:(
    local hudX = 0
    local hudY = 0
    
    local fourStartX = 0
    local fiveStartX = 0
    local sixStartX = 0
    local sevenStartX = 0
    
    local swaying = false
    local move = false
    local saba = false
    
    local swayingForce = 1;
    local waitForBeat = false
    local waitForTween = false
    
    function start(song) 
        hudX = getHuxX()
        hudY = getHudY()
    end
    
    local power = 0
    
    local hudZoom = 0
    
    local spinCrazy = false
    local spin = false
    local spinUpFast = false
    
    local hit = false
    local directionMulti = 1
    local heightMulti = 1
    
    local direction = 2
    



       -- if curStep >= 256 and beat % 1 == 0 and curStep < 383 then
         --   setHudZoom(0.7)
           -- setCamZoom(0.7)		
            --tweenHudZoom(0.7,0.1)	
            --tweenCamZoom(0.7,0.1)			
       -- end

    
    
    

    
    
    function stepHit(step)

    
        if step == 1 then
            --camHudAngle = 5
        end

        if step > 1 and step < 1000 then
            --setCamZoom(2.4)
            camHudAngle = math.sin(step/2) * 5
            cameraAngle = math.sin(step/2) * 5
            
        end
        if step == 120 then
            setCamZoom(1)
        end
        if step == 130 then
            setCamZoom(1)
        end
        if step == 140 then
            setCamZoom(1)
        end
        if step == 150 then
            setCamZoom(1)
        end
    
    end
    
     function update (elapsed) 
        -- sway
        if spinCrazy then -- spinning crazy
            camHudAngle = 32 * math.sin(currentBeat * math.pi)
            if getHudX() < 320 then
                setHudPosition(getHudX() + 4, 32 * math.cos(currentBeat * math.pi))
            else
                setHudPosition(-640, 32 * math.cos(currentBeat * math.pi))
            end
        end
        
    end
    
