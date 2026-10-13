function onSectionHit()
if dadName == 'DX3' then
		if mustHitSection == true then
				-- called when the camera focus on boyfriend
				setProperty('defaultCamZoom',0.8);
		end
		if mustHitSection == false then
				-- called when the camera focus on dad
				setProperty('defaultCamZoom',0.6);
		end
	end
end