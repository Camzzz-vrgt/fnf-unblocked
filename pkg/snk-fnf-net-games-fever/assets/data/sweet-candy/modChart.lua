local defaultNotePos = {};
local move = 10;
 
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end

end
local currentBeat
function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition')
    if curStep> 0  and curStep <384 then
        move = 10
        currentBeat = (songPos / 750) * (bpm / 260)
    end    
    if curStep> 384 and curStep<640 then
     move = 20
     currentBeat = (songPos / 650) * (bpm / 100)
    end
    if curStep> 640  and curStep <1023 then
        move = 10
        currentBeat = (songPos / 750) * (bpm / 260)
    end  
    if curStep> 1023 and curStep<1280 then
        move = 20
        currentBeat = (songPos / 650) * (bpm / 100)
    end  
    if curStep> 1280 then
        move = 10
        currentBeat = (songPos / 750) * (bpm / 260)
    end  

    for i = 0,7 do 
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + move * math.sin((currentBeat + i*2) * math.pi))
        setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + move * math.cos((currentBeat + i*1) * math.pi))
    
    end
    if curStep ==1290 then
        doTweenAlpha('pene','camHUD',0,1,'linear')
        CreateBars()
    end    

end

function CreateBars()

    makeLuaSprite('upBarr')
    makeGraphic('upBarr',1500,500,'000000')
    addLuaSprite('upBarr')
    setObjectCamera('upBarr','camOther')


    makeLuaSprite('downBarr')
    makeGraphic('downBarr',1500,500,'000000')
    addLuaSprite('downBarr')
    setObjectCamera('downBarr','camOther')


    screenCenter('upBarr','X')
    screenCenter('downBarr','X')
    setProperty('upBarr.y',-1400)
    setProperty('downBarr.y',1400)

	doTweenY('moveStart', 'upBarr', -430, 1 , 'CircInOut')
    doTweenY('moveStart2', 'downBarr', 630, 1 , 'CircInOut')
end   