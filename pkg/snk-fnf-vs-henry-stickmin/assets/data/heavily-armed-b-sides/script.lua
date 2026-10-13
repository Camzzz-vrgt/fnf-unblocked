local allowCountdown = false
enabled = true;
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
		startDialogue('dialogue', 'charlesDialogue');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onCreatePost()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead'); 
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); 
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'CharlesWeekGameOver');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'CharlesWeekRetry');
setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin' Vs Henry Stickmin - [Heavily Armed - B-Side Remix]")
doTweenZoom('songintrothing', 'camGame', 0.70, 0.1, 'cubeInOut')

end

local FG_ColorOne = '74c95d' 
local FG_ColorTwo = 'e86acb'

local xx = 0;
local yy = 0;

local ofs = 35;

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function getCharacterCamPos(char)
    local x = getMidpointX(char)
    local y = getMidpointY(char)

if enabled == true then
    if char == 'dad' then
        x = 1100
        y = 450
    elseif char == 'boyfriend' then
        x = 1900
        y = 460
    end
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

if getProperty('curBeat') == 30 then	
noteTweenAngle('CharlesNoteLeft', '0', 360, 0.80, 'cubeInOut')
noteTweenAngle('CharlesNoteDown', '1', 360, 0.80, 'cubeInOut')
noteTweenAngle('CharlesNoteUp', '2', 360, 0.80, 'cubeInOut')
noteTweenAngle('CharlesNoteRight', '3', 360, 0.80, 'cubeInOut')
end

if getProperty('curBeat') == 34 then	
noteTweenAngle('BFNoteLeft', '4', 360, 0.80, 'cubeInOut')
noteTweenAngle('BFNoteDown', '5', 360, 0.80, 'cubeInOut')
noteTweenAngle('BFNoteUp', '6', 360, 0.80, 'cubeInOut')
noteTweenAngle('BFNoteRight', '7', 360, 0.80, 'cubeInOut')
doTweenZoom('songintrothing', 'camGame', 0.80, 0.30, 'cubeInOut')
end

if getProperty('curBeat') == 140 then	
setProperty('defaultCamZoom', 0.8)
end


if getProperty('curBeat') == 156 then	
setProperty('defaultCamZoom', 0.7)
end

if getProperty('curBeat') == 164 then	
noteTweenAngle('CharlesNoteLeft', '0', 360, 0.80, 'cubeInOut')
noteTweenAngle('CharlesNoteDown', '1', 360, 0.80, 'cubeInOut')
noteTweenAngle('CharlesNoteUp', '2', 360, 0.80, 'cubeInOut')
noteTweenAngle('CharlesNoteRight', '3', 360, 0.80, 'cubeInOut')
noteTweenAngle('BFNoteLeft', '4', 360, 0.80, 'cubeInOut')
noteTweenAngle('BFNoteDown', '5', 360, 0.80, 'cubeInOut')
noteTweenAngle('BFNoteUp', '6', 360, 0.80, 'cubeInOut')
noteTweenAngle('BFNoteRight', '7', 360, 0.80, 'cubeInOut')
end

if getProperty('curBeat') == 196 then	
setProperty('defaultCamZoom', 0.6)
end

if getProperty('curBeat') == 228 then	
doTweenZoom('WEGABAHHHH', 'camGame', 0.80, 2, 'cubeInOut')
end

if getProperty('curBeat') == 232 then	
setProperty('defaultCamZoom', 0.8)
end

if getProperty('curBeat') == 260 then	
setProperty('defaultCamZoom', 0.7)
setProperty('cameraSpeed', 1)
end

if getProperty('curBeat') == 324 then
doTweenZoom('UhOh', 'camGame', 1, 3, 'cubeInOut')
doTweenAlpha('camgoboom', 'camHUD', 0, 2, 'cubeInOut')
end

if getProperty('curBeat') == 328 then
setProperty('defaultCamZoom', 0.7)
setProperty('cameraSpeed', 2.40)
doTweenZoom('UhOh', 'camGame', 0.60, 1, 'cubeInOut')
doTweenAlpha('camgoboom', 'camHUD', 1, 1, 'cubeInOut')
end
end