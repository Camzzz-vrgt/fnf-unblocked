function onCreatePost()
        runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.05);
            shader0.setFloat('effectTime',0.1);
            ]])
			

end

function onStepHit()
    if curStep == 1344 then
        runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.1);
            shader0.setFloat('effectTime',0.1);
            ]])
    end
    if curStep == 1888 then
        runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.11);
            shader0.setFloat('effectTime',0.1);
            ]])
    end
    if curStep == 2427 then
            runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.4);
            shader0.setFloat('effectTime',0.1);
            ]])
    end
    if curStep == 2432 then
            runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.5);
            shader0.setFloat('effectTime',0.2);
            ]])
    end
    if curStep == 2440 then
            runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.6);
            shader0.setFloat('effectTime',0.3);
            ]])
    end

    if curStep == 2448 then
            runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.7);
            shader0.setFloat('effectTime',0.4);
            ]])
    end
end