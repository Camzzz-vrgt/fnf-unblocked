function update(elapsed)
	-- "ENOUGH"
	if curStep == 240 then
		for i=0,3 do
			tweenFadeOut(i, 0, 0.4)
		end
	end
	if curStep == 252 then
		showOnlyStrums = true
	end
	if curStep == 255 then
		for i=0,7 do
			tweenFadeIn(i, 1, 0.01)
		end
		showOnlyStrums = false
	end
end