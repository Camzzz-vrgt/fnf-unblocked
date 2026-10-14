function onStepHit()
	if curStep == 23 then
		doTweenAlpha('Phantom', 'Phan', 0, 1, 'linear')

	end

	if curStep == 48 then
		setProperty('oreo.visible', false)

	end

	if curStep == 560 then
		doTweenAlpha('Well', 'well', 1, 0.5, 'linear')

	end

	if curStep == 576 then
		doTweenAlpha('Well', 'well', 0, 0.01, 'linear')
		cameraFlash('camHUD','FFFFFF','1')
		setProperty('Movie.visible',true)
	end

	if curStep == 832 then
		cameraFlash('camHUD','FFFFFF','1')
		setProperty('Movie.visible',false)

		doTweenY('Big', 'Big', -100, 7.06, 'linear')
	end
	if curStep == 911 then
		doTweenY('Moyai', 'Moyai', -100, 7.06, 'linear')
	end
end