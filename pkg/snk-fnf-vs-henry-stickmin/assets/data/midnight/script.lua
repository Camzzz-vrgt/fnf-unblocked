local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'henryDialogue');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead'); 
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); 
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'henry_game_over_theme');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'HenryWeekRetry');

	makeLuaSprite('midnight', 'midnight', -830, -300);
	setProperty('midnight.alpha', 1);
   setObjectCamera('midnight', 'game')
	addLuaSprite('midnight', true);

	makeLuaSprite('black', 'black', 0.1, 0);
	setProperty('black.alpha', 1);
   setObjectCamera('black', 'other')
	addLuaSprite('black', true);

setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin' Vs Henry Stickmin - [Midnight]")
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
	
if getProperty('curBeat') == 3 then
doTweenZoom('zoomin', 'camGame', 0.85, 5, 'cubeInOut')
end

if getProperty('curBeat') == 68 then
setProperty('defaultCamZoom', 0.7)
end

if getProperty('curBeat') == 100 then
setProperty('defaultCamZoom', 0.8)
end

if getProperty('curBeat') == 102 then
setProperty('defaultCamZoom', 0.7)
end

if getProperty('curBeat') == 104 then
setProperty('defaultCamZoom', 0.9)
end

if getProperty('curBeat') == 106 then
setProperty('defaultCamZoom', 0.8)
end

if getProperty('curBeat') == 108 then
setProperty('defaultCamZoom', 0.7)
end

if getProperty('curBeat') == 139 then
setProperty('defaultCamZoom', 0.9)
end

if getProperty('curBeat') == 146 then
doTweenZoom('zoomout', 'camGame', 0.70, 5, 'cubeInOut')
end
end
