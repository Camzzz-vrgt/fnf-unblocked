function onCreatePost() 
    makeLuaSprite('back', 'stages/rat/mouseBack')
    addLuaSprite('back') 

    makeLuaSprite('gorix', 'stages/rat/gorix')
    setObjectCamera('gorix', 'camHUD')

    addLuaSprite('gorix', true)

    makeAnimatedLuaSprite('graib', 'stages/rat/grain')
    addAnimationByPrefix('graib', 'borin g', 'idle')

    setObjectCamera('graib', 'camHUD')
    scaleObject('graib', 4, 4)

    addLuaSprite('graib', true)  

    makeLuaSprite('viggy', 'stages/rat/vignette')
    setObjectCamera('viggy', 'camOther')
    addLuaSprite('viggy') 

    makeAnimatedLuaSprite('fire', 'stages/rat/firefireburningfire')
    addAnimationByPrefix('fire', 'burning', 'aaahfire', 48, true)

    scaleObject('fire', 2, 1.75)
    setProperty('fire.alpha', 0)

    setProperty('healthBar.scale.y', 4)

    loadGraphic('healthBarBG', 'stages/rat/health')
    setObjectOrder('healthBarBG', getObjectOrder('iconP1') - 1)

    setProperty('healthBarBG.xAdd', -120)
    setProperty('healthBarBG.yAdd', -126)

    addCharacterToList('rat', 'dad')

    runHaxeCode([[
        shader = new ShaderFilter(game.createRuntimeShader('gray'));

        game.camGame.setFilters([shader]);
        game.camHUD.setFilters([shader]);
    ]])

    --close(true)
end