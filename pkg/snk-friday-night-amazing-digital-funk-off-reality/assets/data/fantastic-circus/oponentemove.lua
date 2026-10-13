function onUpdate(elapsed)

  if curStep >= 0 then

    songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/50)

    setProperty('dad.y', 500 - 40 * math.sin((currentBeat * 0.25) * math.pi))
	setProperty('dad.x', 600 - 100 * math.sin((currentBeat * 0) * math.pi))

  end

end
