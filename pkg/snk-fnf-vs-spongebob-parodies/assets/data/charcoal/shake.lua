function onUpdate()
--dad
    if curBeat > 96 then
    if mustHitSection == false then

        if getProperty('dad.animation.curAnim.name') == 'singUP' then
            	triggerEvent('Screen Shake','0.1,0.005','0.1,0.005')
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            	triggerEvent('Screen Shake','0.1,0.003','')
        end
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            	triggerEvent('Screen Shake','0.1,0.003','0.1,0.005')
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            	triggerEvent('Screen Shake','0.1,0.003','')
        end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Screen Shake','0.1,0.003','0.1,0.005')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Screen Shake','0.1,0.003','')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Screen Shake','0.1,0.005','0.1,0.005')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Screen Shake','0.1,0.003','')
            end
            end
            end
        end