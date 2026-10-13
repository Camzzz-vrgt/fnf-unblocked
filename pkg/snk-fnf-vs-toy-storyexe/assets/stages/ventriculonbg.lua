function onStartCountdown()
    makeLuaSprite('coso', 'empty', 0, 0)
	makeGraphic('coso', 1400, 1100, '000000')
	setObjectCamera('coso', 'camOther')
    doTweenAlpha('fadeout', 'coso', 0, 5, 'linear')
	addLuaSprite('coso', true)
end  
function onCreatePost()
    scale=0.8
    ekis=-700
    ye=-850
    makeLuaSprite('bg', 'ventriculon/7_sin_titulo_20230615174656', -700, -850);
	scaleObject('bg', 0.8, 0.8);
    addLuaSprite('bg')

    makeLuaSprite('piso', 'ventriculon/7_sin_titulo_20230615174710', -700, -850);
	scaleObject('piso', 0.8, 0.8);
    addLuaSprite('piso')

    makeLuaSprite('luzekisde', 'ventriculon/luz', -700, -850);
    setObjectCamera('luzekisde','camOther')
	scaleObject('luzekisde', 0.8, 0.8);
    addLuaSprite('luzekisde')

end    

local xx = 660;
local yy = 390;
local xx2 = 850;
local yy2 = 500;
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
    for i=0,7 do
        noteTweenAlpha(i+0, i, 0.7, 1)
    end 
   

end