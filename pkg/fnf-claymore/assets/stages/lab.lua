function onCreate()
    makeLuaSprite('idk', 'lab.shaded/idk', -1010, -400)
    makeLuaSprite('stage', 'lab.shaded/stage', -1010, -400)
    makeLuaSprite('1', 'lab.shaded/1', -1010, -400)

    setScrollFactor('idk', 1, 0)
    setScrollFactor('1', 1, 0)
     

    addLuaSprite('idk', false)
    addLuaSprite('stage', false)
    addLuaSprite('1', false)
end