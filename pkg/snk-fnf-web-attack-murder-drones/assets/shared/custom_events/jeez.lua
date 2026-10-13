function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos/10000)*(2000/60)
    setPropertyFromClass('openfl.Lib','application.window.x', (math.sin((currentBeat*0.50) + (1) * 2) * 500), 0.01)
    setPropertyFromClass('openfl.Lib','application.window.y', (math.sin((currentBeat*0.50) + (1) * 2) * 500), 0.01)
end