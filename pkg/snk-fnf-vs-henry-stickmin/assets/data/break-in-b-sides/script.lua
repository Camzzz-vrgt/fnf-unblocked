local allowCountdown = false

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead'); 
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); 
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'henry_game_over_theme');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'HenryWeekRetry');

setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin' Vs Henry Stickmin - [Break In - B-Side Remix]")

    makeLuaSprite('white', '', -700, -270);
	makeGraphic('white', 3000, 1500, 'FFFFFF')
	setProperty('white.alpha', 0);
	addLuaSprite('white', true);

end

local FG_ColorOne = '00ffff' 
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
        x = 250
        y = 590
    elseif char == 'boyfriend' then
        x = 770
        y = 700
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

if getProperty('curBeat') == 6 then	
doTweenZoom('songintrothing', 'camGame', 0.70, 1, 'cubeInOut')
doTweenAlpha('FlashBang', 'white', 1, 1, 'cubeInOut')
end

if getProperty('curBeat') == 8 then	
doTweenAlpha('whitefade', 'white', 0, 0.40, 'cubeInOut')
doTweenZoom('CoolZoom', 'camGame', 0.80, 1, 'cubeInOut')
end

if getProperty('curBeat') == 71 then
doTweenZoom('CoolZoom', 'camGame', 0.80, 0.70, 'cubeInOut')
end

if getProperty('curBeat') == 72 then
setProperty('defaultCamZoom', 0.8)
end

if getProperty('curBeat') == 100 then
setProperty('defaultCamZoom', 0.9)
end

if getProperty('curBeat') == 102 then
doTweenZoom('CoolZoom', 'camGame', 0.70, 0.70, 'cubeInOut')
end

if getProperty('curBeat') == 104 then
setProperty('defaultCamZoom', 0.9)
end

if getProperty('curBeat') == 136 then
setProperty('defaultCamZoom', 0.8)
end

if getProperty('curBeat') == 168 then
setProperty('defaultCamZoom', 0.9)
end

if getProperty('curBeat') == 169 then
setProperty('defaultCamZoom', 0.7)
end
end
