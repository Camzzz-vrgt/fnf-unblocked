function onCreatePost()
        runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.01);
            shader0.setFloat('effectTime',0.01);
            ]])
			

end

function onStepHit()
    if curStep == 944 then
        runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.15);
            shader0.setFloat('effectTime',0.05);
            ]])
    end
end