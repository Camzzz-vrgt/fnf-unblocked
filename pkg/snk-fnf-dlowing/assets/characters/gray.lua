function onUpdate(e)
	local angleOfs = math.random(-6, 6)
	local angleOfs2 = math.random(-2, 2)
	if getProperty('healthBar.percent') > 80 then
		setProperty('iconP2.angle', angleOfs)
    end
	if getProperty('healthBar.percent') < 80 then
		setProperty('iconP2.angle', angleOfs2)
    end
end