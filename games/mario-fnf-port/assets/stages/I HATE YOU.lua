function onCreate()

    makeLuaSprite('box', 'item box', 566, 30)
	setLuaSpriteScrollFactor('box', 1, 1)
	scaleObject('box', 0.2, 0.2)
    setObjectCamera('box', 'camHUD')

    makeAnimatedLuaSprite('Fire','Fire',395, 290)
	addAnimationByPrefix('Fire','Fire','Fire',15,true)
    setObjectCamera('Fire', 'camGame')
    scaleObject('Fire', 0.8, 0.9)

    makeAnimatedLuaSprite('Fire2','Fire',1455, 290)
	addAnimationByPrefix('Fire2','Fire2','Fire',15,true)
    setObjectCamera('Fire2', 'camGame')
    scaleObject('Fire2', 0.8, 0.9)

    makeAnimatedLuaSprite('Fire3','Fire',2547, 290)
	addAnimationByPrefix('Fire3','Fire3','Fire',15,true)
    setObjectCamera('Fire3', 'camGame')
    scaleObject('Fire3', 0.8, 0.9)


    makeLuaSprite('Window', 'Window', -350, -100)
	setLuaSpriteScrollFactor('Window', 1, 1)
	scaleObject('Window', 1.5, 1.5)

    makeLuaSprite('Light', 'WindowLight', -350, -100)
	setLuaSpriteScrollFactor('Light', 1, 1)
	scaleObject('Light', 1.5, 1.5)

    
    makeLuaSprite('Floor', 'Wood', -350, 450)
	setLuaSpriteScrollFactor('Floor', 1, 1)
	scaleObject('Floor', 1.5, 0.9)

    makeLuaSprite('Flame', 'Wand', -350, -100)
	setLuaSpriteScrollFactor('Flame', 1, 1)
	scaleObject('Flame', 1.5, 1.5)

    makeLuaSprite('Lava', 'Lava', -350, -150)
	setLuaSpriteScrollFactor('Lava', 1, 1)
	scaleObject('Lava', 1.5, 1.5)

    makeLuaSprite('hate', 'hate', -480, -100)
	setLuaSpriteScrollFactor('hate', 1, 1)
	scaleObject('hate', 1, 1)


    addLuaSprite('Light', false)

    addLuaSprite('Window', false)

    addLuaSprite('hate', false)

    addLuaSprite('Flame', false)
    addLuaSprite('Fire', false)
    addLuaSprite('Fire2', false)
    addLuaSprite('Fire3', false)

    addLuaSprite('Lava', false)

    addLuaSprite('Floor', false)
    addLuaSprite('box', false)

    setProperty('hate.visible', false)

    


    addLuaSprite('HUD', false)
    addLuaSprite('Movie', false)

end
function onCreatePost()
    setProperty('gf.visible',false)
end

local xx = 1200;
local yy = 600;
local xx2 = 1900;
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
