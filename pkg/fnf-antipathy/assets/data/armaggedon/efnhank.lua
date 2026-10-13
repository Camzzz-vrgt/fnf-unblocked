-- script by ItsCapp don't steal, it's dumb

-- simply, offsets. they're the numbers in the top left of the character editor
idleoffsets = {'60', '2679'} -- I recommend you have your idle offset at 0
leftoffsets = {'180', '-1'}
downoffsets = {'-20', '-40'}
upoffsets = {'405', '263'}
rightoffsets = {'-64', '62'}

leftMissoffsets = {'0', '0'}  -- you probably won't need these if it's for the opponent
downMissoffsets = {'0', '0'}  --
upMissoffsets = {'0', '0'}    --
rightMissoffsets = {'0', '0'} --

-- alt animations, you don't need these if you're not gonna use them
leftAltoffsets = {'0', '0'}
downAltoffsets = {'0', '0'}
upAltoffsets = {'0', '0'}
rightAltoffsets = {'0', '0'}
idleAltoffsets = {'623', '616'} --REACTION IDLE LOOL
enterOffsets = {'60', '2679'}
reactOffsets = {'623', '616'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'Entrance'
left_xml_name = 'left'
down_xml_name = 'DOWN POSE'
up_xml_name = 'UP POSE'
right_xml_name = 'RIGHT POSE'

left_miss_xml_name = ''   -- you probably won't need these if it's for the opponent
down_miss_xml_name = ''   --
up_miss_xml_name = ''       --
right_miss_xml_name = '' --

left_alt_xml_name = 'left alt'
down_alt_xml_name = 'down alt'
up_alt_xml_name = 'up alt'
right_alt_xml_name = 'right alt'
idle_alt_xml_name = 'hank react'
enter_xml_name = 'Entrance'
react_xml_name = 'hank react'

-- basically horizontal and vertical positions
x_position = 350
y_position = 340

-- scales your character (set to 1 by default)
xScale = 1
yScale = 1

-- invisible character (so basically if you wanna use the change character event, you need to make the second character invisible first)
invisible = true

-- pretty self-explanitory
name_of_character_xml = 'HANK'
name_of_character = 'hank-efn'
name_of_notetype = 'GF Sing'
name_of_notetype2 = 'Duet' -- hank and wank sing together
--altnotetype = '' -- this is used for alt animations (uncomment if you use them)
--altnotetype2 = '' -- this is used for alt animations and singing at the same time (uncomment if you use them)

-- if it's set to true the character appears behind the default characters, including gf, watch out for that
foreground = false
playablecharacter = false -- change to 'true' if you want to flipX
idlealt = false
dontDo = false --for the last hank anim lol

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/' .. name_of_character_xml, x_position, y_position);

	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 24, true);
	addAnimationByIndices(name_of_character, 'idle', idle_xml_name, '7,8,9,10,11,12,13,14', 24);
	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 24, false);

	addAnimationByPrefix(name_of_character, 'singLEFTmiss', left_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singDOWNmiss', down_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singUPmiss', up_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singRIGHTmiss', right_miss_xml_name, 24, false);

	addAnimationByPrefix(name_of_character, 'singLEFT-alt', left_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singDOWN-alt', down_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singUP-alt', up_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singRIGHT-alt', right_alt_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'idle-alt', idle_alt_xml_name, 24, false);
	addAnimationByIndices(name_of_character, 'idle-alt', idle_alt_xml_name, '22,23,24,25,26,27,28,29,30,31,32,33,34,35,36', 24);
	addAnimationByPrefix(name_of_character, 'enter', enter_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'react-start', react_xml_name, 24, false);
	addAnimationByIndices(name_of_character, 'react-start', react_xml_name, '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21', 24);
	addAnimationByPrefix(name_of_character, 'react-end', react_xml_name, 24, false);
	addAnimationByIndices(name_of_character, 'react-end', react_xml_name, '38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126', 24);

	if playablecharacter == true then
		setPropertyLuaSprite(name_of_character, 'flipX', true);
	else
		setPropertyLuaSprite(name_of_character, 'flipX', false);
	end

	scaleObject(name_of_character, xScale, yScale);


	objectPlayAnimation(name_of_character, 'idle');
	addLuaSprite(name_of_character, foreground);

	if invisible == true then
		setPropertyLuaSprite(name_of_character, 'alpha', 0)
	end
end

function onEvent(name, value1, value2)
	if name == 'Griddy' then --events BS
		gritty = tonumber(value1)
		if gritty == 0 then --he appears
			setPropertyLuaSprite(name_of_character, 'alpha', 1)
			objectPlayAnimation(name_of_character, 'enter')
			setProperty(name_of_character .. '.offset.x', enterOffsets[1]);
			setProperty(name_of_character .. '.offset.y', enterOffsets[2]);
			runTimer('idlebackk', 1)
			doIdle = false
		elseif gritty == 1 then --live hank reaction
			doIdle = false
			setProperty(name_of_character .. '.offset.x', reactOffsets[1]);
			setProperty(name_of_character .. '.offset.y', reactOffsets[2]);
			objectPlayAnimation(name_of_character, 'react-start')
			idlealt = true
			runTimer('idlebackk', 1)
		elseif gritty == 4 then --live hank reaction
			dontDo = true
			doIdle = false
			objectPlayAnimation(name_of_character, 'react-end')
			runTimer('gone', 4)
		end
	end
end

function onTimerCompleted(t,l,ll)
	if t == 'idlebackk' then
		doIdle = true
	end
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
local altAnims ={"singLEFT-alt", "singDOWN-alt", "singUP-alt", "singRIGHT-alt"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype or noteType == name_of_notetype2 then
		triggerEvent('Screen Shake',0.008,0.2)
		doIdle = false
		objectPlayAnimation(name_of_character, singAnims[direction + 1], false);

		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		end
	end
	if noteType == altnotetype or noteType == altnotetype2 then
		triggerEvent('Screen Shake',0.008,0.2)
        doIdle = false
        objectPlayAnimation(name_of_character, altAnims[direction + 1], true);

        if direction == 0 then
            setProperty(name_of_character .. '.offset.x', leftAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', leftAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty(name_of_character .. '.offset.x', dowAltnoffsets[1]);
            setProperty(name_of_character .. '.offset.y', downAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);

            end
        elseif direction == 2 then
            setProperty(name_of_character .. '.offset.x', upAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', upAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty(name_of_character .. '.offset.x', rightAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', rightAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        end
    end
end

-- I know this is messy, but it's the only way I know to make it work on both sides.
local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
local altAnims ={"singLEFT-alt", "singDOWN-alt", "singUP-alt", "singRIGHT-alt"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype or noteType == name_of_notetype2 then
		doIdle = false
		objectPlayAnimation(name_of_character, singAnims[direction + 1], false);

		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);
		end
	end
	if noteType == altnotetype or noteType == altnotetype2 then
        doIdle = false
        objectPlayAnimation(name_of_character, altAnims[direction + 1], true);

        if direction == 0 then
            setProperty(name_of_character .. '.offset.x', leftAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', leftAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty(name_of_character .. '.offset.x', dowAltnoffsets[1]);
            setProperty(name_of_character .. '.offset.y', downAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);

            end
        elseif direction == 2 then
            setProperty(name_of_character .. '.offset.x', upAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', upAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty(name_of_character .. '.offset.x', rightAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', rightAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        end
    end
end

local missAnims = {"singLEFTmiss", "singDOWNmiss", "singUPmiss", "singRIGHTmiss"}
function noteMiss(id, direction, noteType, isSustainNote)
    if noteType == name_of_notetype or noteType == name_of_notetype2 then
        doIdle = false
        objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
        if direction == 0 then
            setProperty(name_of_character .. '.offset.x', leftMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', leftMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty(name_of_character .. '.offset.x', downMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', downMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        elseif direction == 2 then
            setProperty(name_of_character .. '.offset.x', upMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', upMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty(name_of_character .. '.offset.x', rightMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', rightMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        end
    end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  and doIdle then
		if idlealt then
		objectPlayAnimation(name_of_character, 'idle-alt', true);
		setProperty(name_of_character .. '.offset.x', idleAltoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleAltoffsets[2]);
		else
		objectPlayAnimation(name_of_character, 'idle', true);
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
	end
	if not dontDo then
		doIdle = true
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		if doIdle == true then
			objectPlayAnimation(name_of_character, 'idle');
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
	end
end