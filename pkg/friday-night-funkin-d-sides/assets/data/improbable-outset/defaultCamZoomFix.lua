function onMoveCamera(focus)
	if focus == 'boyfriend' then
		setProperty('defaultCamZoom', 0.85)
	elseif focus == 'dad' then
		setProperty('defaultCamZoom', 0.75)
	end
end