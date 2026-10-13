function onCreate()
    makeLuaSprite('blackBG', 'stages/skeld/blackBG', 0, 0)
    setScrollFactor('blackBG', 0.0, 0.0)
    addLuaSprite('blackBG')

    makeLuaSprite('room', 'stages/skeld/room', 0, 0)
    addLuaSprite('room')

    makeLuaSprite('chairBG1', 'stages/skeld/chairBG1', 0, 0)
    addLuaSprite('chairBG1')

    makeLuaSprite('chairBG2', 'stages/skeld/chairBG2', 0, 0)
    addLuaSprite('chairBG2')

    makeLuaSprite('table', 'stages/skeld/table', 0, 0)
    addLuaSprite('table')

    makeLuaSprite('chairFG', 'stages/skeld/chairFG', 0, 0)
    addLuaSprite('chairFG', true)

    makeLuaSprite('overlay', 'stages/skeld/overlay', 0, 0)
    setBlendMode('overlay', 'ADD')
    addLuaSprite('overlay', true)
end