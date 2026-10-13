function onCreatePost()
    makeAnimatedLuaSprite('back', 'stages/obey/trippy')
    addAnimationByPrefix('back', 'idle', 'wibblywobbly', flashingLights and 12 or 0, true)

    scaleObject('back', 4, 4)
    addLuaSprite('back')

    loadGraphic('healthBarBG', 'stages/obey/healty')
    setObjectOrder('healthBarBG', getObjectOrder('iconP1') - 1)

    setProperty('healthBarBG.xAdd', 0)
    setProperty('healthBarBG.yAdd', -1)

    triggerEvent('Camera Follow Pos', getMidpointX('back'), getMidpointY('back'))

    --close(true)
end