function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/3000)*(curBpm/20)

        noteTweenY('a', 4, defaultPlayerStrumY0 - 80*math.sin((currentBeat+4*0.25)*math.pi), 0.6)
        noteTweenY('b', 5, defaultPlayerStrumY1 - 80*math.sin((currentBeat+5*0.25)*math.pi), 0.6)
        noteTweenY('c', 6, defaultPlayerStrumY2 - 80*math.sin((currentBeat+6*0.25)*math.pi), 0.6)
        noteTweenY('d', 7, defaultPlayerStrumY3 - 80*math.sin((currentBeat+7*0.25)*math.pi), 0.6)

        noteTweenY('e', 0, defaultOpponentStrumY0 + 80*math.sin((currentBeat+4*0.25)*math.pi), 0.6)
        noteTweenY('f', 1, defaultOpponentStrumY1 + 80*math.sin((currentBeat+5*0.25)*math.pi), 0.6)
        noteTweenY('g', 2, defaultOpponentStrumY2 + 80*math.sin((currentBeat+6*0.25)*math.pi), 0.6)
        noteTweenY('h', 3, defaultOpponentStrumY3 + 80*math.sin((currentBeat+7*0.25)*math.pi), 0.6)
end