--some of this is taken from vs omori's modchart stuff
--please play vs omori btw it is super cool :)

local defaultNotePos = {}
local defaultPlayerPos = {}

local attack = false

function onSongStart()
	for i = 0,3 do 
        table.insert(defaultNotePos, getPropertyFromGroup('strumLineNotes', i, 'x'))
    end
end

function onStepHit()
	if curStep == 192 or curStep == 576 then
		goBehind()
	end

	if curStep == 256 or curStep == 832 then
		goBack()
	end
end

function opponentNoteHit()
	if attack then
		setProperty('health', getProperty('health') - 0.023)
	end
end

function goBehind()
	for i = 0,3 do
		noteTweenX('goBehind'..i, i, getPropertyFromGroup('strumLineNotes', i + 4, 'x'), 0.4, 'bounceIn')
		noteTweenAngle('goBehindA'..i, i, 360, 0.4, 'bounceIn')
		noteTweenAlpha('goBehindAl'..i, i, 0.4, 0.4, 'bounceIn')

		attack = true
	end
end

function goBack()
	for i = 0,3 do
		noteTweenX('goBack'..i, i, defaultNotePos[i + 1], 0.4, 'bounceIn')
		noteTweenAngle('goBackA'..i, i, 0, 0.4, 'bounceIn')
		noteTweenAlpha('goBackAl'..i, i, 1, 0.4, 'bounceIn')

		attack = false
	end
end