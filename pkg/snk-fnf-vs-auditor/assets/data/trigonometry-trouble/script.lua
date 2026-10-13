local generalNoteY = 0

local leftNoteY = 0
local downNoteY = 0
local upNoteY = 0
local rightNoteY = 0
local noteY = 0

local leftNoteX = 0
local downNoteX = 0
local upNoteX = 0
local rightNoteX = 0
local noteX = 0

local centerX = 0

local quadrant = 0

local bigX = 0
local bigY = 0
local smallX = 0
local smallY = 0
local scaleFactor = 0

local chainX = 0
local chainY = 0
local tempChainX = 0
local tempChainY = 0
local chainAngle = 0

local leftChainX = 0
local leftChainY = 0
local leftTempChainX = 0
local leftTempChainY = 0
local leftChainAngle = 0

local downChainX = 0
local downChainY = 0
local downTempChainX = 0
local downTempChainY = 0
local downChainAngle = 0

local upChainX = 0
local upChainY = 0
local upTempChainX = 0
local upTempChainY = 0
local upChainAngle = 0

local rightChainX = 0
local rightChainY = 0
local rightTempChainX = 0
local rightTempChainY = 0
local rightChainAngle = 0

function onEvent(name, value1, value2)

    if name == 'notemove' then

        generalNoteY = 0
        generalNoteY = math.random(80, 520)

        leftNoteY = 0
        downNoteY = 0
        upNoteY = 0
        rightNoteY = 0

        leftNoteY = generalNoteY + math.random(-50,50)
        downNoteY = generalNoteY + math.random(-50,50)
        upNoteY = generalNoteY + math.random(-50,50)
        rightNoteY = generalNoteY + math.random(-50,50)

        leftNoteX = 0
        downNoteX = 0
        upNoteX = 0
        rightNoteX = 0

        centerX = math.random(315, 865)
        leftNoteX = math.random(40, centerX - 120)
        rightNoteX = math.random(centerX + 120, 1140)
        downNoteX = math.random(leftNoteX + 60, centerX)
        upNoteX = math.random(centerX + 60, rightNoteX - 60)
        
        runTimer('chaintime1', 0.02, 4)

    end

    if name == 'notespin' then

        runTimer('60degspin', 0.025, 6)
        
    end

end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'chaintime1' then
        --debugPrint(tag)
        --debugPrint(loopsLeft)

        noteTweenAlpha('leftdad', 0, 0, 0.5, 'linear');
        noteTweenAlpha('downdad', 1, 0, 0.5, 'linear');
        noteTweenAlpha('updad', 2, 0, 0.5, 'linear');
        noteTweenAlpha('rightdad', 3, 0, 0.5, 'linear');

        if leftNoteX == getPropertyFromGroup('strumLineNotes', 4, 'x') then
            leftNoteX = leftNoteX + 1
        end

        if leftNoteY == getPropertyFromGroup('strumLineNotes', 4, 'y') then
            leftNoteY = leftNoteY + 1
        end

        if downNoteX == getPropertyFromGroup('strumLineNotes', 5, 'x') then
            downNoteX = downNoteX + 1
        end

        if downNoteY == getPropertyFromGroup('strumLineNotes', 5, 'y') then
            downNoteY = downNoteY + 1
        end

        if upNoteX == getPropertyFromGroup('strumLineNotes', 6, 'x') then
            upNoteX = upNoteX + 1
        end

        if upNoteY == getPropertyFromGroup('strumLineNotes', 6, 'y') then
            upNoteY = upNoteY + 1
        end

        if rightNoteX == getPropertyFromGroup('strumLineNotes', 7, 'x') then
            rightNoteX = rightNoteX + 1
        end

        if rightNoteY == getPropertyFromGroup('strumLineNotes', 7, 'y') then
            rightNoteY = rightNoteY + 1
        end


        if loopsLeft == 3 then

            noteX = leftNoteX
            noteY = leftNoteY
        end

        if loopsLeft == 2 then

            noteX = downNoteX
            noteY = downNoteY
        end

        if loopsLeft == 1 then

            noteX = upNoteX
            noteY = upNoteY
        end

        if loopsLeft == 0 then

            noteX = rightNoteX
            noteY = rightNoteY
        end

        if (noteX < getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'x')) then

            if (noteY < getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y')) then
                quadrant = 2
            else
                quadrant = 3
            end

        else

            if (noteY < getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y')) then
                quadrant = 1
            else
                quadrant = 4
            end

        end
        
        if quadrant == 1 then
            --debugPrint('doing quad 1 calc')

            smallX = noteX - getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'x')
            smallY = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y') - noteY
            scaleFactor = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y') / smallY
            bigX = smallX * scaleFactor
            bigY = smallY * scaleFactor
            chainAngle = math.atan(smallY/smallX)
            chainAngle = (180 * chainAngle / math.pi)
            chainAngle = (90 - chainAngle)

            tempChainX = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'x') + bigX
            tempChainY = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y') - bigY

        end
            
        if quadrant == 2 then
            --debugPrint('doing quad 2 calc')

            smallX = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'x') - noteX
            smallY = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y') - noteY
            scaleFactor = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y') / smallY
            bigX = smallX * scaleFactor
            bigY = smallY * scaleFactor
            chainAngle = math.atan(smallY/smallX)
            chainAngle = (180 * chainAngle / math.pi)
            chainAngle = (90 - chainAngle) * -1

            tempChainX = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'x') - bigX
            tempChainY = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y') - bigY

        end
        
        if quadrant == 3 then
            --debugPrint('doing quad 3 calc')
            
            smallX = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'x') - noteX
            smallY = noteY - getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y')
            scaleFactor = (720 - getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y')) / smallY
            bigX = smallX * scaleFactor
            bigY = smallY * scaleFactor
            --debugPrint('scaleFactor: ', scaleFactor)
            chainAngle = math.atan(smallY/smallX)
            chainAngle = (180 * chainAngle / math.pi)
            chainAngle = 270 - chainAngle

            tempChainX = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'x') - bigX
            tempChainY = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y') + bigY

        end
            
        if quadrant == 4 then
            --debugPrint('doing quad 4 calc')
            
            smallX = noteX - getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'x')
            smallY = noteY - getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y')
            scaleFactor = (720 - getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y')) / smallY
            bigX = smallX * scaleFactor
            bigY = smallY * scaleFactor
            chainAngle = math.atan(smallY/smallX)
            chainAngle = (180 * chainAngle / math.pi)
            chainAngle = 90 + chainAngle


            tempChainX = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'x') + bigX
            tempChainY = getPropertyFromGroup('strumLineNotes', 7 - loopsLeft, 'y') + bigY

        end

        if loopsLeft == 3 then

            leftTempChainX = tempChainX
            leftTempChainY = tempChainY
            leftChainX = leftTempChainX
            leftChainY = leftTempChainY
            leftChainAngle = chainAngle


            makeLuaSprite('chainleft', 'gateway/chain', (leftChainX - 50) + 60, (leftChainY - 1500) + 60)
            setObjectCamera('chainleft', 'camHUD')
            setProperty('chainleft.angle', leftChainAngle)
            setProperty('chainleft.visible', true)
            addLuaSprite('chainleft')

            --debugPrint('made left chaingle ', leftChainAngle, ' with quadrant ', quadrant, ' formula')

        end

        if loopsLeft == 2 then

            downTempChainX = tempChainX
            downTempChainY = tempChainY
            downChainX = downTempChainX
            downChainY = downTempChainY
            downChainAngle = chainAngle


            makeLuaSprite('chaindown', 'gateway/chain', (downChainX - 50) + 60, (downChainY - 1500) + 60)
            setObjectCamera('chaindown', 'camHUD')
            setProperty('chaindown.angle', downChainAngle)
            setProperty('chaindown.visible', true)
            addLuaSprite('chaindown')

            --debugPrint('made down chaingle ', downChainAngle, ' with quadrant ', quadrant, ' formula')
            
        end

        if loopsLeft == 1 then
            
            upTempChainX = tempChainX
            upTempChainY = tempChainY
            upChainX = upTempChainX
            upChainY = upTempChainY
            upChainAngle = chainAngle


            makeLuaSprite('chainup', 'gateway/chain', (upChainX - 50) + 60, (upChainY - 1500) + 60)
            setObjectCamera('chainup', 'camHUD')
            setProperty('chainup.angle', upChainAngle)
            setProperty('chainup.visible', true)
            addLuaSprite('chainup')

            --debugPrint('made up chaingle ', upChainAngle, ' with quadrant ', quadrant, ' formula')
            
        end

        if loopsLeft == 0 then

            rightTempChainX = tempChainX
            rightTempChainY = tempChainY
            rightChainX = rightTempChainX
            rightChainY = rightTempChainY
            rightChainAngle = chainAngle


            makeLuaSprite('chainright', 'gateway/chain', (rightChainX - 50) + 60, (rightChainY - 1500) + 60)
            setObjectCamera('chainright', 'camHUD')
            setProperty('chainright.angle', rightChainAngle)
            setProperty('chainright.visible', true)
            addLuaSprite('chainright')

            --debugPrint('made right chaingle ', rightChainAngle, ' with quadrant ', quadrant, ' formula')

            runTimer('chaintime2', 0.01, 1)

        end

    end

    if tag == 'chaintime2' then
        --debugPrint(tag)

        setProperty('chainleft.angle', 0)
        setProperty('chaindown.angle', 0)
        setProperty('chainup.angle', 0)
        setProperty('chainright.angle', 0)

        doTweenX('chainlefttweeninx', 'chainleft', (getPropertyFromGroup('strumLineNotes', 4, 'x') - 50) + 60, 0.15, 'easeIn') -- 0.15
        doTweenY('chainlefttweeniny', 'chainleft', (getPropertyFromGroup('strumLineNotes', 4, 'y') - 1500) + 60, 0.15, 'easeIn')
        doTweenX('chaindowntweeninx', 'chaindown', (getPropertyFromGroup('strumLineNotes', 5, 'x') - 50) + 60, 0.15, 'easeIn')
        doTweenY('chaindowntweeniny', 'chaindown', (getPropertyFromGroup('strumLineNotes', 5, 'y') - 1500) + 60, 0.15, 'easeIn')
        doTweenX('chainuptweeninx', 'chainup', (getPropertyFromGroup('strumLineNotes', 6, 'x') - 50) + 60, 0.15, 'easeIn')
        doTweenY('chainuptweeniny', 'chainup', (getPropertyFromGroup('strumLineNotes', 6, 'y') - 1500) + 60, 0.15, 'easeIn')
        doTweenX('chainrighttweeninx', 'chainright', (getPropertyFromGroup('strumLineNotes', 7, 'x') - 50) + 60, 0.15, 'easeIn')
        doTweenY('chainrighttweeniny', 'chainright', (getPropertyFromGroup('strumLineNotes', 7, 'y') - 1500) + 60, 0.15, 'easeIn')

        setProperty('chainleft.angle', leftChainAngle)
        setProperty('chaindown.angle', downChainAngle)
        setProperty('chainup.angle', upChainAngle)
        setProperty('chainright.angle', rightChainAngle)
        
        runTimer('chaintime3', 0.35, 1) -- 0.35

    end

    if tag == "chaintime3" then
        --debugPrint(tag)

        setProperty('chainleft.angle', 0)
        setProperty('chaindown.angle', 0)
        setProperty('chainup.angle', 0)
        setProperty('chainright.angle', 0)

        doTweenX('chainlefttweenmovex', 'chainleft', (leftNoteX - 50) + 60, 0.15, 'easeInOut')
        doTweenY('chainlefttweenmovey', 'chainleft', (leftNoteY - 1500) + 60, 0.15, 'easeInOut')
        doTweenX('chaindowntweenmovex', 'chaindown', (downNoteX - 50) + 60, 0.15, 'easeInOut')
        doTweenY('chaindowntweenmovey', 'chaindown', (downNoteY - 1500) + 60, 0.15, 'easeInOut')
        doTweenX('chainuptweenmovex', 'chainup', (upNoteX - 50) + 60, 0.15, 'easeInOut')
        doTweenY('chainuptweenmovey', 'chainup', (upNoteY - 1500) + 60, 0.15, 'easeInOut')
        doTweenX('chainrighttweenmovex', 'chainright', (rightNoteX - 50) + 60, 0.15, 'easeInOut')
        doTweenY('chainrighttweenmovey', 'chainright', (rightNoteY - 1500) + 60, 0.15, 'easeInOut') -- 0.15

        setProperty('chainleft.angle', leftChainAngle)
        setProperty('chaindown.angle', downChainAngle)
        setProperty('chainup.angle', upChainAngle)
        setProperty('chainright.angle', rightChainAngle)
        
        noteTweenX('leftx', 4, leftNoteX, 0.15, 'easeInOut')
        noteTweenY('lefty', 4, leftNoteY, 0.15, 'easeInOut');

        noteTweenX('downx', 5, downNoteX, 0.15, 'easeInOut');
        noteTweenY('downy', 5, downNoteY, 0.15, 'easeInOut');

        noteTweenX('upx', 6, upNoteX, 0.15, 'easeInOut');
        noteTweenY('upy', 6, upNoteY, 0.15, 'easeInOut');

        noteTweenX('rightx', 7, rightNoteX, 0.15, 'easeInOut');
        noteTweenY('righty', 7, rightNoteY, 0.15, 'easeInOut');

        runTimer('chaintime4', 0.15, 1) -- 0.2


    end

    if tag == "chaintime4" then
        --debugPrint(tag)

        setProperty('chainleft.angle', 0)
        setProperty('chaindown.angle', 0)
        setProperty('chainup.angle', 0)
        setProperty('chainright.angle', 0)

        doTweenX('chainlefttweenoutx', 'chainleft', (leftTempChainX - 50) + 60, 0.15, 'easeIn') --0.15
        doTweenY('chainlefttweenouty', 'chainleft', (leftTempChainY - 1500) + 60, 0.15, 'easeIn')
        doTweenX('chaindowntweenoutx', 'chaindown', (downTempChainX - 50) + 60, 0.15, 'easeIn')
        doTweenY('chaindowntweenouty', 'chaindown', (downTempChainY - 1500) + 60, 0.15, 'easeIn')
        doTweenX('chainuptweenoutx', 'chainup', (upTempChainX - 50) + 60, 0.15, 'easeIn')
        doTweenY('chainuptweenouty', 'chainup', (upTempChainY - 1500) + 60, 0.15, 'easeIn')
        doTweenX('chainrighttweenoutx', 'chainright', (rightTempChainX - 50) + 60, 0.15, 'easeIn')
        doTweenY('chainrighttweenouty', 'chainright', (rightTempChainY - 1500) + 60, 0.15, 'easeIn')

        setProperty('chainleft.angle', leftChainAngle)
        setProperty('chaindown.angle', downChainAngle)
        setProperty('chainup.angle', upChainAngle)
        setProperty('chainright.angle', rightChainAngle)

        if generalNoteY > 300 then
            setPropertyFromClass('ClientPrefs', 'downScroll', true)
        else
            setPropertyFromClass('ClientPrefs', 'downScroll', false)
        end

        runTimer('chaintime5', 0.15, 1) --0.15

    end

    if tag == "chaintime5" then
        --debugPrint(tag)

        removeLuaSprite('chainleft')
        removeLuaSprite('chaindown')
        removeLuaSprite('chainup')
        removeLuaSprite('chainright')

    end

    if tag == '60degspin' then

        setPropertyFromGroup('strumLineNotes', 0, 'angle', getPropertyFromGroup('strumLineNotes', 0, 'angle') + 60)
        setPropertyFromGroup('strumLineNotes', 1, 'angle', getPropertyFromGroup('strumLineNotes', 1, 'angle') + 60)
        setPropertyFromGroup('strumLineNotes', 2, 'angle', getPropertyFromGroup('strumLineNotes', 2, 'angle') + 60)
        setPropertyFromGroup('strumLineNotes', 3, 'angle', getPropertyFromGroup('strumLineNotes', 3, 'angle') + 60)
        setPropertyFromGroup('strumLineNotes', 4, 'angle', getPropertyFromGroup('strumLineNotes', 4, 'angle') + 60)
        setPropertyFromGroup('strumLineNotes', 5, 'angle', getPropertyFromGroup('strumLineNotes', 5, 'angle') + 60)
        setPropertyFromGroup('strumLineNotes', 6, 'angle', getPropertyFromGroup('strumLineNotes', 6, 'angle') + 60)
        setPropertyFromGroup('strumLineNotes', 7, 'angle', getPropertyFromGroup('strumLineNotes', 7, 'angle') + 60)

        if loopsLeft == 0 then
            setPropertyFromGroup('strumLineNotes', 0, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 1, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 2, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 3, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 4, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 5, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 6, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 7, 'angle', 0)
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'chainlefttweeninx' then
        cameraShake(game, 0.025, 0.2)
        cameraShake(game, 0.015, 0.5)

    end
end
