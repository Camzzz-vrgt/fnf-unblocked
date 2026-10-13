function onCreatePost()
    makeLuaSprite("S1",nil,1)
    setSpriteShader("S1", "mirrorRepeat")

    runHaxeCode([[
        trace(ShaderFilter);
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("S1").shader)]);
	]])
end

function onUpdatePost()
    setShaderFloat('S1','zoom', getProperty('S1.x'))
end


function onEvent(n,v1,v2)
    if n == 'NEW Add Camera Zoom' then
        doTweenX('ZoomX','S1',v1,0.5,'expoOut')
    end
end