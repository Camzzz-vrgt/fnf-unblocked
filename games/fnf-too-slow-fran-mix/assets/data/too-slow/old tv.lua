local shaderName = "old tv"

function onCreate()
    shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

    makeLuaSprite("old tv")
    makeGraphic("shaderImage", screenWidth, screenHeight)

	setSpriteShader("shaderImage", "old tv")


    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.getLuaObject("old tv").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        return;
    ]])
end

function onCreatePost()
	runHaxeCode([[
			var shaderName = "]] .. shaderName .. [[";
        
			game.initLuaShader(shaderName);
        
			var shader0 = game.createRuntimeShader(shaderName);
			game.camGame.setFilters([new ShaderFilter(shader0)]);
			game.getLuaObject("old tv").shader = shader0;
			game.camHUD.setFilters([new ShaderFilter(shader0)]);
			return;
		]])
end

function onStepHit()
	if curStep == 512 then
		removeSpriteShader('shader0')
		runHaxeCode([[
			trace(ShaderFilter);
			game.camGame.setFilters([]);
			game.camHUD.setFilters([]);
			return;
		]])
	end	
end

function onUpdate(elapsed)
	if curStep < 520 then
		setShaderFloat("old tv", "iTime", os.clock())
	end
end

function shaderCoordFix()
if curStep < 512 then
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end
end