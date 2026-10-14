function onCreate()

	makeLuaSprite('wh', 'white', -500, -1500)
	setLuaSpriteScrollFactor('wh', 1, 1)
	scaleObject('wh', 5, 10)

	makeLuaSprite('stageback', 'glow', -950, -250)
	setLuaSpriteScrollFactor('stageback', 1, 1)
	scaleObject('stageback', 2, 2)

	makeLuaSprite('stagefront', 'town', -950, -250)
	setLuaSpriteScrollFactor('stagefront', 1, 1)
	scaleObject('stagefront', 2, 2)

	makeLuaSprite('Floor', 'hall', -950, -1100)
	setLuaSpriteScrollFactor('Floor', 1, 1)
	scaleObject('Floor', 2, 3)

    makeLuaSprite('Black', 'BigBlack', -105, 1)
	setLuaSpriteScrollFactor('Black', 1, 1)
	scaleObject('Black', 3, 1)
    setObjectCamera('Black', 'camHUD')


    makeLuaSprite('thx', 'thank', 0, 0)
	setLuaSpriteScrollFactor('thx', 1, 1)
	scaleObject('thx', 1, 1)
    setObjectCamera('thx', 'camHUD')

    makeLuaSprite('Black2', 'BigBlack', 890, 1)
	setLuaSpriteScrollFactor('Black2', 1, 1)
	scaleObject('Black2', 3, 1)
    setObjectCamera('Black2', 'camHUD')

    makeLuaSprite('Blackball', 'shaball', 0, 0)
	setLuaSpriteScrollFactor('Blackball', 1, 1)
	scaleObject('Blackball', 1, 1)
    setObjectCamera('Blackball', 'camOther')



    addLuaSprite('Black', false)
    addLuaSprite('Black2', false)
    addLuaSprite('Blackball', false)
    setProperty("thx.alpha", 0)
	
	addLuaSprite('stageback', false)
	addLuaSprite('stagefront', false)
    addLuaSprite('Floor', false)

    addLuaSprite('wh', true)
    setProperty('wh.visible', false)
    addLuaSprite('thx', true)    

end

local xx = 500;
local yy =  0;
local xx2 = 1350;
local yy2 = 1000;
local ofs = 60;
local followchars = true;

function onUpdate(elapsed)
    scaleObject('healthBar',1 ,1)
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.3)
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
            setProperty('defaultCamZoom',0.35)
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
