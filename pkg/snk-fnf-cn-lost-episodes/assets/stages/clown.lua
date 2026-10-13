function onCreate()
    makeLuaSprite('5e', '5',-200, -200)
    scaleObject('5e', 0.78,0.78)
    addLuaSprite('5e')

    makeLuaSprite('4e', '4',-200, -200)
    scaleObject('4e', 0.78,0.78)
    addLuaSprite('4e')

  

   
    makeLuaSprite('3e', '3',-200, -200)
    scaleObject('3e', 0.78,0.78)
    addLuaSprite('3e')

    makeLuaSprite('2e', '2',-200, -200)
    scaleObject('2e', 0.78,0.78)
    addLuaSprite('2e')


    makeLuaSprite('1e', '1',-200, -200)
    scaleObject('1e', 0.78,0.78)
    addLuaSprite('1e')

   
    setObjectOrder('5e',0)
    setObjectOrder('4e',1)
    setObjectOrder('3e',2)
    setObjectOrder('dadGroup',3)
    setObjectOrder('2e',4)
    setObjectOrder('1e',5)

    setObjectOrder('boyfriendGroup',6)
   
end    
function onUpdate()
    setProperty('iconP1.flipX',true)
end    