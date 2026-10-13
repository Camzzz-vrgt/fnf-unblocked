function onUpdate()

	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	doTweenAngle('blueybg', 'blueybg', 10*math.sin((currentBeat+40)*math.pi), 1)
	doTweenAngle('bingobg', 'bingobg', 10*math.sin((currentBeat+40)*math.pi), 1)
	doTweenAngle('mackenziebg', 'mackenziebg', 10*math.sin((currentBeat+40)*math.pi), 1)
	
	if curBeat == 32 then
		addLuaSprite('bingobg', false);
	end
	
	if curBeat == 64 then
		removeLuaSprite('bingobg', false);
		addLuaSprite('mackenziebg', false);
	end
	
	if curBeat == 96 then
		removeLuaSprite('mackenziebg', false);
		addLuaSprite('bingobg', false);
	end
	
	if not inGameOver then
		setPropertyFromGroup('opponentStrums',0,'alpha',0)
		setPropertyFromGroup('opponentStrums',1,'alpha',0)
		setPropertyFromGroup('opponentStrums',2,'alpha',0)
		setPropertyFromGroup('opponentStrums',3,'alpha',0)
	end
	
end