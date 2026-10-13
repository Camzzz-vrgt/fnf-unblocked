function onStepHit()
	if curBeat > 63 and curBeat < 96 then
		if curStep % 4 == 0 then
			doTweenY('up', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('down', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('up', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('down', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end

    if curBeat > 127 and curBeat < 200 then
		if curStep % 4 == 0 then
			doTweenY('up', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('down', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('up', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('down', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end
end