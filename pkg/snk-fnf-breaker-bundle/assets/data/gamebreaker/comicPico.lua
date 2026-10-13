local beatLength=0
local stepLength=0

local charName='picomic'
local charDirectory='characters/picoComic'
local charScale=1
local offsetScalesWithSize=true
local correspondingNoteType='ExtraCharNote1'
local singLength=4

local charPos={1450, 150}
local prefixes={
		[1]='pico comic left', --[[left]]
		[2]='pico comic down', --[[down]]
		[3]='pico comic up', --[[up]]
		[4]='pico comic right', --[[right]]
		[5]='pico comic idle', --[[idle]]
	}
local charOffsets={
		[1]={0, 90}, --[[left]]
		[2]={0, 90}, --[[down]]
		[3]={0, 90}, --[[up]]
		[4]={0, 90}, --[[right]]
		[5]={0, 90}, --[[idle]]
	}

function mathStuffs()
	beatLength=(1/bpm)*60
	stepLength=beatLength*0.25
end

function advAnim(obj,anim,forced,offsetTable)
	playAnim(obj, anim, forced)
	if offsetScalesWithSize then
		setProperty(obj..'.offset.x', offsetTable[1]*charScale)
		setProperty(obj..'.offset.y', offsetTable[2]*charScale)
	else
		setProperty(obj..'.offset.x', offsetTable[1])
		setProperty(obj..'.offset.y', offsetTable[2])		
	end
end

local singAnims={'singLEFT','singDOWN','singUP','singRIGHT'}

function onCreatePost()
	mathStuffs()
	makeAnimatedLuaSprite(charName, charDirectory, charPos[1], charPos[2])

		addAnimationByPrefix(charName, 'singLEFT', prefixes[1], 24, false)
		addAnimationByPrefix(charName, 'singDOWN', prefixes[2], 24, false)
		addAnimationByPrefix(charName, 'singUP', prefixes[3], 24, false)
		addAnimationByPrefix(charName, 'singRIGHT', prefixes[4], 24, false)
		addAnimationByPrefix(charName, 'idle', prefixes[5], 24, false)

	advAnim(charName, 'idle' , true, charOffsets[5])
	setObjectOrder(charName, 0)
	setScrollFactor(charName,0,0);
	setObjectCamera(charName,'hud');
	scaleObject(charName, 1.3, 1.3)
	setProperty('picomic.visible', false)
end

function goodNoteHit(id,dir,note,sus)
	--if note==correspondingNoteType then
		advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
		runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	--end
end

--function opponentNoteHit(id,dir,note,sus)
	--if note==correspondingNoteType then
		--advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
		--runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	--end
--end

function onTimerCompleted(tag,loops,loopsLeft)
	if tag==charName..'-holdTimer' then
		advAnim(charName, 'idle' , true, charOffsets[5])
	end
end

function onBeatHit()
	if curBeat%2==0 and getProperty(charName..'.animation.curAnim.name')=='idle' then
		advAnim(charName, 'idle' , true, charOffsets[5])
	end
end

function onStepHit()
	if songName == 'Gamebreaker' then
		if curStep == 1796 or curStep == 2040 then
			setProperty('picomic.visible', true)
			doTweenX("picomictweeb", charName, 650, 0.5, "circOut")
		end
		if curStep == 1856 or curStep == 2048 then
			doTweenX("picomictweeb", charName, 1450, 0.5, "circInOut")
		end
	end
end