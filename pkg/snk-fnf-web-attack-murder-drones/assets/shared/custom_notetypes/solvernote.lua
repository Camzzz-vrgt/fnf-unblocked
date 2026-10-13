function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'solvernote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets-future'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	
end


function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'solvernote' then
		noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 - math.random(50, screenWidth / 7), 0.001)
		noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 - math.random(50, screenWidth / 7), 0.001)
		noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 - math.random(50, screenWidth / 7), 0.001)
		noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 -  math.random(50, screenWidth / 7), 0.001)
		
		noteTweenX('defaultOpponentStrumX0', 0, defaultOpponentStrumX0 + math.random(50, screenWidth / 7), 0.001)
		noteTweenX('defaultOpponentStrumX1', 1, defaultOpponentStrumX1 + math.random(50, screenWidth / 7), 0.001)
		noteTweenX('defaultOpponentStrumX2', 2, defaultOpponentStrumX2 + math.random(50, screenWidth / 7), 0.001)
		noteTweenX('defaultOpponentStrumX3', 3, defaultOpponentStrumX3 + math.random(50, screenWidth / 7), 0.001)
		
		noteTweenY('defaultPlayerStrumY0', 4, defaultOpponentStrumY0 - math.random(5, screenHeight / 11), 0.001)
		noteTweenY('defaultPlayerStrumY1', 5, defaultOpponentStrumY1 - math.random(5, screenHeight / 11), 0.001)
		noteTweenY('defaultPlayerStrumY2', 6, defaultOpponentStrumY2 - math.random(5, screenHeight / 11), 0.001)
		noteTweenY('defaultPlayerStrumY3', 7, defaultOpponentStrumY3 - math.random(5, screenHeight / 11), 0.001)
		
		noteTweenY('defaultOpponentStrumY0', 0, defaultOpponentStrumY0 - math.random(5, screenHeight / 11), 0.001)
		noteTweenY('defaultOpponentStrumY1', 1, defaultOpponentStrumY1 - math.random(5, screenHeight / 11), 0.001)
		noteTweenY('defaultOpponentStrumY2', 2, defaultOpponentStrumY2 - math.random(5, screenHeight / 11), 0.001)
		noteTweenY('defaultOpponentStrumY3', 3, defaultOpponentStrumY3 - math.random(5, screenHeight / 11), 0.001)
	end
end