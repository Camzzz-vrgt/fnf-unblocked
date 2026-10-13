function onStepHit()

	if curBeat == 132 then
		for i = 0, getProperty('opponentStrums.length')-1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'bloodyStrums');
		end
	end

	if curBeat == 528 then
		for i = 0, getProperty('opponentStrums.length')-1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		end
	end

	if curBeat == 660 then
		for i = 0, getProperty('opponentStrums.length')-1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'bloodyStrums');
		end
	end	
	

end