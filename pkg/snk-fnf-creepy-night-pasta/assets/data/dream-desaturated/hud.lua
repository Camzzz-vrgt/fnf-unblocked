function onCreate()
    luaDebugMode = true
   
end
function onCreatePost()
    makeLuaSprite('barr','barrs/tmk',320, 560)
    setProperty('barr.scale.x',1.05)
    setProperty('barr.scale.y',0.8)
    setObjectCamera('barr','hud')
    addLuaSprite('barr',true)
    setObjectOrder('barr', getObjectOrder('healthBar') + 4)

    if downscroll then
     setProperty('barr.y', 0);
    end
end

function onUpdate()
    setProperty('barr.alpha',getProperty('healthBar.alpha'))
   
end