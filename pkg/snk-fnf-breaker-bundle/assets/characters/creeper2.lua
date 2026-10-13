function onSectionHit()
if dadName == 'creeper2' then
		if mustHitSection == true then
				-- called when the camera focus on boyfriend
				setProperty('defaultCamZoom',0.8);
		end
		if mustHitSection == false then
				-- called when the camera focus on dad
				setProperty('defaultCamZoom',0.9);
		end
	end
end