local dadPos = {}
local bfPos = {}
local dadPos2 = {}
local bfPos2 = {}

function onStepHit()


	if curStep == 800 and not middlescroll then
        for i=0,3 do 
            table.insert(dadPos, getPropertyFromGroup('opponentStrums', i, 'x'))
            table.insert(bfPos, getPropertyFromGroup('playerStrums', i, 'x'))
        end

        for i=1,4 do
            setPropertyFromGroup('opponentStrums', i - 1, 'x', bfPos[i])
            setPropertyFromGroup('playerStrums', i - 1, 'x', dadPos[i])
        end
    end

    if curStep == 1568 and not middlescroll then
        for i=0,3 do 
            table.insert(bfPos2, getPropertyFromGroup('playerStrums', i, 'x'))
            table.insert(dadPos2, getPropertyFromGroup('opponentStrums', i, 'x'))
        end

        for i=1,4 do
            setPropertyFromGroup('playerStrums', i - 1, 'x', dadPos2[i])
            setPropertyFromGroup('opponentStrums', i - 1, 'x', bfPos2[i])
        end
    end

end