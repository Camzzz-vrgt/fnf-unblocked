local work = false

function onUpdate(elapsed)
	if work then
		if mustHitSection then
			setProperty('defaultCamZoom', 0.7)
		elseif not mustHitSection then
			setProperty('defaultCamZoom', 0.9)
		end
	end
end

function onStepHit()
	if curStep == 1530 then
		work = true
	end
    if curStep == 1772 then
		work = false
	end
end