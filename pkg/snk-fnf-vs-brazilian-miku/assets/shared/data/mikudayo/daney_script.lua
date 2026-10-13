local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0
local xx = 700;
local yy = 400;
local xx2 = 1000;
local yy2 = 500;
-- local xx = 550;
-- local yy = 400;
-- local xx2 = 1000;
-- local yy2 = 500;
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;
local bit2 = false
local bit3 = false
local bit1 = false
function onCreate()
    precacheImage('brazil/FP/sky')
    precacheImage('brazil/FP/city')
    precacheImage('brazil/FP/floor')
    addCharacterToList('fp-miku-shaded', 'dad')

    makeLuaSprite('UpperBar', null, 0, -360)
    makeGraphic('UpperBar', 1380, 360, '000000')
    setObjectCamera('UpperBar', 'hud')
    addLuaSprite('UpperBar')
    setProperty('UpperBar.alpha', 1)

    --bar on: -240
    --bar off: -360
    --bar covering screen: 0
                            
    makeLuaSprite('LowerBar', 'empty', 0, 720)
    makeGraphic('LowerBar', 1380, 360, '000000')
    setObjectCamera('LowerBar', 'hud')
    addLuaSprite('LowerBar')
    setProperty('LowerBar.alpha', 1)
    --bar on: 600
    --bar off: 720
    --bar covering screen: 360
end
function onCreatePost()
    setProperty('cameraSpeed', 9999)

    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
end
function onBeatHit()
    if bit2 == true then
	    if curBeat % 2 == 0 then
	        triggerEvent('Add Camera Zoom','0.02','0.04')
	    end
	end
    if bit3 == true then
        if curBeat % 4 == 0 then
            triggerEvent('Add Camera Zoom','0.02','0.04')
        end
    end
    if bit1 == true then
        triggerEvent('Add Camera Zoom','0.02','0.04')
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
            if getProperty('dad.animation.curAnim.name') == 'danceLeft' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'danceRight' then
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'danceLeft' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'danceRight' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    if curStep == 2 then
        setProperty('cameraSpeed', 0.1)
        xx = 900
    end
    if curStep == 28 then
        doTweenAlpha('cam', 'camGame', 0, 0.4, 'cubeOut')
    end
    if curStep == 31 then
        setProperty('cameraSpeed', 9999)
        xx = 1150
        yy = 300
        setProperty('defaultCamZoom', 0.9)
    end
    if curStep == 32 then
        setProperty('cameraSpeed', 0.1)
        doTweenAlpha('cam', 'camGame', 1, 0.2, 'cubeOut')
        xx = 950
    end
    if curStep == 60 then
        doTweenAlpha('cam', 'camGame', 0, 0.4, 'cubeOut')
    end
    if curStep == 63 then
        setProperty('cameraSpeed', 9999)
        xx = 600
        yy = 400
        setProperty('defaultCamZoom', 0.8)
        setProperty('floor.alpha', 1)
        setProperty('fg.alpha', 1)
        setProperty('dad.alpha', 1)
        setProperty('boyfriend.alpha', 1)
        setProperty('gf.alpha', 1)
    end
    if curStep == 64 then
        setProperty('cameraSpeed', 0.1)
        doTweenAlpha('cam', 'camGame', 1, 0.2, 'cubeOut')
        xx = 900
    end
    if curStep == 92 then
        doTweenAlpha('cam', 'camGame', 0, 0.4, 'cubeOut')
    end
    if curStep == 95 then
        setProperty('cameraSpeed', 9999)
        xx = 800
        setProperty('defaultCamZoom', 0.8)
    end
    if curStep == 96 then
        setProperty('cameraSpeed', 0.1)
        doTweenAlpha('cam', 'camGame', 1, 0.2, 'cubeOut')
        doTweenZoom('zom', 'camGame', 0.6, 2, 'cubeOut')
        xx = 800
    end
    if curStep == 108 then
        doTweenAlpha('cam', 'camGame', 0, 0.4, 'cubeOut')
    end
    if curStep == 110 then
        setProperty('countDayo.alpha', 1)
        playAnim('countDayo', 'idle')
    end
    if curStep == 128 then
        setProperty('countDayo.alpha', 0)
        setProperty('cameraSpeed', 1)
        setProperty('white.alpha', 1)
        doTweenAlpha('flash', 'white', 0, 0.8, 'cubeOut')
        setProperty('camGame.alpha', 1)
        setProperty('camHUD.alpha', 1)
        setProperty('defaultCamZoom', 0.7)
        xx = 550
    end
    if curStep == 636 then
        doTweenColor('bf', 'boyfriend', '000000', 0.3, cubeOut)
        doTweenColor('gf', 'gf', '000000', 0.3, cubeOut)
        doTweenColor('dad', 'dad', '000000', 0.3, cubeOut)

        doTweenAlpha('i1', 'iconP1', 0, 0.3, 'cubeOut')
        doTweenAlpha('i2', 'iconP2', 0, 0.3, 'cubeOut')
        doTweenAlpha('hB', 'healthBar', 0, 0.3, 'cubeOut')
        doTweenAlpha('sTxt', 'scoreTxt', 0, 0.3, 'cubeOut')

        if not middlescroll then

            noteTweenAlpha('notaa0', 0, 0.6, 1, 'cubeOut')
            noteTweenAlpha('notaa1', 1, 0.6, 1, 'cubeOut')
            noteTweenAlpha('notaa2', 2, 0.6, 1, 'cubeOut')
            noteTweenAlpha('notaa3', 3, 0.6, 1, 'cubeOut')

            noteTweenX('notex4', 4, defaultPlayerStrumX0 - 320, 1, 'cubeOut')
            noteTweenX('notex5', 5, defaultPlayerStrumX1 - 320, 1, 'cubeOut')
            noteTweenX('notex6', 6, defaultPlayerStrumX2 - 320, 1, 'cubeOut')
            noteTweenX('notex7', 7, defaultPlayerStrumX3 - 320, 1, 'cubeOut')

            noteTweenX('notex2', 2, defaultPlayerStrumX2, 1, 'cubeOut')
            noteTweenX('notex3', 3, defaultPlayerStrumX3, 1, 'cubeOut')
        end

        doTweenY('CinematicUp', 'UpperBar', -280, 1, 'cubeOut')
        doTweenY('CinematicDown', 'LowerBar', 640, 1, 'cubeOut')
    end
    if curStep == 640 then
        setProperty('cameraSpeed', 9999)
        setProperty('white.alpha', 1)
        doTweenAlpha('flash', 'white', 0, 0.8, 'cubeOut')
        setProperty('whitebg.alpha', 0)

        xx = 550;
        yy = 400;
        xx2 = 550;
        yy2 = 400;
    end
    if curStep == 641 then
        setProperty('cameraSpeed', 1)
    end
    if curStep == 892 and not middlescroll then

        noteTweenAlpha('notaa0', 0, 1, 1, 'cubeOut')
        noteTweenAlpha('notaa1', 1, 1, 1, 'cubeOut')
        noteTweenAlpha('notaa2', 2, 1, 1, 'cubeOut')
        noteTweenAlpha('notaa3', 3, 1, 1, 'cubeOut')

        noteTweenX('notex4', 4, defaultPlayerStrumX0, 1, 'cubeOut')
        noteTweenX('notex5', 5, defaultPlayerStrumX1, 1, 'cubeOut')
        noteTweenX('notex6', 6, defaultPlayerStrumX2, 1, 'cubeOut')
        noteTweenX('notex7', 7, defaultPlayerStrumX3, 1, 'cubeOut')

        noteTweenX('notex2', 2, defaultOpponentStrumX2, 1, 'cubeOut')
        noteTweenX('notex3', 3, defaultOpponentStrumX3, 1, 'cubeOut')
    end
    if curStep == 896 then
        setProperty('white.alpha', 1)
        doTweenAlpha('flash', 'white', 0, 0.8, 'cubeOut')
        setProperty('gf.color', getColorFromHex('FFFFFF'))
        setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
        
        xx = 550;
        yy = 400;
        xx2 = 1000;
        yy2 = 500;
    end
    if curStep == 960 then
        setProperty('white.alpha', 1)
        doTweenAlpha('flash', 'white', 0, 0.8, 'cubeOut')

        setProperty('UpperBar.y', -360)
        setProperty('LowerBar.y', 720)

        setProperty('iconP1.alpha', 1)
        setProperty('iconP2.alpha', 1)
        setProperty('healthBar.alpha', 1)
        setProperty('scoreTxt.alpha', 1)
    end
end