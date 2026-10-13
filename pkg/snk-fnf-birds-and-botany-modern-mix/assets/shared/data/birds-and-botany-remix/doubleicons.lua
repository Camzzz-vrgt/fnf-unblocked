function rgbToHex(array)
return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function onCreatePost()
    makeLuaSprite('iconP3', 'icons/icon-'..getProperty('gf.healthIcon'), 0,0)

    setProperty('iconP3.y', getProperty('iconP1.y'))
    setObjectCamera('iconP3', 'hud')
    addLuaSprite('iconP3')

    setProperty("iconP3._frame.frame.y", 0)
    setProperty("iconP3._frame.frame.width", 150)
    setProperty("iconP3._frame.frame.height", 150)
    setProperty('iconP3.alpha', 0)
    setObjectOrder('iconP3', getObjectOrder('iconP2') - 1)


    makeLuaSprite('helthBar2', nil, getProperty('healthBar.x'),getProperty('healthBar.y'))
    makeGraphic('helthBar2', getProperty('healthBar.width'),getProperty('healthBar.height') / 1.7, rgbToHex(getProperty('gf.healthColorArray')))
    setObjectCamera('helthBar2', 'hud')
    addLuaSprite('helthBar2')
    setObjectOrder('helthBar2', getObjectOrder('iconP1') - 1)
end


function onUpdatePost()
    setProperty("helthBar2._frame.frame.width", (getProperty('healthBar.percent')) * -5.93 + 593)

    setProperty('iconP3.x', getProperty('iconP2.x') - 120)
    setProperty('iconP3.scale.x', getProperty('iconP2.scale.x'))
    setProperty('iconP3.scale.y', getProperty('iconP2.scale.y'))
    setProperty('iconP3.alpha', getProperty('iconP2.alpha'))
    setProperty('iconP3.visible', getProperty('iconP2.visible'))


    if getProperty('healthBar.percent') == 100 then
        setProperty('helthBar2.visible', false)
    else
        setProperty('helthBar2.visible', getProperty('healthBar.visible'))
    end


    if getProperty('iconP2.animation.curAnim.curFrame') == 0 and getProperty('iconP3._frame.frame.x') ~= 0 then
        setProperty("iconP3._frame.frame.x", 0)

    elseif getProperty('iconP2.animation.curAnim.curFrame') == 1 and getProperty('iconP3._frame.frame.x') ~= 150 then
        setProperty("iconP3._frame.frame.x", 150)
    end
end