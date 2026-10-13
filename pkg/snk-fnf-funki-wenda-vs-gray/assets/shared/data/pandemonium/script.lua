function onCreatePost()
	setProperty('gf.visible', false)
end

function onUpdate(elapsed)
	setPropertyFromGroup('opponentStrums', 0, 'x', 120000);
	setPropertyFromGroup('opponentStrums', 1, 'x', 230000);
	setPropertyFromGroup('opponentStrums', 2, 'x', 940000);
	setPropertyFromGroup('opponentStrums', 3, 'x', 105000);
	
	setPropertyFromGroup('playerStrums', 0, 'x', 420);
	setPropertyFromGroup('playerStrums', 1, 'x', 530);
	setPropertyFromGroup('playerStrums', 2, 'x', 640);
	setPropertyFromGroup('playerStrums', 3, 'x', 750);
end
