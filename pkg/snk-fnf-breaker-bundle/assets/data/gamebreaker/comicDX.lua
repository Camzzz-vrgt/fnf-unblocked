local beatLength=0
local stepLength=0

local charName='DXcomic'
local charDirectory='characters/dxComic'
local charScale=1
local offsetScalesWithSize=true
local correspondingNoteType='ExtraCharNote1'
local singLength=4

local charPos={-875, 150}
local prefixes={
		[1]='dxcomicleft', --[[left]]
		[2]='dxcomicdown', --[[down]]
		[3]='dxcomicup', --[[up]]
		[4]='dxcomicright', --[[right]]
		[5]='dxcomicidle', --[[idle]]
		[6]='dxcomicP1', --[[1]]
		[7]='dxcomicP2', --[[2]]
		[8]='dxcomicP3', --[[3]]
	}
local charOffsets={
		[1]={0, 90}, --[[left]]
		[2]={0, 90}, --[[down]]
		[3]={0, 90}, --[[up]]
		[4]={1, 90}, --[[right]]
		[5]={1, 90}, --[[idle]]
		[6]={0, 0}, --[[1]]
		[7]={0, 0}, --[[2]]
		[8]={0, 0}, --[[3]]
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
		addAnimationByPrefix(charName, '1', prefixes[6], 24, false)
		addAnimationByPrefix(charName, '2', prefixes[7], 24, false)
		addAnimationByPrefix(charName, '3', prefixes[8], 24, false)

	advAnim(charName, 'idle' , true, charOffsets[5])
	setObjectOrder(charName, 0)
	setScrollFactor(charName,0,0);
	setObjectCamera(charName,'hud');
	scaleObject(charName, 1.3, 1.3)
	setProperty('DXcomic.visible', false)
end

--function goodNoteHit(id,dir,note,sus)
	--if note==correspondingNoteType then
		--advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
		--runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	--end
--end

function opponentNoteHit(id,dir,note,sus)
	--if note==correspondingNoteType then
		advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
		runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	--end
end

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
		if curStep == 1732 or curStep == 1912 then
			setProperty('DXcomic.visible', true)
			doTweenX("DXcomictweeb", charName, -75, 0.5, "circOut")
		end
		if curStep == 1856 or curStep == 1920 then
			doTweenX("DXcomictweeb", charName, -875, 0.5, "circInOut")
		end
	end
end