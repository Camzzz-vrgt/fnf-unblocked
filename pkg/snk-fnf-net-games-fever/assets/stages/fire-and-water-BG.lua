function onCreatePost() 
    loadGraphic('healthBarBG', 'fireboy-and-watergirl/HUD')
    setObjectOrder('healthBarBG', getObjectOrder('iconP1') - 1)
end

function onUpdatePost()
    if not downscroll then
        setProperty('healthBar.scale.y', 4)
        setProperty('healthBar.scale.x', 1.2)

        setProperty('healthBarBG.xAdd', -120)
        setProperty('healthBarBG.yAdd', -126)

        setProperty('healthBar.y', 626)
    end
    if downscroll then
        setProperty('healthBar.scale.y', 0.4)
        setProperty('healthBar.scale.x', 1.3)
    
        setProperty('healthBarBG.xAdd', -10)
        setProperty('healthBarBG.yAdd', -106)

        setProperty('healthBar.x', 367)
        setProperty('healthBarBG.x', 222)
        setProperty('healthBarBG.y', -60)
        setProperty('healthBar.y', 10)

        setProperty('iconP1.y', -10)
        setProperty('iconP2.y', -10)
        setProperty('iconP3.y', -40)
    end
end