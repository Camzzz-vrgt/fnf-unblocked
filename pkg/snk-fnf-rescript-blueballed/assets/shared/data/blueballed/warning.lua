function onCreatePost()
	setOnScripts('camX', 1030)
	setOnScripts('camY', 120)
	createInstance("redwar", "objects.Alphabet", {800, 100, '> CAUTION <', true})
	addInstance("redwar", false)
	setProperty('redwar.color', getColorFromHex('ff0000'))
	setProperty('redwar.alpha',1)

	createInstance("norwar", "objects.Alphabet", {-10, -400, [[
                    Be advised that this
              Friday Night Funkin' program

       contains sequences of flashing lights
                 that may affect players
 who are susceptible to photosensitive epilepsy
                  or prone to bright colors!

This modification is home to strobing patterns
that may cause discomfort and trigger seizure.
    Player discretion is advised, be careful.
]], true})
	addInstance("norwar", false)
	setProperty('norwar.alpha',0)
	scaleObject('norwar',0.8,0.8,false)

	createInstance("clcwar", "objects.Alphabet", {-210, 650, [[
go to options>visuals,and disable some flashing lights
         Press [space] to proceed or [escape] to leave]], true})
	addInstance("clcwar", false)
	setProperty('clcwar.color', getColorFromHex('858585'))
	setProperty('clcwar.alpha',0)
	scaleObject('clcwar',0.7,0.7,false)

	setProperty('camHUD.alpha',0)
	runTimer('zoomOUTtrick',2)
end

clicked = false
function onUpdatePost()
	if clicked then
		if keyboardJustPressed("space") then
			doTweenAlpha('zi', 'redwar', 0, 1.5, 'sineInOut')
			doTweenAlpha('zi2', 'norwar', 0, 1.5, 'sineInOut')
			doTweenAlpha('zi3', 'clcwar', 0, 1.5, 'sineInOut')
			clicked = false
		elseif keyboardJustPressed("ESCAPE") then
			exitSong()
			clicked = false
		end
	end
end

function onTimerCompleted(t)
	if t == 'zoomOUTtrick' then
		doTweenX('zoomeventvalue', 'CAMfake', 0.45, 2, 'sineInOut')
		doTweenY('zo', 'redwar', -500, 2, 'sineInOut')
		doTweenX('zo2', 'redwar', 780, 2, 'sineInOut')
	elseif t == 'showhidtxt' then
		doTweenAlpha('z2', 'clcwar', 1, 1, 'sineInOut')
		clicked = true
	end
end

function onTweenCompleted(t)
	if t == 'zo2' then
		doTweenAlpha('z', 'norwar', 1, 1, 'sineInOut')
		runTimer('showhidtxt',3)
	elseif t == 'zi3' then
		setProperty('CAMfake.x',1.3)
		setOnScripts('camX', 570)
		setOnScripts('camY', 470)
		runTimer('bfDie',1)
	end
end
