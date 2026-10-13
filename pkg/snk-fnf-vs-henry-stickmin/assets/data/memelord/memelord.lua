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
		startDialogue('dialogue', 'ellieDialogue');
	end

	if tag == 'HeyZoomOut' then
setProperty('defaultCamZoom', 0.7)
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
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'ellie_game_over_theme');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'EllieWeekRetry');
setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin' Vs Henry Stickmin - [Memelord]")

    makeLuaSprite('white', '', -700, -270);
	makeGraphic('white', 3000, 1500, 'FFFFFF')
	setProperty('white.alpha', 0);
	addLuaSprite('white', true);

    makeLuaSprite('spunch', 'ellie/spunch', 300, 50);
	setProperty('spunch.alpha', 0);
        setObjectCamera('spunch', 'Hud');
        setObjectOrder('spunch', 1);
	addLuaSprite('spunch', true);


end

local FG_ColorOne = 'e40d38' 
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
        y = 620
    elseif char == 'boyfriend' then
        x = 1090
        y = 710
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

if curBeat % 2 == 0 then
	objectPlayAnimation('henry', 'henryfirst', true);
end

if getProperty('curBeat') == 2 then	
 doTweenZoom('StartZoom', 'camGame', 0.70, 1.20, 'cubeInOut')
end

if getProperty('curBeat') == 35 then	
setProperty('spunch.alpha', 1)
 doTweenAlpha('spunchAlpha', 'spunch', 0, 1, 'cubeInOut')
end

if getProperty('curBeat') == 100 then	
      setProperty('defaultCamZoom', 0.8)
end


if getProperty('curBeat') == 162 then	
 doTweenZoom('StartZoom', 'camGame', 0.70, 1.20, 'cubeInOut')
end

if getProperty('curBeat') == 163 then	
setProperty('spunch.alpha', 1)
 doTweenAlpha('spunchAlpha', 'spunch', 0, 1, 'cubeInOut')
end

if getProperty('curBeat') == 164 then	
      setProperty('defaultCamZoom', 0.7)
end

if getProperty('curBeat') == 167 then
      setProperty('defaultCamZoom', 1)
runTimer('HeyZoomOut', 0.10)
end

if getProperty('curBeat') == 175 then
setProperty('defaultCamZoom', 1)
runTimer('HeyZoomOut', 0.10)
end

if getProperty('curBeat') == 195 then	
noteTweenAngle("EllieNote1", 0, 360, 1, "cubeInOut")
noteTweenAngle("EllieNote2", 1, 360, 1.10, "cubeInOut")
noteTweenAngle("EllieNote3", 2, 360, 1.15, "cubeInOut")
noteTweenAngle("EllieNote4", 3, 360, 1.20, "cubeInOut")
noteTweenAngle("BFNote1", 4, 360, 1.25, "cubeInOut")
noteTweenAngle("BFNote2", 5, 360, 1.30, "cubeInOut")
noteTweenAngle("BFNote3", 6, 360, 1.35, "cubeInOut")
noteTweenAngle("BFNote4", 7, 360, 1.40, "cubeInOut")
end

if getProperty('curBeat') == 196 then	
      setProperty('defaultCamZoom', 0.8)
end


if getProperty('curBeat') == 227 then	
 doTweenZoom('StartZoom', 'camGame', 0.70, 1.20, 'cubeInOut')
end

if getProperty('curBeat') == 228 then	
      setProperty('defaultCamZoom', 0.7)
end

if getProperty('curBeat') == 331 then	
setProperty('spunch.alpha', 1)
 doTweenAlpha('spunchAlpha', 'spunch', 0, 1, 'cubeInOut')
end
end
