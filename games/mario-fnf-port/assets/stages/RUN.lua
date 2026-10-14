function onMoveCamera(focus)
    if focus == 'boyfriend' then
        setProperty('defaultCamZoom', 0.7)
    else if focus == 'dad' then
        setProperty('defaultCamZoom', 0.5)
    end
end
end
function onCreatePost()
setProperty("gf.visible", false)
end
function onCreate()
	
    makeAnimatedLuaSprite('evil','evil',-700, -350)
	addAnimationByPrefix('evil','evil','Evil',30,true)
    setObjectCamera('evil', 'camGame')
    scaleObject('evil', 1.5, 1.5)

    makeAnimatedLuaSprite('evil2','evil',300, 600)
	addAnimationByPrefix('evil2','evil','Evil',30,true)
    setObjectCamera('evil2', 'camGame')
    scaleObject('evil2', 3.5, 3.5)


    makeLuaSprite('yes', 'Looking to you', -250, -450)
	setLuaSpriteScrollFactor('yes', 1, 1)
	scaleObject('yes', 0.6, 0.6)

	makeLuaSprite('mount', 'Looking', -1250, -750)
	setLuaSpriteScrollFactor('mount', 1, 1)
	scaleObject('mount', 1, 1)

	makeLuaSprite('stagebackk', 'MFloor', -950, -70)
	setLuaSpriteScrollFactor('stagebackk', 1, 1)
	scaleObject('stagebackk', 0.7, 0.6)

    makeLuaSprite('stagefront', 'NFloor', -200, 200)
	setLuaSpriteScrollFactor('stagefront', 1, 1)
	scaleObject('stagefront', 0.5, 0.3)

    
    
    makeLuaSprite('Movie', 'Movie', 0, -45)
	setLuaSpriteScrollFactor('Movie', 1, 1)
	scaleObject('Movie', 2, 0.9)
    setObjectCamera('Movie', 'camHUD')


    addLuaSprite('evil', false)
    addLuaSprite('yes', false)

    addLuaSprite('stagefront', false)
    addLuaSprite('mount', false)
    addLuaSprite('evil2', false)

 

    addLuaSprite('stagebackk', false)

    addLuaSprite('Movie', false)

    
    
end

local xx = 420;
local yy = 270;
local xx2 = 900;
local yy2 = 670;
local ofs = 100;
local followchars = true;

function onUpdate(elapsed)
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.5)
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
            setProperty('defaultCamZoom',0.8)
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
