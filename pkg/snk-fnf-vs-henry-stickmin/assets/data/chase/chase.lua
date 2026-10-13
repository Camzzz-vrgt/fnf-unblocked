

function onCreate()

setProperty('gf.alpha', 0)

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead'); 
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); 
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'henry_game_over_theme');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'HenryWeekRetry');
setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin' Vs Henry Stickmin - [Chase]")

    makeLuaSprite('white', '', -200, -170);
	makeGraphic('white', 2340, 1890, 'FFFFFF')
	setProperty('white.alpha', 0);
	addLuaSprite('white', true);

	makeLuaSprite('black', 'black', 0.1, 0);
	setProperty('black.alpha', 0);
   setObjectCamera('black', 'other')
	addLuaSprite('black', true);
end

local FG_ColorOne = 'EDEDED' 
local FG_ColorTwo = '3CC4DB'

local xx = 0;
local yy = 0;

local ofs = 28;

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function getCharacterCamPos(char)
    local x = getMidpointX(char)
    local y = getMidpointY(char)

    if char == 'dad' then
        x = 650
        y = 390
    elseif char == 'boyfriend' then
        x = 890
        y = 510
    end

    -- idk, this is just magic!!!!
    local gayX = getProperty('camFollow.x')
    local gayY = getProperty('camFollow.y')
    if not gayX == x then x = x + gayX - x end
    if not gayY == x then y = y + gayY - y end

    return x, y
end

function onUpdate()
    if not inGameOver then
        if mustHitSection then
            if gfSection then
                check('gf')
            else
                check('boyfriend')
            end
        else
            check('dad')
        end
    end
end

function check(char)
    if not getProperty(char .. '.stunned') then
        local name = getProperty(char .. '.animation.curAnim.name');
        xx, yy = getCharacterCamPos(char)

        if string.starts(name, 'singLEFT') then
            triggerEvent('Camera Follow Pos', xx - ofs, yy)
        elseif string.starts(name, 'singRIGHT') then
            triggerEvent('Camera Follow Pos', xx + ofs, yy)
        elseif string.starts(name, 'singUP') then
            triggerEvent('Camera Follow Pos', xx, yy - ofs)
        elseif string.starts(name, 'singDOWN') then
            triggerEvent('Camera Follow Pos', xx, yy + ofs)
        elseif string.starts(name, 'idle') then
            triggerEvent('Camera Follow Pos', xx, yy)
        end
    end
end

local BarColorState = 1
function onBeatHit()
	ColorArray={FG_ColorTwo, FG_ColorTwo, FG_ColorOne, FG_ColorOne}
	BarColorState = BarColorState+1
	
	if BarColorState > 4 then
		BarColorState=1
	end
	
	setProperty('timeBar.color', getColorFromHex(ColorArray[BarColorState]))
	

if getProperty('curBeat') == 63 then
doTweenZoom('zoomin', 'camGame', 0.60, 1, 'elasticInOut')
end

if getProperty('curBeat') == 64 then
setProperty('defaultCamZoom', 0.6)
end

if getProperty('curBeat') == 128 then
setProperty('defaultCamZoom', 0.8)
setProperty('cameraSpeed', 3)
end

if getProperty('curBeat') == 188 then
doTweenZoom('zoomin', 'camGame', 0.60, 3, 'elasticInOut')
end

if getProperty('curBeat') == 192 then
setProperty('defaultCamZoom', 0.6)
end

if getProperty('curBeat') == 256 then
doTweenAlpha('Dark', 'black', 0.50, 1, 'cubeInOut')
setProperty('defaultCamZoom', 0.9)
setProperty('cameraSpeed', 1)
end

if getProperty('curBeat') == 288 then
setProperty('defaultCamZoom', 0.7)
end

if getProperty('curBeat') == 316 then
setProperty('defaultCamZoom', 1)
end

if getProperty('curBeat') == 318 then
doTweenZoom('zoomin', 'camGame', 0.60, 3, 'cubeInOut')
end

if getProperty('curBeat') == 320 then
setProperty('cameraSpeed', 3)
doTweenAlpha('Dark', 'black', 0, 1, 'cubeInOut')
setProperty('defaultCamZoom', 0.6)
end
end

