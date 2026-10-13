local enableFollow = true;
local forceGF = false;

local xx = 720;
local yy = 400;

local xx2 = 1000;
local yy2 = 350;

local xx3 = 900;
local yy3 = 320;

local ofs = 15;
local ofs2 = 15;
local ofs3 = 15;

function onEvent(eventName, value1, value2)
    if eventName == 'Triggers Sleep Well' then
        if value1 == '2' then
            if value2 == '1' then
                xx = 600;
                yy = 150;

                ofs = 25;
                ofs2 = 25;
                ofs3 = 25;
            end

            if value2 == '2' then
                triggerEvent('Change Character','boyfriend','crafty')
                triggerEvent('Change Character','gf','dog')

                xx2 = 1200;
                yy2 = 350;
                
                xx3 = 1100;
                yy3 = 320;
            end

            if value2 == '5' then
                xx2 = 1000;
                yy2 = 350;
            end

            if value2 == '7' then
                enableFollow = false;
            end

            if value2 == '9' then

                xx = 720;
                yy = 200;

                xx2 = 1000;
                yy2 = 350;

                xx3 = 900;
                yy3 = 320;

                enableFollow = true;
            end
        end

        if value1 == 'force' then
            if value2 == 'gf' then
                forceGF = true;
            else
                forceGF = false;
            end
        end
    end
end

function onUpdate(elapsed)
    if enableFollow then
        follow()
    end
end

function follow()

    if gfSection == true  or forceGF then

        if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs3,yy3)
        end
        if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs3,yy3)
        end
        if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs3)
        end
        if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs3)
        end
        if getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
        end
    elseif mustHitSection == false then

            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'still' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
    else
            if enableZoom then
                setProperty('defaultCamZoom',bfzoom)
            end

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if shake then
        triggerEvent('Screen Shake','0.03, 0.02','0.1, 0.0015');
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if shake then
        triggerEvent('Screen Shake','0.03, 0.1','0.1, 0.0015');
    end
end

function fadeOtherElements(fade, duration)
    doTweenAlpha('fade1', 'lava', fade, duration, 'linear')
    doTweenAlpha('fade2', 'healthBar', fade, duration, 'linear')
    doTweenAlpha('fade3', 'health', fade, duration, 'linear')
    doTweenAlpha('fade4', 'iconP1', fade, duration, 'linear')
    doTweenAlpha('fade5', 'iconP2', fade, duration, 'linear')
end
