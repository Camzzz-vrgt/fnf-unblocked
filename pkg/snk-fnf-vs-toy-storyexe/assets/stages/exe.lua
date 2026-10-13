function onStartCountdown()
    makeLuaSprite('coso', 'empty', 0, 0)
	makeGraphic('coso', 1400, 1100, '000000')
	setObjectCamera('coso', 'camOther')
    doTweenAlpha('fadeout', 'coso', 0, 5, 'linear')
	addLuaSprite('coso', true)
end  
function onCreatePost()
    makeLuaSprite('bg', 'woodyexe-bg-old/bg', -350, -200);
	scaleObject('bg', 2.4, 2.2);
    makeLuaSprite('bratzo', 'woodyexe-bg-old/brazoxd', -250, -200);
	scaleObject('bratzo', 1.2, 1.2);

	makeLuaSprite('papa', 'woodyexe-bg-old/papa', -300, -200);
	scaleObject('papa', 1.2, 1.2);


    
    makeLuaSprite('NIGGER', 'efects/black', -300, -200);
	scaleObject('NIGGER', 3.1, 3.1);
    setObjectCamera("NIGGER", 'camOther');

    makeLuaSprite('TV', 'efects/tele', -1, -40);
	scaleObject('TV', 1.51, 1.35);
    setObjectCamera("TV", 'camOther');

    addLuaSprite('bg', false);
    addLuaSprite('bratzo', false);
    addLuaSprite('papa', true);
    addLuaSprite('NIGGER', false);
    addLuaSprite('TV', false);

    setProperty('bratzo.visible', false);
    setProperty('papa.visible', false);
    setProperty('NIGGER.visible', true);
end    

local xx = 660;
local yy = 330;
local xx2 = 700;
local yy2 = 400;
local ofs = 18;
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
    for i=0,3 do
        noteTweenAlpha(i+0, i, 0.5, 0.01)
    end
end    
function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == 'normal' then
			setProperty('bratzo.visible', false);
	        setProperty('papa.visible', false);
		end	
		if value1 == 'dead' then

            setProperty('bratzo.visible', true);
	        setProperty('papa.visible', true);
		end	
	end
end		     
