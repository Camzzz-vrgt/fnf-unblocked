function onStepHit()
	if curBeat > 31 and curBeat < 96 then
		if curStep % 4 == 0 then
			doTweenY('up', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('down', 'camGame.scroll', 12, stepCrochet*0.002, 'backIn')
		end
		if curStep % 4 == 2 then
			doTweenY('up', 'camHUD', 0, stepCrochet*0.002, 'backIn')
			doTweenY('down', 'camGame.scroll', 0, stepCrochet*0.002, 'backIn')
		end
	end
	if curBeat > 127 and curBeat < 192 then
		if curStep % 4 == 0 then
			doTweenY('up', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('down', 'camGame.scroll', 12, stepCrochet*0.002, 'backIn')
		end
		if curStep % 4 == 2 then
			doTweenY('up', 'camHUD', 0, stepCrochet*0.002, 'backIn')
			doTweenY('down', 'camGame.scroll', 0, stepCrochet*0.002, 'backIn')
		end
	end
	if curBeat > 223 and curBeat < 258 then
		if curStep % 4 == 0 then
			doTweenY('up', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('down', 'camGame.scroll', 12, stepCrochet*0.002, 'backIn')
		end
		if curStep % 4 == 2 then
			doTweenY('up', 'camHUD', 0, stepCrochet*0.002, 'backIn')
			doTweenY('down', 'camGame.scroll', 0, stepCrochet*0.002, 'backIn')
		end
	end
end