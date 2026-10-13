function onCreate()

     makeLuaSprite('sky', 'leStage/sky')
     scaleObject('sky', 2, 1.5)
     screenCenter('sky')
     makeLuaSprite('trees', 'leStage/trees')
     scaleObject('trees', 2, 1.5)
     screenCenter('trees')
     makeLuaSprite('fence', 'leStage/fence', -1200, -400)
     scaleObject('fence', 2, 1.5)
     makeAnimatedLuaSprite('jeep', 'leStage/jeep', 282, 430)
     luaSpriteAddAnimationByPrefix('jeep', 'JeepBeat', 'JeepBeat', 24, false)
     scaleObject('jeep', 1.4, 1.3)
     makeAnimatedLuaSprite('rain', 'leStage/rain', -1200, -400)
     luaSpriteAddAnimationByPrefix('rain', 'rainanim', 'rainanim', 24, true)
     scaleObject('rain', 2, 1.5)
     makeLuaSprite('overlay', 'leStage/overlay', -1200, -400)
     scaleObject('overlay', 2, 1.5)
     setBlendMode('overlay', 'add')
     makeLuaSprite('thing', 'leStage/JurassicThingu')
     scaleObject('thing', 0.7, 0.7)
     screenCenter('thing')
     setObjectCamera('thing', 'hud')

     addLuaSprite('sky')
     addLuaSprite('trees')
     addLuaSprite('fence')
     addLuaSprite('jeep')
     addLuaSprite('rain', true)
     addLuaSprite('overlay', true)
     addLuaSprite('thing', true)
end

function onCreatePost()
     setProperty('gf.visible', false)
end

function onBeatHit()
     if curBeat %2 == 0 then
          triggerEvent('Add Camera Zoom', 0.056, 0.000)
          objectPlayAnimation('jeep', 'JeepBeat', true)
     end
end