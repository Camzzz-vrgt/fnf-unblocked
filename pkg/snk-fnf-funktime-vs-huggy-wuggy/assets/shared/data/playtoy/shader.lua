local ntscShaderName = "ntsc"
local crtShaderName = "crtTV"

local crtParams = {
    BEND_AMOUNT = 20.0,
    RGB_SHIFT_R = 0.003,
    RGB_SHIFT_G = 0.001,
    RGB_SHIFT_B = 0.003,
    SCAN_LINE_INTENSITY = 0.00,
    NOISE_SCALE = 150.0,
    NOISE_INTENSITY = 0.03,
    REFRESH_FLICKER = 15.0,
    ZOOM = -0.0,
    BEAT_RGB_STRENGTH = 0.002
}

local beatCounter = 0

function onCreate()
    shaderCoordFix()

    makeLuaSprite("shaderSprite")
    makeGraphic("shaderSprite", screenWidth, screenHeight)
    setSpriteShader("shaderSprite", crtShaderName)

    addHaxeLibrary("ShaderFilter", "openfl.filters")

    runHaxeCode([[
        var ntsc = game.createRuntimeShader("]]..ntscShaderName..[[");
        var crt = game.createRuntimeShader("]]..crtShaderName..[[");

        var filter1 = new ShaderFilter(ntsc);
        var filter2 = new ShaderFilter(crt);

        game.camGame.setFilters([filter1, filter2]);
        game.camHUD.setFilters([filter1, filter2]);

        game.getLuaObject("shaderSprite").shader = crt;
    ]])

    for param, value in pairs(crtParams) do
        setShaderFloat("shaderSprite", param, value)
    end
end

function onUpdate(elapsed)
    local time = os.clock()
    setShaderFloat("shaderSprite", "iTime", time)

    local scanPulse = 1 + 0.3 * math.sin(time * 8)
    setShaderFloat("shaderSprite", "SCAN_LINE_INTENSITY", crtParams.SCAN_LINE_INTENSITY * scanPulse)

    beatCounter = beatCounter + elapsed
    local rgbPulse = math.sin(beatCounter * math.pi) * crtParams.BEAT_RGB_STRENGTH
    setShaderFloat("shaderSprite", "RGB_SHIFT_R", crtParams.RGB_SHIFT_R + rgbPulse)
    setShaderFloat("shaderSprite", "RGB_SHIFT_B", crtParams.RGB_SHIFT_B - rgbPulse)
end

function shaderCoordFix()
    runHaxeCode([[
        resetCache = function(obj) {
            if (obj == null || obj.filters == null) return;
            obj.__cacheBitmap = null;
            obj.__cacheBitmapData = null;
        }
        refreshShaders = function(_) {
            resetCache(game.camGame.flashSprite);
            resetCache(game.camHUD.flashSprite);
            resetCache(game.camOther.flashSprite);
        }
        FlxG.signals.gameResized.add(refreshShaders);
        refreshShaders();
        return;
    ]])
    local tempDestroy = onDestroy
    function onDestroy()
        runHaxeCode([[FlxG.signals.gameResized.remove(refreshShaders); return;]])
        if tempDestroy then tempDestroy() end
    end
end
