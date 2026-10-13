function onCreatePost()
    initLuaShader("VCR")
    initLuaShader("oldtimey")
    initLuaShader("crt")
    initLuaShader("ntsc")
    initLuaShader("rain")
    initLuaShader("bloom")
    
    makeLuaSprite("chromatic")
    makeGraphic("chromatic", screenWidth, screenHeight)
    
    setSpriteShader("chromatic", "VCR")
	
	makeLuaSprite("oldtimey")
    makeGraphic("oldtimey", screenWidth, screenHeight)
	
	makeLuaSprite("VHS")
    makeGraphic("VHS", screenWidth, screenHeight)
	
	
	makeLuaSprite("crt")
    makeGraphic("crt", screenWidth, screenHeight)
	makeLuaSprite("ntsc")
    makeGraphic("ntsc", screenWidth, screenHeight)
	
	makeLuaSprite("rain")
    makeGraphic("rain", screenWidth, screenHeight)
	
	makeLuaSprite("bloom")
    makeGraphic("bloom", screenWidth, screenHeight)
	
    setProperty('camZooming',true)
   
	
	
    

    setSpriteShader("oldtimey", "oldtimey")
    setSpriteShader("chromatic", "VCR")
    setSpriteShader("crt", "crt")
    setSpriteShader("ntsc", "ntsc")
    setSpriteShader("rain", "rain")
    setSpriteShader("bloom", "bloom")
    addHaxeLibrary("ShaderFilter", "openfl.filters")
     runHaxeCode([[
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("oldtimey").shader),new ShaderFilter(game.getLuaObject("chromatic").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("chromatic").shader)]);
       
    ]])

    checkChrom();
end

function setChrome(chromeOffset)
    setShaderFloat("chromatic", "rOffset", chromeOffset);
    setShaderFloat("chromatic", "gOffset", 0.0);
    setShaderFloat("chromatic", "bOffset", chromeOffset * -1);
	
end

function checkChrom()
    setChrome(0.0020);
end
function onStepHit()

	if curStep == 544 or curStep == 816 or curStep == 1104 or curStep == 1584 or curStep == 2000 or curStep == 2256 then
	
	    runHaxeCode([[
       	
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("oldtimey").shader),new ShaderFilter(game.getLuaObject("ntsc").shader),new ShaderFilter(game.getLuaObject("crt").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("crt").shader)]);
       
 
    ]])
	end
	if curStep == 560 or curStep == 1872 or curStep == 2032 or curStep == 2384 then
	
	   runHaxeCode([[
       game.camGame.setFilters([new ShaderFilter(game.getLuaObject("chromatic").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("chromatic").shader)]);
       
    ]])
	end
	if curStep == 848 then
	
	   runHaxeCode([[
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("chromatic").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("chromatic").shader)]);
       
    ]])
	end
	if curStep == 1328 then
	
	   runHaxeCode([[
       game.camGame.setFilters([new ShaderFilter(game.getLuaObject("chromatic").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("chromatic").shader)]);
       
    ]])
	end
	if curStep == 2512 then
	
	
	runHaxeCode([[
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("bloom").shader),new ShaderFilter(game.getLuaObject("oldtimey").shader),new ShaderFilter(game.getLuaObject("rain").shader),new ShaderFilter(game.getLuaObject("chromatic").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("bloom").shader),new ShaderFilter(game.getLuaObject("chromatic").shader)]);
       
    ]])
	end
	end
	 function onUpdate(elapsed)
            setShaderFloat('ntsc', 'iTime', os.clock())
            setShaderFloat('crt', 'iTime', os.clock())
            setShaderFloat('VHS', 'iTime', os.clock())
            setShaderFloat('ntsc', 'iTime', os.clock())
           setShaderFloat('bloom', 'iTime', os.clock())
			setShaderFloat('rain', 'iTime', os.clock())
    setShaderFloat('rain', 'iIntensity', 0.2)
    setShaderFloat('rain', 'iTimescale', 0.7)
        end