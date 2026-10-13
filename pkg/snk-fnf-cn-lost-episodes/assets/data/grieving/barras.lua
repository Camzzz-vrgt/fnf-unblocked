function onSongStart()
    CreateBars()
  
end  
function CreateBars()


    makeLuaSprite('efecto','bg/Vignette')
    addLuaSprite('efecto')
    setObjectCamera('efecto','camHUD')


    makeLuaSprite('upBarr')
    makeGraphic('upBarr',1500,500,'000000')
    addLuaSprite('upBarr')
    setObjectCamera('upBarr','camHUD')


    makeLuaSprite('downBarr')
    makeGraphic('downBarr',1500,500,'000000')
    addLuaSprite('downBarr')
    setObjectCamera('downBarr','camHUD')


    screenCenter('upBarr','X')
    screenCenter('downBarr','X')
    setProperty('upBarr.y',-1500)
    setProperty('downBarr.y',1500)
    doTweenY('moveStart', 'upBarr', -430, 1 , 'circInOut')
    doTweenY('moveStart2', 'downBarr', 620, 1 , 'circInOut')
  
end    
function onUpdate()
    if curStep==600 then
        doTweenY('moveStart', 'upBarr', -450, 1 , 'circInOut')
        doTweenY('moveStart2', 'downBarr', 660, 1 , 'circInOut')
      
    end
end        