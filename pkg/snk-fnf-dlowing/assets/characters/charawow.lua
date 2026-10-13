function onUpdate(e)
	local angleOfs = math.random(-3, 3)
	if getProperty('healthBar.percent') > 80 then
		setProperty('iconP2.angle', angleOfs)
    end
end