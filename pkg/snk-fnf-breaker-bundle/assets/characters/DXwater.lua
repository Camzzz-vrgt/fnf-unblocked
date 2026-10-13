function onSectionHit()
if dadName == 'DXwater' then
		if mustHitSection == true then
				-- called when the camera focus on boyfriend
				setProperty('defaultCamZoom',0.5);
		end
		if mustHitSection == false then
				-- called when the camera focus on dad
				setProperty('defaultCamZoom',0.4);
		end
	end
end