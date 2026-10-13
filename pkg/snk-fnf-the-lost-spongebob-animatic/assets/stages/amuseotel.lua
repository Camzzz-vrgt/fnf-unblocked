--bonjour reda je sais que tu passeras la donc je t'explique le code

function onCreatePost()

 setProperty('gf.visible', false)
 runTimer('bougeau', 1, 1)
end


function onCreate()


    makeLuaSprite('eau1', 'eau1', 620, 30)
    setLuaSpriteScrollFactor('eau1', 1.0, 1.0)
    scaleObject('eau1', 1.2, 1.2)
    addLuaSprite('eau1', false)

    
    makeLuaSprite('eau2', 'eau2', 620, 30)
    setLuaSpriteScrollFactor('eau2', 1.0, 1.0)
    scaleObject('eau2', 1.3, 1.3)
    addLuaSprite('eau2', false)
    
    makeLuaSprite('eau3', 'eau3', 620, 30)
    setLuaSpriteScrollFactor('eau3', 1.0, 1.0)
    scaleObject('eau3', 1.2, 1.2)
    addLuaSprite('eau3', false)
    
    makeLuaSprite('AmuseOtel', 'AmuseOtel', 620, 30)
    setLuaSpriteScrollFactor('AmuseOtel', 1.0, 1.0)
    scaleObject('AmuseOtel', 1.2, 1.2)
    addLuaSprite('AmuseOtel', false)
    
    makeLuaSprite('Floaty', 'Floaty', 620, 30)
    setLuaSpriteScrollFactor('Floaty', 1.0, 1.0)
    scaleObject('Floaty', 1.2, 1.2)
    addLuaSprite('Floaty', false)
end

function onUpdate()
  if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos / 1000) * (bpm / 100)
    local newPosition = 10 - 20 * math.sin((currentBeat * 0.25) * math.pi)
    local newPosition2 = 5 - 7 * math.sin((currentBeat * 0.25) * math.pi)
    local newPosition3 = 620 - 7 * math.sin((currentBeat * 0.25) * math.pi)

    setProperty('Floaty.y', newPosition2)
    setProperty('dad.y', newPosition3)
    setProperty('eau3.x', newPosition)
  end
  rea()
  rea2()
end


function rea()

 local random = math.random(0, 20)

 if random == 1 then
   doTweenAlpha('eau3', 'eau3', 0, 1, 'linear')
   doTweenAlpha('eau2', 'eau2', 1, 1, 'linear')
 end
end

function rea2()
 local random = math.random(0, 20)

 if random == 6 then
   doTweenAlpha('eau3', 'eau3', 1, 1, 'linear')
   doTweenAlpha('eau2', 'eau2', 0, 1, 'linear')
 end
end





