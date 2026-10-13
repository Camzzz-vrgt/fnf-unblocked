function onCountdownStarted()
    for i=0,3 do
        setPropertyFromGroup('opponentStrums', i, 'texture', 'henry/henryCyborg')
        setPropertyFromGroup('unspawnNotes', i, 'texture', 'henry/henryCyborg')
    end
end

function onUpdate(elapsed)
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'henry/henryCyborg');
		end
    end
end