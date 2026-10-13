function onStepHit()
	if curStep == 608 then
		noteTweenAlpha('noteFadeIn0', 0, 0.00001, 2.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn1', 1, 0.00001, 2.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn2', 2, 0.00001, 2.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn3', 3, 0.00001, 2.5, 'quadInOut')

		noteTweenAlpha('noteFadeIn4', 4, 0.00001, 2.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn5', 5, 0.00001, 2.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn6', 6, 0.00001, 2.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn7', 7, 0.00001, 2.5, 'quadInOut')
	end
	if curStep == 760 then
		noteTweenAlpha('noteFadeIn0', 4, 1, 1.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn1', 5, 1, 1.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn2', 6, 1, 1.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn3', 7, 1, 1.5, 'quadInOut')
	end
	if curStep == 789 then
		noteTweenX('Movement X 0', 0, defaultPlayerStrumX0, 2, 'quintInOut')
		noteTweenX('Movement X 1', 1, defaultPlayerStrumX1, 2, 'quintInOut')
		noteTweenX('Movement X 2', 2, defaultPlayerStrumX2, 2, 'quintInOut')
		noteTweenX('Movement X 3', 3, defaultPlayerStrumX3, 2, 'quintInOut')
	
		noteTweenX('Movement X 4', 4, defaultOpponentStrumX0, 2, 'quintInOut')
		noteTweenX('Movement X 5', 5, defaultOpponentStrumX1, 2, 'quintInOut')
		noteTweenX('Movement X 6', 6, defaultOpponentStrumX2, 2, 'quintInOut')
		noteTweenX('Movement X 7', 7, defaultOpponentStrumX3, 2, 'quintInOut')
	end
    if curStep == 1500 then
		noteTweenAlpha('noteFadeIn0', 0, 0.00001, 0.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn1', 1, 0.00001, 0.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn2', 2, 0.00001, 0.5, 'quadInOut')
		noteTweenAlpha('noteFadeIn3', 3, 0.00001, 0.5, 'quadInOut')
	end
	if curStep == 1512 then
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
	end
    if curStep == 1522 then
        noteTweenX('Movement X 0', 4, defaultOpponentStrumX2, 1, 'quintInOut')
    	noteTweenX('Movement X 1', 5, defaultOpponentStrumX3, 1, 'quintInOut')
    	noteTweenX('Movement X 2', 6, defaultPlayerStrumX0, 1, 'quintInOut')
    	noteTweenX('Movement X 3', 7, defaultPlayerStrumX1, 1, 'quintInOut')
	end
	if curStep == 1532 then
        noteTweenX('Movement X 0', 0, defaultOpponentStrumX2 - 590, 0.00000000001)
    	noteTweenX('Movement X 1', 1, defaultOpponentStrumX3 - 535, 0.00000000001)
    	noteTweenX('Movement X 2', 2, defaultPlayerStrumX0 + 545, 0.00000000001)
    	noteTweenX('Movement X 3', 3, defaultPlayerStrumX1 + 600, 0.00000000001)

		noteTweenY('Movement Y 0', 0, -350, 0.00000000001)
    	noteTweenY('Movement Y 1', 1, -350, 0.00000000001)
    	noteTweenY('Movement Y 2', 2, -350, 0.00000000001)
    	noteTweenY('Movement Y 3', 3, -350, 0.00000000001)
    end
    if curStep == 1533 then
        for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5) 
		end
		setObjectOrder('opponentStrums', getObjectOrder('bodydead')+1)
		setObjectOrder('unspawnNotes', getObjectOrder('bodydead')+1)
		setObjectOrder('notes', getObjectOrder('bodydead')+1)
		setProperty('defaultCamZoom', 0.7) 
    end
	if curStep == 1745 then
		noteTweenX('Movement X 0', 4, defaultOpponentStrumX0, 1, 'quintInOut')
    	noteTweenX('Movement X 1', 5, defaultOpponentStrumX1, 1, 'quintInOut')
    	noteTweenX('Movement X 2', 6, defaultOpponentStrumX2, 1, 'quintInOut')
    	noteTweenX('Movement X 3', 7, defaultOpponentStrumX3, 1, 'quintInOut')
	end
end