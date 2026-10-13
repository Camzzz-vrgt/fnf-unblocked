local currentBarPorcent = 0
local heightBar = 0
function onCreatePost()
    makeLuaSprite('ScareBarImage','Scarebar',screenWidth - 100,100)
    scaleObject('ScareBarImage',1.2,1.1)
    setObjectCamera('ScareBarImage','hud')
    addLuaSprite('ScareBarImage',true)


    makeLuaSprite('ScareBarBg','ScarebarBG',getProperty('ScareBarImage.x') + 15,getProperty('ScareBarImage.y'))
    setObjectCamera('ScareBarBg','hud')
    scaleObject('ScareBarBg',0.82,1.1)
    addLuaSprite('ScareBarBg',false)
    
    makeLuaSprite('ScareBarBar','',getProperty('ScareBarImage.x') + 20,getProperty('ScareBarImage.y'))
    setObjectCamera('ScareBarBar','hud')
    makeGraphic('ScareBarBar',getProperty('ScareBarBg.width')/2,getProperty('ScareBarBg.height'),'FF0000')

    addLuaSprite('ScareBarBar',false)
end
function onUpdate()
    if currentBarPorcent == 0 then
        setGraphicSize('ScareBarBar',getProperty('ScareBarBg.width')/1.8 * getProperty('ScareBarBg.scale.x'),0)
    else
        setGraphicSize('ScareBarBar',getProperty('ScareBarBg.width')/1.8 * getProperty('ScareBarBg.scale.x'),getProperty('ScareBarBg.height')/1.132* currentBarPorcent)
    end
    setProperty('ScareBarBar.x',getProperty('ScareBarBg.x') + 20)
    setProperty('ScareBarBar.x',getProperty('ScareBarBg.x') + 20)
    setProperty('ScareBarBar.y',getProperty('ScareBarImage.y') + 305 - getProperty('ScareBarBar.height'))

    if currentBarPorcent > 1 then
        currentBarPorcent  = 1
    end
    if currentBarPorcent <= 0 then
        currentBarPorcent  = 0
        setGraphicSize('ScareBarBar',getProperty('ScareBarBg.width')/1.8 * getProperty('ScareBarBg.scale.x'),0)
        setProperty('ScareBarBar.visible',false)
    else
        setProperty('ScareBarBar.visible',true)
    end
end
function opponentNoteHit()

    if currentBarPorcent < 1 then
        currentBarPorcent = currentBarPorcent + 0.0022
    end
end
function goodNoteHit()
    if currentBarPorcent > 0 then
        currentBarPorcent = currentBarPorcent - 0.0023
    end
end
function noteMiss(id,dir,type,sustain)
    if type == '' then
        if currentBarPorcent < 1 then
            currentBarPorcent = currentBarPorcent + 0.0023
        end
    end
end
function onBeatHit()
    if curStep >= 1384 and curStep < 2143 then
        if getProperty('health') > 0.08 and currentBarPorcent < 1 or currentBarPorcent == 1 then
            setProperty('health',getProperty('health') - 0.046)
        end
    end
end