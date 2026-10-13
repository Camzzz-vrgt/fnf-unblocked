function onSectionHit()
if dadName == 'DX4' then
		if mustHitSection == true then
				-- called when the camera focus on boyfriend
				setProperty('defaultCamZoom',0.9);
		end
		if mustHitSection == false then
				-- called when the camera focus on dad
				setProperty('defaultCamZoom',0.4);
		end
	end
end