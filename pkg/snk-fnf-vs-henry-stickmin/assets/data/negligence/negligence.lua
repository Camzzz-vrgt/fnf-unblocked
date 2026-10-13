
local allowCountdown = false
local farewell = true
local mfw = true
local coolctuscene = true
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

function onEndSong()
	if isStoryMode then
		if coolctuscene then
            mfw = false;
            triggerEvent('Camera Follow Pos', 700, 500)
            doTweenAlpha("ok", "camHUD", 0, 0.5, "expoOut")
            characterPlayAnim('dad','claw',true)
            setProperty('dad.specialAnim', true)
            playSound('dave')
            runTimer('herewego', 5)
            runTimer('uhoh', 9)
            coolctuscene = false;
            return Function_Stop;
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'daveDialogue');
	end

    if tag == 'herewego' then
        doTweenAlpha("lifeispurepainandagony", "camGame", 0, 0.7, "expoOut")
        triggerEvent('Camera Follow Pos', 700, 500)
    end

    if tag == 'uhoh' then
        setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin' Vs Henry Stickmin - [???]")
        startVideo('farewell');
        farewell = false;
    end

	if tag == 'ending' then
	return Function_Continue;
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
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'dave_game_over_theme');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'DaveWeekRetry');
setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin' Vs Henry Stickmin - [Negligence]")

	setProperty('Stuff.alpha', 0);
	setProperty('Inside.alpha', 0);

    makeLuaSprite('midnight', 'midnight', -830, -400);
	setProperty('midnight.alpha', 1);
   setObjectCamera('midnight', 'game')
	addLuaSprite('midnight', true);

    makeLuaSprite('black', 'black', 0.1, 0);
	setProperty('black.alpha', 1);
   setObjectCamera('black', 'other')
	addLuaSprite('black', true);

    makeLuaSprite('white', '', -200, -170);
	makeGraphic('white', 2340, 1890, 'FFFFFF')
	setProperty('white.alpha', 0);
	addLuaSprite('white', true);

	setProperty('Outside.alpha', 1);
	setProperty('boyfriend.x', 980);
	setProperty('defaultCamZoom', 0.5);
end

local FG_ColorOne = '2d3351' 
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
    if not getProperty(char .. '.stunned') and mfw then
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
	

if getProperty('curBeat') == 29 then
doTweenZoom('beginzoom', 'camGame', 0.70, 2, 'cubeInOut')
end

if getProperty('curBeat') == 31 then
setProperty('cameraSpeed', 1.70)
setProperty('defaultCamZoom', 0.7)
end

if getProperty('curBeat') == 64 then
setProperty('defaultCamZoom', 0.6)
end

if getProperty('curBeat') == 160 then
doTweenZoom('ZoomIn', 'camGame', 0.80, 2, 'cubeInOut')
setProperty('cameraSpeed', 1)
end

if getProperty('curBeat') == 160 then
setProperty('defaultCamZoom', 0.8)
end


if getProperty('curBeat') == 222 then
doTweenZoom('ZoomIn', 'camGame', 0.70, 2, 'cubeInOut')
end

if getProperty('curBeat') == 224 then
setProperty('defaultCamZoom', 0.7)
setProperty('cameraSpeed', 1.20)
end

if getProperty('curBeat') == 256 then
setProperty('defaultCamZoom', 0.9)
setProperty('cameraSpeed', 2)
end

if getProperty('curBeat') == 324 then
    setProperty('defaultCamZoom', 0.7)
    setProperty('cameraSpeed', 1)
    end

end
