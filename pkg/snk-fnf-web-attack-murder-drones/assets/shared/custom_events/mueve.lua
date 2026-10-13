function onEvent(elapsed, value1, value2)
songPos = getSongPosition()
local currentBeat = (songPos/3000)*(curBpm/20)



        noteTweenY('a', 4, defaultPlayerStrumY0 - value1*math.sin((stepCrochet+4*0.25)*math.pi), 0.6)
        noteTweenY('b', 5, defaultPlayerStrumY1 - value1*math.sin((stepCrochet+5*0.25)*math.pi), 0.6)
        noteTweenY('c', 6, defaultPlayerStrumY2 - value1*math.sin((stepCrochet+6*0.25)*math.pi), 0.6)
        noteTweenY('d', 7, defaultPlayerStrumY3 - value1*math.sin((stepCrochet+7*0.25)*math.pi), 0.6)

        noteTweenY('e', 0, defaultOpponentStrumY0 + value1*math.sin((stepCrochet+4*0.25)*math.pi), 0.6)
        noteTweenY('f', 1, defaultOpponentStrumY1 + value1*math.sin((stepCrochet+5*0.25)*math.pi), 0.6)
        noteTweenY('g', 2, defaultOpponentStrumY2 + value1*math.sin((stepCrochet+6*0.25)*math.pi), 0.6)
        noteTweenY('h', 3, defaultOpponentStrumY3 + value1*math.sin((stepCrochet+7*0.25)*math.pi), 0.6)
end

