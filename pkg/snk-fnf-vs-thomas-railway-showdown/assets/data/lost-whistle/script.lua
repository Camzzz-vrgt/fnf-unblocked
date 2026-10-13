function onUpdatePost()
	if curStep == 1 then
	noteTweenX('l', 0, 412, 0.8, 'smootherStepOut')
	noteTweenX('d', 1, 524, 0.9, 'smootherStepOut')
	noteTweenX('u', 2, 636, 1, 'smootherStepOut')
	noteTweenX('r', 3, 748, 1.1, 'smootherStepOut')
	noteTweenX('l1', 4, 412, 0.8, 'smootherStepOut')
	noteTweenX('d2', 5, 524, 0.9, 'smootherStepOut')
	noteTweenX('u3', 6, 636, 1, 'smootherStepOut')
	noteTweenX('l4', 7, 748, 1.1, 'smootherStepOut')
	noteTweenAlpha('a', 0, 0, 0.8, 'smootherStepOut')
	noteTweenAlpha('e', 1, 0, 0.9, 'smootherStepOut')
	noteTweenAlpha('p', 2, 0, 1, 'smootherStepOut')
	noteTweenAlpha('h', 3, 0, 1.1, 'smootherStepOut')
	end
end