function onStepHit()
	if curBeat > 47 and curBeat < 80 then
		if curStep % 4 == 0 then
			doTweenY('up', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('down', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('up', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('down', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end

    if curBeat > 111 and curBeat < 144 then
		if curStep % 4 == 0 then
			doTweenY('up', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('down', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('up', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('down', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end

	if curBeat > 175 and curBeat < 240 then
		if curStep % 4 == 0 then
			doTweenY('up', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('down', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('up', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('down', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end

	if curBeat > 255 and curBeat < 320 then
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