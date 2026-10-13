local xx = 1100;
local yy = 700;
local xx2 = 1400;
local yy2 = 730;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;


function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
	local ofs = 60;
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
	local ofs = 50;
              if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            if getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            end

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
	local ofs = 50;
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
	local ofs = 50;
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
	local ofs = 50;
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
	local ofs = 20;
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end

            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
	local ofs = 50;
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
	local ofs = 50;
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
	local ofs = 50;
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then --   
        	local ofs = 20;
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
        end
else
        triggerEvent('Camera Follow Pos','','')
    end
    
end


function onCreate()
	-- background shit
	makeLuaSprite('BG1', 'BG1', -530, -280);
	setScrollFactor('BG1', 1,1);

	makeLuaSprite('BG2', 'BG2', -530, -280);
	setScrollFactor('BG2', 1,1);
	setProperty('BG2.visible', false);
	
	makeLuaSprite('Light', 'add', -530, -280);
	setScrollFactor('Light', 1,1);
	setBlendMode('Light', 'add');

	makeLuaSprite('shadow', 'mult', -530, -280);
	setScrollFactor('shadow', 1,1);
	setBlendMode('shadow', 'multiply');

	addLuaSprite('BG1', false);
	addLuaSprite('BG2', false);
	addLuaSprite('shadow', true);
	addLuaSprite('Light', true)
	
end
function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == 'changebg2' then
			setProperty('stageback.visible', false);
			setProperty('stagefront.visible', false);
			setProperty('stageback2.visible', true);
		
		end

		if value1 == 'changebg1' then
	        	setProperty('BG2.visible', true);
			setProperty('BG1.visible', false);
		end
	end
end

function onStepHit()

    if (curStep == 1539) then
    doTweenX('gf.x','gf',200,1,'linear')
    doTweenY('gf.y','gf',380,1,'linear')
end

    if (curStep == 1546) then
		doTweenAngle('screm', 'dad' , 34400, 10, linear)
		onTweenCompleted('screm')
end

end
	
