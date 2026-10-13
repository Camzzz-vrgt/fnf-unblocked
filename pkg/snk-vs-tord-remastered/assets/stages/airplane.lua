local xx = 300;
local yy = 610;
local xx2 = 670;
local yy2 = 690;
local ofs = 25;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
    makeLuaSprite('Sky', 'airplane/sky_leader', -2000, -300)
    addLuaSprite('Sky',  false)
    scaleObject('Sky', 2.1, 2.1);

    makeLuaSprite('base', 'airplane/base', -1150, -900)
    addLuaSprite('base',  false)
    scaleObject('base', 1.5, 1.2);
	setScrollFactor('base', 1, 1);

    makeLuaSprite('Clouds', 'airplane/clouds', 1000, -2300)
    addLuaSprite('Clouds', false)
    scaleObject('Clouds', 1, 1);

    makeLuaSprite('Clouds2', 'airplane/clouds', 2400, -300)
    addLuaSprite('Clouds2', false)
    scaleObject('Clouds2', 1, 1);

    makeLuaSprite('Clouds3', 'airplane/clouds', 500, -2100)
    addLuaSprite('Clouds3', false)
    scaleObject('Clouds3', 1.4, 1.4);

    makeAnimatedLuaSprite('clo', 'airplane/clo', -5000, -300);
	setScrollFactor('clo', 1, 1);
	luaSpriteAddAnimationByPrefix('clo', 'idle', 'a', 24, true);
	scaleObject('clo', 1.1, 1.1);
	setProperty('clo.alpha', 0);
    addLuaSprite('clo', false);

    makeAnimatedLuaSprite('Plane', 'airplane/plane', -2125, -500)
    luaSpriteAddAnimationByPrefix('Plane', 'idle', 'planeFULL', 24, true);
    addLuaSprite('Plane', false)
    scaleObject('Plane', 2.1, 2.1);
end

function onStepHit()
    if curStep == 512 then
		doTweenY('CloudsTweenY', 'Clouds', 6000, 10, 'linear'); -- Makes the first cloud move down
    end
    if curStep == 512 then
		doTweenX('CloudsTweenX', 'Clouds', -6000, 10, 'linear'); -- Makes the first cloud move down
    end
    if curStep == 512 then
		doTweenY('BaseY', 'base', 800, 3, 'linear'); -- Makes the base go down
    end
    if curStep == 513 then
		doTweenX('BaseX', 'base', -2000, 3, 'linear'); -- Makes the base go to side
    end
    if curStep == 576 then
	setProperty('clo.alpha', 1); -- Alpha 1 makes the moving clouds visible
    end
end
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