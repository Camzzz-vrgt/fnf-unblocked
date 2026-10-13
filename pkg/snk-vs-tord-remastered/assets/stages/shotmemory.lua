local xx = 200;
local yy = 550;
local xx2 = 600;
local yy2 = 550;
local ofs = 25;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
	-- background shit
	makeLuaSprite('theSky', 'shotmemory/sky', -1900, -400);
	addLuaSprite('theSky', false);

	makeLuaSprite('buildings', 'shotmemory/buildings', -800, -200);
	addLuaSprite('buildings', false);

	makeLuaSprite('theGround', 'shotmemory/ground', -1500, 750);
	addLuaSprite('theGround', false);
    scaleObject('theGround', 2.1, 2.1);

	makeAnimatedLuaSprite('backcrowd', 'shotmemory/backcrowd', -900, 150);
	luaSpriteAddAnimationByPrefix('backcrowd', 'idle', 'crowd', 24, true);

	makeAnimatedLuaSprite('angeltord', 'shotmemory/angeltord', -400, 0);
	luaSpriteAddAnimationByPrefix('angeltord', 'idle', 'angelbitch', 24, true);

	makeAnimatedLuaSprite('frontcrowd', 'shotmemory/foregroundcrowd', -1200, 890);
	luaSpriteAddAnimationByPrefix('frontcrowd', 'idle', 'frontcrowd', 24, true);
	setLuaSpriteScrollFactor('frontcrowd', 1.5, 1.5);

	addLuaSprite('theSky',  false)
    addLuaSprite('buldings',  false)
    addLuaSprite('theGround',  false)
	addLuaSprite('backcrowd',  false)
    addLuaSprite('angeltord',  false)
	addLuaSprite('frontcrowd',  false)
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