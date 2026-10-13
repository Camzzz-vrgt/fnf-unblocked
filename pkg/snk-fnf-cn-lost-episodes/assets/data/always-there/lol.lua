enabled = true
StartOn = 1
EndOn = 120000
function onStepHit()
	if curStep == StartOn then
	
		doTweenAngle('turn', 'camGame', 2.5, crochet/300, 'sineInOut')
		
	end
	
	if curStep == EndOn then
		enabled = false
	end
end

function onTweenCompleted(t)
	if enabled then
		if t == 'turn' then
			doTweenAngle('turn1', 'camGame', -2.5, crochet/300, 'sineInOut')
		end
		if t == 'turn1' then
			doTweenAngle('turn', 'camGame', 2.5, crochet/300, 'sineInOut')
		end
	else
		doTweenAngle('turn3', 'camGame', 0, crochet/300, 'sineInOut')
	end
end  