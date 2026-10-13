noteFlag = 0
dxNote = 0
dxReset = 0

function onCountdownStarted()
	runHaxeCode([[
		for (strum in game.opponentStrums)
		{
			strum.cameras = [game.camGame];
			strum.scrollFactor.set(1, 1);
		}
		for (note in game.unspawnNotes) 
		{
			if (!note.mustPress) {
				note.cameras = [game.camGame];
				note.scrollFactor.set(1, 1);
			} 
		};
	]])
	if downscroll then
		loserScrollHateHateHATEDownscroll = 180
	else
		loserScrollHateHateHATEDownscroll = 0
	end
	noteScaleOfficialRealLife = getPropertyFromGroup('unspawnNotes', 0, 'scale.x')
	sideScroll()
end

function onStepHit()
	if curStep > -1 and noteFlag < 1 then
		noteFlag = 1
		sideScroll()
	end
    if curStep > 1379 and noteFlag < 2 then
		noteFlag = 2
		waterScroll()
    end
	if curStep > 1603 and noteFlag < 3 then
		noteFlag = 3
		rescaleNotes()
		sideScroll()
	end
end

function sideScroll()
	for i = 0, 3 do
		noteTweenDirection('sidescroll'..i, i, 0 + loserScrollHateHateHATEDownscroll, 0.001)
		setObjectOrder('strumLineNotes', getObjectOrder('trees')+1)
		setObjectOrder('notes', getObjectOrder('trees')+1)
		noteTweenY('sidescrollup'..i, i, (screenHeight + -930 - (i*30)) - (110 * ((i - 2) - 1)), 0.001)
		noteTweenX('sidescrollright'..i, i, screenWidth - 2250, 0.001)
	end
end

function waterScroll()
	for i=0, getProperty('unspawnNotes.length') do
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then else
			setPropertyFromGroup("unspawnNotes", i, "scale.x", 2)
			setPropertyFromGroup("unspawnNotes", i, "scale.y", 2)
		end
	end
	for i = 0, 3 do
		noteTweenDirection('sidescroll'..i, i, 270 + loserScrollHateHateHATEDownscroll, 0.001)
		setObjectOrder('notes', getObjectOrder('water')+1)
		noteTweenX('sidescrollup'..i, i, (screenWidth + -1050 - (i*450)) - (110 * ((i - 2) - 1)), 0.001)
		noteTweenY('sidescrollright'..i, i, screenHeight + 10500, 0.001)
	end
end

function rescaleNotes()
	for i=0, getProperty('unspawnNotes.length') do
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then else
			setPropertyFromGroup("unspawnNotes", i, "scale.x", noteScaleOfficialRealLife)
			setPropertyFromGroup("unspawnNotes", i, "scale.y", noteScaleOfficialRealLife)
		end
	end
end

function opponentNoteHit(index, dir, noteType, isSustain)
	if curStep > 1592 and curStep < 2120 then
		if not isSustain then
			makeLuaSprite('dxNote'..dxNote, 'note'..dir, -800 + getRandomInt(-1440, 1440), -400 + getRandomInt(-1080, 720))
			addLuaSprite('dxNote'..dxNote, false);
			setObjectOrder('dxNote'..dxNote, getObjectOrder('sun')+1)
			setProperty('dxNote'..dxNote..'.angle', getRandomInt(-360, 360))
			scaleObject('dxNote'..dxNote, 3 + (getRandomInt(0, 100)/50), 3 + (getRandomInt(0, 100)/50))
			doTweenAngle('noteAss'..dxNote, 'dxNote'..dxNote, getRandomInt(-360, 360), 1, 'circOut')
			doTweenX('noteGrass'..dxNote, 'dxNote'..dxNote..'.scale', 1 + (getRandomInt(0, 50)/100), 1, 'circOut')
			doTweenY('noteBrass'..dxNote, 'dxNote'..dxNote..'.scale', 1 + (getRandomInt(0, 50)/100), 1, 'circOut')
			doTweenAlpha('notePass'..dxNote, 'dxNote'..dxNote, 0, 1)
			dxNote = dxNote + 1
		end
	end
end

function onTweenCompleted(t)
	if t == 'notePass'..dxReset then
		removeLuaSprite('dxNote'..dxReset)
		dxReset = dxReset + 1
	end
end