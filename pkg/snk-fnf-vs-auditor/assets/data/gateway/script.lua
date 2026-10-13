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

local downscroll = false;
local middlescroll = false;
 
function onCreate()

    makeAnimatedLuaSprite('transition', 'gateway/transitionGateway', -30, -10);
    addAnimationByPrefix('transition', '2fest', 'play', 24, true);
    setObjectCamera('transition', 'camOther');
    addLuaSprite('transition', true);

    downscroll = getPropertyFromClass('ClientPrefs', 'downScroll');
    middlescroll = getPropertyFromClass('ClientPrefs', 'middleScroll');

    addCharacterToList('spikeDeath', 'boyfriend');

    makeAnimatedLuaSprite('spikeDeath', 'spikeDeath');
    luaSpriteAddAnimationByPrefix('spikeDeath', 'bfDies', 'BF dies', 24, false);
    luaSpriteAddAnimationByPrefix('spikeDeath', 'bfDeadLoop', 'BF Dead Loop', 24, true);
    luaSpriteAddAnimationByPrefix('spikeDeath', 'bfDeadConfirm', 'BF Dead confirm', 24, false);

    setPropertyFromClass('GameOverSubstate', 'characterName', 'spikeDeath');

    makeAnimatedLuaSprite('AuditorStrings', 'AuditorStrings', -200, 275);
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Give Up', 'Strings', 0);
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Ugh', 'Strings', 1);
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Gaaahhh', 'Strings', 2);
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Incompetent', 'Strings', 3);
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Suffer', 'Strings', 4);
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Goodbye', 'Strings', 5);
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Die', 'Strings', 6);
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Futile', 'Strings', 7);
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Worthless', 'Strings', 8)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'All In Vain', 'Strings', 9)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Haha', 'Strings', 10)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Worm', 'Strings', 11)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Youre Nothing', 'Strings', 12)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Get Out', 'Strings', 13)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Go Away', 'Strings', 14)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Parasite', 'Strings', 15)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Insignificant', 'Strings', 16)
    scaleLuaSprite('AuditorStrings', 2, 2)
    addLuaSprite('AuditorStrings', true)
    setPropertyLuaSprite('AuditorStrings', 'alpha', 0)

    makeAnimatedLuaSprite('AuditorMissStrings', 'AuditorStrings', -30, 200);
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Failure', 'Strings', 17)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Waste Of Space', 'Strings', 18)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Pathetic', 'Strings', 19)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Get Out', 'Strings', 13)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Awful', 'Strings', 20)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Incorrect', 'Strings', 21)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Hilarious', 'Strings', 22)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Die Already', 'Strings', 23)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Do That Again', 'Strings', 24)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Ha', 'Strings', 25)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Unbelievable', 'Strings', 26)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'How Sad', 'Strings', 27)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Disappointing', 'Strings', 28)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Idiotic', 'Strings', 29)
    scaleLuaSprite('AuditorMissStrings', 2, 2)
    addLuaSprite('AuditorMissStrings', true)
    setPropertyLuaSprite('AuditorMissStrings', 'alpha', 0)

end

function onStartCountdown()
    if not allowCountdown then
        runTimer('wait1', 2, 1);
        setProperty('camFollow.x', getProperty('stage.x') + 3700);
	    setProperty('camFollow.y', getProperty('stage.y') + 3500);
        setProperty('isCameraOnForcedPos', true);
        setProperty('camHUD.alpha', 0);
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end

function onDestroy()
    setPropertyFromClass('ClientPrefs', 'downScroll', downscroll)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    runTimer('AuditorAlpha2', 0.3, 1)
end

function noteMiss()
    runTimer('AuditorAlpha2', 0.3, 1)
    local unluckyRoll = math.random(1, 70)
    if unluckyRoll >= 66 then
        runTimer('AuditorMissString', 0, 1)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)

    local luckyRoll = math.random(1, 100)

    if (luckyRoll >= 94 and isSustainNote == false) then
        runTimer('AuditorStringTime', 0, 1)
        runTimer('AuditorAlpha', 0.3, 1)
	end
end

function onEvent(name, value1, value2)

    if name == 'notemove' then

        noteTweenAlpha('leftdad', 0, 0, 0.5, 'linear');
        noteTweenAlpha('downdad', 1, 0, 0.5, 'linear');
        noteTweenAlpha('updad', 2, 0, 0.5, 'linear');
        noteTweenAlpha('rightdad', 3, 0, 0.5, 'linear');

        generalNoteY = 0

        if value1 == 'true' then
            --debugPrint('keeping on half');
            if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
                --debugPrint('bottom half');
                generalNoteY = math.random(360, 520);
            else
                --debugPrint('top half');
                generalNoteY = math.random(80, 240);
            end
        else
            -- debugPrint('moving anywhere');
            if math.random(0,100) <= 50 then
                -- debugPrint('bottom half');
                generalNoteY = math.random(360, 520);
            else
                -- debugPrint('top half');
                generalNoteY = math.random(80, 240);
            end
            
        end
        -- debugPrint(generalNoteY)

        leftNoteY = 0
        downNoteY = 0
        upNoteY = 0
        rightNoteY = 0

        leftNoteY = generalNoteY + math.random(-35,35)
        downNoteY = generalNoteY + math.random(-35,35)
        upNoteY = generalNoteY + math.random(-35,35)
        rightNoteY = generalNoteY + math.random(-35,35)

        leftNoteX = 0
        downNoteX = 0
        upNoteX = 0
        rightNoteX = 0

        centerX = math.random(315, 865)
        leftNoteX = math.random(40, centerX - 120)
        rightNoteX = math.random(centerX + 120, 1140)
        downNoteX = math.random(leftNoteX + 80, centerX)
        upNoteX = math.random(centerX + 80, rightNoteX - 80)
        
        runTimer('chaintime1', 0.02, 4)

    end

    if name == 'notedefault' then

        if middlescroll == true then
            middlescroll = 2
        else
            middlescroll = 1
        end

        setPropertyFromClass('ClientPrefs', 'downScroll', downscroll)

        generalNoteY = defaultPlayerStrumY0

        leftNoteY = defaultPlayerStrumY0
        downNoteY = defaultPlayerStrumY1
        upNoteY = defaultPlayerStrumY2
        rightNoteY = defaultPlayerStrumY3

        leftNoteX = defaultPlayerStrumX0
        downNoteX = defaultPlayerStrumX1
        upNoteX = defaultPlayerStrumX2
        rightNoteX = defaultPlayerStrumX3

        noteTweenAlpha('leftdad', 0, 1 / middlescroll, 0.5, 'linear');
        noteTweenAlpha('downdad', 1, 1 / middlescroll, 0.5, 'linear');
        noteTweenAlpha('updad', 2, 1 / middlescroll, 0.5, 'linear');
        noteTweenAlpha('rightdad', 3, 1 / middlescroll, 0.5, 'linear');

        runTimer('chaintime1', 0.02, 4)

    end
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'wait1' then
        doTweenAlpha('camhudalpha', 'camHUD', 1, 2, 'linear')
        doTweenZoom('camzoomtween', 'camGame', 0.3, 2, 'quadOut')
        setProperty('isCameraOnForcedPos', false);
        setProperty('camFollow.x', getProperty('gf.x'));
	    setProperty('camFollow.y', getProperty('gf.y'));
        removeLuaSprite('transition', true);
        runTimer('wait2', 2, 1);
    end

    if tag == 'wait2' then
        startCountdown();
    end

    if tag == 'AuditorStringTime' then
        playSound('staticSound', 1)
        setPropertyLuaSprite('AuditorStrings', 'alpha', 1)
        counter = math.random(0, 16)
        stringY = math.random(-200,-400)
        setPropertyLuaSprite('AuditorStrings', 'y', stringY)
        AuditorStrings[counter]()
	end

    if tag == 'AuditorMissString' then
        playSound('staticSound')
        setPropertyLuaSprite('AuditorMissStrings', 'alpha', 1)
        misscounter = math.random(0, 13)
        stringY = math.random(50,125)
        setPropertyLuaSprite('AuditorStrings', 'y', stringY)
        AuditorMissStrings[misscounter]()
        runTimer('AuditorMissAlpha', 0.33, 1)
	end

    if tag == 'stringAngles' then
        setStringAngle = math.random(-5,5)
        setProperty('AuditorStrings.angle', setStringAngle)
    end

    if tag == 'stringMissAngles' then
        setStringAngle = math.random(-5,5)
        setProperty('AuditorMissStrings.angle', setStringAngle)
    end

    if tag == 'AuditorMissAlpha' then
        setPropertyLuaSprite('AuditorMissStrings', 'alpha', 0)
    end

    if tag == 'AuditorAlpha' then
        setPropertyLuaSprite('AuditorStrings', 'alpha', 0)
    end
    
    if tag == 'AuditorAlpha2' then
        setPropertyLuaSprite('AuditorStrings', 'alpha', 0)
    end

    if tag == 'chaintime1' then
        --debugPrint(tag)
        --debugPrint(loopsLeft)

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

end

function onTweenCompleted(tag)
        
    if tag == 'chainlefttweeninx' then
        cameraShake('camHUD', 0.025, 0.2)
        cameraShake('camHUD', 0.015, 0.5)
    end

    if tag == 'camzoomtween' then
		setProperty('camHUD.visible', true)
		setProperty('defaultCamZoom', 0.3)
	end
end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	-- return Function_Stop if you want to stop the player from going into the game over screen
    setProperty('boyfriend.curCharacter', 'spikeDeath')
    playSound('fnf_loss_sfx')
    playSound('spikedeathsound')
    playMusic('gameOver', 1, true)
	return Function_Continue;
end

function onGameOverConfirm(retry)
	-- Called when you Press Enter/Esc on Game Over
	-- If you've pressed Esc, value "retry" will be false
    setProperty('boyfriend.curCharacter', 'spikeDeath')
    luaSpritePlayAnimation('bfDeadConfirm')
    playMusic('gameOverEnd', 1, true)
end

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('cut4');
        seenCutscene = true;
        return Function_Stop
    end
    return Function_Continue
end

AuditorStrings = {
    [0] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Give Up')
        runTimer('stringAngles', 0.02, 90)
    end,

    [1] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Ugh')
        runTimer('stringAngles', 0.02, 90)
    end,

    [2] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Gaaahhh')
        runTimer('stringAngles', 0.02, 90)
    end,

    [3] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Incompetent')
        runTimer('stringAngles', 0.02, 90)
    end,

    [4] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Suffer')
        runTimer('stringAngles', 0.02, 90)
    end,

    [5] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Goodbye')
        runTimer('stringAngles', 0.02, 90)
    end,

    [6] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Die')
        runTimer('stringAngles', 0.02, 90)
    end,

    [7] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Futile')
        runTimer('stringAngles', 0.02, 90)
    end,

    [8] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Worthless')
        runTimer('stringAngles', 0.02, 90)
    end,

    [9] = function()
        luaSpritePlayAnimation('AuditorStrings', 'All In Vain')
        runTimer('stringAngles', 0.02, 90)
    end,

    [10] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Haha')
        runTimer('stringAngles', 0.02, 90)
    end,

    [11] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Worm')
        runTimer('stringAngles', 0.02, 90)
    end,

    [12] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Youre Nothing')
        runTimer('stringAngles', 0.02, 90)
    end,

    [13] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Get Out')
        runTimer('stringAngles', 0.02, 90)
    end,

    [14] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Go Away')
        runTimer('stringAngles', 0.02, 90)
    end,

    [15] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Parasite')
        runTimer('stringAngles', 0.02, 90)
    end,

    [16] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Insignificant')
        runTimer('stringAngles', 0.02, 90)
    end,
}

AuditorMissStrings = {
    [0] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Failure')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [1] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Waste Of Space')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [2] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Pathetic')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [3] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Get Out')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [4] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Awful')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [5] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Incorrect')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [6] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Hilarious')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [7] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Die Already')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [8] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Do That Again')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [9] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Ha')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [10] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Unbelievable')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [11] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'How Sad')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [12] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Disappointing')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [13] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Idiotic')
        runTimer('stringMissAngles', 0.02, 90)
    end,

}