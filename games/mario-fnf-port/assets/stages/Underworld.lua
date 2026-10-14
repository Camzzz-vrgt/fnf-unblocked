function onCreate()


    makeLuaSprite('HUD', 'fmShade', 0, 0)
	setLuaSpriteScrollFactor('HUD', 1, 1)
	scaleObject('HUD', 1, 1)
    setObjectCamera('HUD', 'camOther')


    makeLuaSprite('FrontTree', 'Front tree', -250, -100)
	setLuaSpriteScrollFactor('FrontTree', 1.5, 1)
	scaleObject('FrontTree', 1.3, 1.3)

    makeLuaSprite('ForestTree', 'Forest tree', -250, -100)
	setLuaSpriteScrollFactor('ForestTree', 1.1, 1)
	scaleObject('ForestTree', 1.6, 2)

    
    makeLuaSprite('ForestFront', 'Forest front', -350, -100)
	setLuaSpriteScrollFactor('ForestFront', 1, 1)
	scaleObject('ForestFront', 1.3, 1.3)

    makeLuaSprite('ForestBack', 'Forest back', -350, -100)
	setLuaSpriteScrollFactor('ForestBack', 1.4, 1)
	scaleObject('ForestBack', 1.3, 1.3)



    addLuaSprite('ForestBack', false)

    addLuaSprite('FrontTree', true)

 

    addLuaSprite('ForestTree', false)

    addLuaSprite('ForestFront', false)

    addLuaSprite('HUD', true)

end
function onCreatePost()
    setProperty('gf.visible',false)
end

local xx = 900;
local yy = 600;
local xx2 = 1500;
local yy2 = 600;
local ofs = 30;
local followchars = true;

function onUpdate(elapsed)
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.55)
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
            setProperty('defaultCamZoom',0.55)
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
