function onCreate()
    makeLuaSprite('bg', 'backroom', -600, 0)
    addLuaSprite('bg', false)
    scaleObject('bg', 2.7, 2.7)
    setProperty('bg.antialiasing', false)
end
function onCreatePost()

    setProperty('timeBar.color', getColorFromHex('746cfd'))
    setProperty('scoreTxt.color', getColorFromHex('746cfd'))
    
    end

    