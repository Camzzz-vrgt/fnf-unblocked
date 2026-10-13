local oppx = 323;
local oppy = 175;
local bfx = 1157.5;
local bfy = 409;
local camoffs = 50;
local followchars = true;

function onUpdate()

   -- if keyJustPressed('space') == true then
   --     debugPrint(getProperty('camFollow.x'), ' ', getProperty('camFollow.y'))
   -- end

   if followchars == true then
       if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',oppx-camoffs,oppy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',oppx+camoffs,oppy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',oppx,oppy-camoffs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',oppx,oppy+camoffs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',oppx,oppy);
            end 
       else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',bfx-camoffs,bfy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',bfx+camoffs,bfy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',bfx,bfy-camoffs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',bfx,bfy+camoffs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',bfx,bfy);
            end
        end
   else
       triggerEvent('Camera Follow Pos','','');
   end
end