function onCreate()
	getData();
	setProperty('healthBar.flipX',true)
	runTimer('hello', 10)
end

function onCreatePost()
	swapArrows();
	setProperty('camHUD.alpha', 0);
end

function onBeatHit()
	if curBeat % 504 == 0 then
		setPropertyFromGroup('playerStrums', 0, 'x', 400 - 250)
		setPropertyFromGroup('playerStrums', 1, 'x', 520 - 200)
		setPropertyFromGroup('playerStrums', 2, 'x', 640 + 200)
		setPropertyFromGroup('playerStrums', 3, 'x', 760 + 250)
		
		setPropertyFromGroup('opponentStrums', 0, 'x', -5000)
		setPropertyFromGroup('opponentStrums', 1, 'x', -5000)
		setPropertyFromGroup('opponentStrums', 2, 'x', -5000)
		setPropertyFromGroup('opponentStrums', 3, 'x', -5000)
    end

end

function swapArrows()
	setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0)
    setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1)
    setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2)
    setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3)
	  
	setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0 + 0)
    setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1 + 0)
    setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2 + 0)
    setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3 + 0)
end
