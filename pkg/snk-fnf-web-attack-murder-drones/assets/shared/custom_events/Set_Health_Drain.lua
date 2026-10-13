local drainin = false
local healthDrain = 0.030
local health

function onEvent(n, v1, v2)
    if n == 'Set_Health_Drain' then
        healthDrain = tonumber(v2)
        
        if v1 == 'true' then
            drainin = true
        end
        if v1 == 'false' then
            drainin = false
        end

        
    end
end

function opponentNoteHit()
    if drainin == true then
        health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health - healthDrain);
        end
    end
end


--idea
--value 1 activar, desactivar
--value 2, constante, solo al tocar