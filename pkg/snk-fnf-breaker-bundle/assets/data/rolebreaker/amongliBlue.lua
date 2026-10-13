local beatLength=0
local stepLength=0

local charName='bluecrew'
local charDirectory='characters/bluecrew'
local charScale=1
local offsetScalesWithSize=false
local correspondingNoteType='ExtraCharNote4'
local singLength=4

local charPos={-325, 250}
local prefixes={
		[1]='blue right', --[[left]]
		[2]='blue down', --[[down]]
		[3]='blue up', --[[up]]
		[4]='blue left', --[[right]]
		[5]='blue idle', --[[idle]]
	}
local charOffsets={
		[1]={258, 31}, --[[left]]
		[2]={260, -2}, --[[down]]
		[3]={42, 407}, --[[up]]
		[4]={58, 5}, --[[right]]
		[5]={0, 0}, --[[idle]]
	}

function mathStuffs()
	beatLength=(1/bpm)*60
	stepLength=beatLength*0.25
end

function advAnim(obj,anim,forced,offsetTable)
	objectPlayAnimation(obj, anim, forced)
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
	setObjectOrder(charName, 9)
	setProperty(charName..'.flipX', true)
	setProperty(charName..'.visible', false)
end

function goodNoteHit(id,dir,note,sus)
	if note==correspondingNoteType then
		advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
		runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	end
end

function opponentNoteHit(id,dir,note,sus)
	if note==correspondingNoteType then
		advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
		runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	end
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