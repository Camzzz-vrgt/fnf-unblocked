local xx = 900;
local yy = 500;
local xx2 = 1100;
local yy2 = 500;
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
	makeLuaSprite('theSky', 'tord/aftermatch/sky', -1900, -400);
	addLuaSprite('theSky', false);

	makeLuaSprite('theGround', 'tord/aftermatch/ground', -1900, 600);
	addLuaSprite('theGround', false);

	makeAnimatedLuaSprite('T', 'final/tom', 1497, 242);
	luaSpriteAddAnimationByPrefix('T', 'tom idle', 'tom idle', 24, true);

	makeAnimatedLuaSprite('M', 'final/mattz', 900, 250);
	luaSpriteAddAnimationByPrefix('M', 'matt idle', 'matt idle', 24, true);
    setProperty('M.flipX', true)

	makeAnimatedLuaSprite('E', 'final/edd', -100, 300);
	luaSpriteAddAnimationByPrefix('E', 'edd idle', 'edd', 24, true);

	makeAnimatedLuaSprite('TO', 'final/tord', 200, 200);
	luaSpriteAddAnimationByPrefix('TO', 'tord idle', 'tord idle', 24, true);
	setProperty('TO.alpha', 0);

	makeAnimatedLuaSprite('TD', 'final/torddrip_assets', 512, 277);
	luaSpriteAddAnimationByPrefix('TD', 'tord idle', 'tord idle', 24, true);
	setProperty('TD.alpha', 0);
    
    addLuaSprite('Sky',  false)
    addLuaSprite('BG',  false)
    addLuaSprite('T',  false)
    addLuaSprite('M',  false)
    addLuaSprite('TD',  false)
    addLuaSprite('E',  false)
    addLuaSprite('TO',  false)
end

function onStepHit()
    if curStep == 575 then
	setProperty('T.alpha', 0); -- tom idle invis
    end
    if curStep == 575 then
	setProperty('TD.alpha', 1); -- tom idle invis
    end
    if curStep == 640 then
	setProperty('T.alpha', 1); -- 
    end
    if curStep == 640 then
	setProperty('M.alpha', 0); -- 
    end
    if curStep == 960 then
	setProperty('M.alpha', 1); -- 
    end
    if curStep == 960 then
	setProperty('E.alpha', 0); -- 
    end
    if curStep == 1216 then
	setProperty('E.alpha', 1); -- 
    end
    if curStep == 1216 then
	setProperty('TD.alpha', 0); -- 
    end
    if curStep == 1663 then
	setProperty('TD.alpha', 1); -- 
    end
   if curStep == 1663 then
	setProperty('T.alpha', 0); -- tom idle invis
    end
    if curStep == 1727 then
	setProperty('T.alpha', 1); -- 
    end
    if curStep == 1727 then
	setProperty('M.alpha', 0); -- 
    end
    if curStep == 2047 then
	setProperty('M.alpha', 1); -- 
    end
    if curStep == 2047 then
	setProperty('E.alpha', 0); -- heheheh Ushear codes everything >:}
    end
end
-- THEN MATT FROM WII SPORTS HE BE LIKE "BRING IN THE PENIS LIKE!!"
function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
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
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.017);
    end
end