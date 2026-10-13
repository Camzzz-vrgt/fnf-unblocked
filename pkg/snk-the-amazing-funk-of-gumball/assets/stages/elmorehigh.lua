function onCreate()
    makeLuaSprite('wall', 'school/Wall', -500, -482)
    addLuaSprite('wall')
    scaleObject('wall', 0.5, 0.5)

    makeLuaSprite('floor', 'school/Floor', -1000, 700)
    addLuaSprite('floor')
    scaleObject('floor', 0.6, 1)
end

function onCreatePost()
    initLuaShader("skew")
    setSpriteShader('floor', "skew")
end