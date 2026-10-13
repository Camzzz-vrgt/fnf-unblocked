local xx = 620;
local yy = 420;
local xx2 = 920; --8
local yy2 = 420;
local xx3 = 620;
local yy3 = 420;
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
    makeLuaSprite('BG', 'ruined/BG', -200, -330)
    scaleObject('BG', 3, 3);
    addLuaSprite('BG',  false)
    makeLuaSprite('F', 'ruined/fade', -200, -330)
    scaleObject('F', 2, 2);
    addLuaSprite('F',  false)
    makeLuaSprite('F2', 'ruined/fade2', 450, -400)
    scaleObject('F2', 2, 2);
    addLuaSprite('F2',  false)
    makeLuaSprite('B', 'ruined/black', -1900, -330)
    scaleObject('B', 3, 3);
    addLuaSprite('B',  true)
    makeLuaSprite('A', 'ruined/af', -1900, -330)
    scaleObject('A', 9, 9);
    addLuaSprite('A',  true)
    makeLuaSprite('P1', 'ruined/frontP', -690, -350)
    scaleObject('P1', .8, .8);
    setLuaSpriteScrollFactor('P1', 1.7, 1.7);
    addLuaSprite('P1',  true)
    makeLuaSprite('P2', 'ruined/middleP', 70, -450)
    scaleObject('P2', .6, .6);
    addLuaSprite('P2',  false)
    makeLuaSprite('P3', 'ruined/backP', 330, -100)
    scaleObject('P3', .5, .5);
    addLuaSprite('P3',  false)
    makeLuaSprite('S', 'ruined/stand', 480, 380)
    scaleObject('S', 1, 1);
    addLuaSprite('S',  false)
    makeLuaSprite('C', 'ruined/chest', 520, 250)
    scaleObject('C', 1, 1);
    addLuaSprite('C',  false)
end
function onStepHit()
    if curStep == 96 then
		doTweenX('GF', 'gf', 200, 2, 'linear'); -- Makes matt move to the right lol (ushear)
    end
    if curStep == 842 then
		doTweenX('GF', 'gf', 2000, 2, 'linear');
    end
    if curStep == 880 then
        setProperty('gf.flipX', true); 
    end
    if curStep == 880 then
		doTweenX('GF', 'gf', -1000, 2, 'linear');
    end
    if curStep == 908 then
		doTweenX('GF', 'gf', 2000, 2, 'linear');
    end
    if curStep == 900 then
        setProperty('gf.flipX', false); 
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