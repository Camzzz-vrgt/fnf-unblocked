local danm = false
bump = false
bamp = false
local defaultNotePos = {};
local move = 7;

function onCreate()
    makeLuaSprite('lowBar', 'pure2', 0, 720)
    makeGraphic('lowBar', 1600, 250, '000000')
    setObjectCamera('lowBar', 'camHUD')
    addLuaSprite('lowBar', false)
    screenCenter('lowBar', 'x')

    makeLuaSprite('UpperBar', 'pure2', 0, -301)
    makeGraphic('UpperBar', 1600, 250, '000000')
    setObjectCamera('UpperBar', 'camHUD')
    addLuaSprite('UpperBar', false)
    screenCenter('UpperBar', 'x')
end
function onUpdate()
    if curStep < 128 then
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
        setProperty('healthBarBG.visible', false)
        setProperty('healthBar.visible', false)
        setProperty('hudlol.visible', false)
        setProperty('Health.visible', false)
        setProperty('timeBar.visible', false)
        setProperty('timeBarBG.visible', false)
        setProperty('timeTxt.visible', false)
        setPropertyFromGroup('playerStrums', 0, 'alpha', 0)
        setPropertyFromGroup('playerStrums', 1, 'alpha', 0)
        setPropertyFromGroup('playerStrums', 2, 'alpha', 0)
        setPropertyFromGroup('playerStrums', 3, 'alpha', 0)
        setPropertyFromGroup('opponentStrums', 0, 'alpha', 0)
        setPropertyFromGroup('opponentStrums', 1, 'alpha', 0)
        setPropertyFromGroup('opponentStrums', 2, 'alpha', 0)
        setPropertyFromGroup('opponentStrums', 3, 'alpha', 0)
    end
    if curStep == 128 or curStep == 1072 then
        bump = true
        cameraFlash('camOther', 'FFFFFF', 0.3,false)
        setProperty('camHUD.visible', true)
        setProperty('defaultCamZoom', 0.65)

        setProperty('iconP1.visible', true)
        setProperty('iconP2.visible', true)
        setProperty('healthBarBG.visible', true)
        setProperty('healthBar.visible', true)
        setProperty('hudlol.visible', true)
        setProperty('Health.visible', true)
        setProperty('timeBar.visible', true)
        setProperty('timeBarBG.visible', true)
        setProperty('timeTxt.visible', true)
    
        setPropertyFromGroup('playerStrums', 0, 'alpha', 1)
        setPropertyFromGroup('playerStrums', 1, 'alpha', 1)
        setPropertyFromGroup('playerStrums', 2, 'alpha', 1)
        setPropertyFromGroup('playerStrums', 3, 'alpha', 1)
    
        setPropertyFromGroup('opponentStrums', 0, 'alpha', 1)
        setPropertyFromGroup('opponentStrums', 1, 'alpha', 1)
        setPropertyFromGroup('opponentStrums', 2, 'alpha', 1)
        setPropertyFromGroup('opponentStrums', 3, 'alpha', 1)
    end
    if curStep == 768 then
        bump = false
        doTweenY('up', 'UpperBar', -150, 1, 'linear')
        doTweenY('down', 'lowBar', 650, 1, 'linear')
    end
    if curStep < 800 then
        setProperty('gf.visible', false)
    end
    if curStep == 800 then
        setProperty('gf.visible', true)
    end
    if curStep == 1072 then
        doTweenY('up', 'UpperBar', -301, 0.02, 'linear')
        doTweenY('down', 'lowBar', 720, 0.02, 'linear')
    end
    if curStep == 1200 then
        bamp = true
    end
    if curStep == 1328 then
        bump = false
        bamp = false
    end
    if curStep >= 1200 then
        for i = 0,7 do 
            x = getPropertyFromGroup('strumLineNotes', i, 'x')
     
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
     
            table.insert(defaultNotePos, {x,y})
        end
        songPos = getPropertyFromClass('Conductor', 'songPosition');
        currentBeat = (songPos / 350) * (bpm / 160)
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + move * math.sin((currentBeat + i*4) * math.pi))
            
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + move * math.cos((currentBeat + i*0.6) * math.pi))
        end
    end
    if curStep == 1344 then
        doTweenZoom('bnvm', 'camGame', 0.1, 1, 'linear')
        doTweenAlpha('eraefaw', 'camHUD', 0, 1, 'linear')
    end
    if curStep == 1360 then
        setProperty('camHUD.visible', false)
        setProperty('camGame.visible', false)
    end
end

function onBeatHit()
    if bamp == true then
        if curBeat % 1 == 0 then
            noteTweenAngle('wasd1', 0, -360, 0.2, 'circOut')
            noteTweenAngle('wasd2', 1, -360, 0.2, 'circOut')
            noteTweenAngle('wasd3', 2, -360, 0.2, 'circOut')
            noteTweenAngle('wasd4', 3, -360, 0.2, 'circOut')
            noteTweenAngle('wasd5', 4, -360, 0.2, 'circOut')
            noteTweenAngle('wasd6', 5, -360, 0.2, 'circOut')
            noteTweenAngle('wasd7', 6, -360, 0.2, 'circOut')
            noteTweenAngle('wasd8', 7, -360, 0.2, 'circOut')
        end
        if curBeat % 2 == 0 then
            noteTweenAngle('wasd1', 0, 360, 0.2, 'circOut')
            noteTweenAngle('wasd2', 1, 360, 0.2, 'circOut')
            noteTweenAngle('wasd3', 2, 360, 0.2, 'circOut')
            noteTweenAngle('wasd4', 3, 360, 0.2, 'circOut')
            noteTweenAngle('wasd5', 4, 360, 0.2, 'circOut')
            noteTweenAngle('wasd6', 5, 360, 0.2, 'circOut')
            noteTweenAngle('wasd7', 6, 360, 0.2, 'circOut')
            noteTweenAngle('wasd8', 7, 360, 0.2, 'circOut')
        end
    end
  
end