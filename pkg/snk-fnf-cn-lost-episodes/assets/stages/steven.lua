function onCreate()

    makeLuaSprite('white')
    makeGraphic('white',9000,9000,'FFFFFF')
    addLuaSprite('white')

    makeLuaSprite('bg', 'bg/stages/steven-UV-GONE/695_sin_titulo_20230905224647',0, 0)
    scaleObject('bg', 4, 2.3)
    screenCenter('bg','X')
    addLuaSprite('bg')

    setProperty('white.y',-600)
    setProperty('white.x',-700)
    setProperty('bg.y',-40)
    
end    
function onSongStart()
    CreateBars()
  
end    
function onUpdate()
    setProperty('iconP1.flipX',true)
end    
function CreateBars()

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
    doTweenY('moveStart', 'upBarr', -450, 1 , 'circInOut')
    doTweenY('moveStart2', 'downBarr', 680, 1 , 'circInOut')
  
end    