function onCreate()
	if shadersEnabled == true then
		initLuaShader("heatwave");
		initLuaShader("grayscale");
	end
end
    
function onCreatePost()
	if shadersEnabled == true then
    makeLuaSprite("temporaryShader")
    setSpriteShader("temporaryShader", "heatwave")
    makeLuaSprite("temporaryShader2")
    setSpriteShader("temporaryShader2", "grayscale")
	
    setSpriteShader("trees", "heatwave")
	setSpriteShader("trees2", "heatwave")
	setSpriteShader("trees3", "heatwave")
	
    setSpriteShader("AIBackA", "heatwave")
	setSpriteShader("AIBackA2", "heatwave")
	setSpriteShader("AIBackA3", "heatwave")
	
    setSpriteShader("AITopA", "heatwave")
	setSpriteShader("AITopA2", "heatwave")
	setSpriteShader("AITopA3", "heatwave")
	
	setSpriteShader("AIfront", "heatwave")
	setSpriteShader("AIfront2", "heatwave")
	setSpriteShader("AIfront3", "heatwave")	 

    setShaderFloat("temporaryShader", "strength", 0.3)
    setShaderFloat("temporaryShader", "speed", 10)

    setShaderFloat("trees", "strength", 0.3)
    setShaderFloat("trees", "speed", 10)
	
    setShaderFloat("trees2", "strength", 0.3)
    setShaderFloat("trees2", "speed", 10)
	
    setShaderFloat("trees3", "strength", 0.3)
    setShaderFloat("trees3", "speed", 10)
	
    setShaderFloat("AIBackA", "strength", 0.3)
    setShaderFloat("AIBackA", "speed", 5)
	
    setShaderFloat("AIBackA2", "strength", 0.3)
    setShaderFloat("AIBackA2", "speed", 5)
	
    setShaderFloat("AIBackA3", "strength", 0.3)
    setShaderFloat("AIBackA3", "speed", 5)
	
    setShaderFloat("AITopA", "strength", 0.5)
    setShaderFloat("AITopA", "speed", 5)
	
    setShaderFloat("AITopA2", "strength", 0.5)
    setShaderFloat("AITopA2", "speed", 5)
	
    setShaderFloat("ATopA3", "strength", 0.5)
    setShaderFloat("AITopA3", "speed", 5)
	end
end

function onUpdate()
	if shadersEnabled == true then
    setShaderFloat("temporaryShader", "time", os.clock())
	setShaderFloat("trees", "time", os.clock())
	setShaderFloat("trees2", "time", os.clock())
	setShaderFloat("trees3", "time", os.clock())
	
	setShaderFloat("AIBackA", "time", os.clock())
	setShaderFloat("AIBackA2", "time", os.clock())
	setShaderFloat("AIBackA3", "time", os.clock())
	
	setShaderFloat("AITopA", "time", os.clock())
	setShaderFloat("AIBackA2", "time", os.clock())
	setShaderFloat("AIBackA3", "time", os.clock())
	
	if curStep == 256 then
		setSpriteShader("trees", "heatwave")
		setSpriteShader("trees2", "heatwave")
		setSpriteShader("trees3", "heatwave")
	
		setSpriteShader("AIfront", "heatwave")
		setSpriteShader("AIfront2", "heatwave")
		setSpriteShader("AIfront3", "heatwave")	
		
		setSpriteShader("AIBackA", "heatwave")
		setSpriteShader("AIBackA2", "heatwave")
		setSpriteShader("AIBackA3", "heatwave")
	end
	
	if curStep == 350 then
		setSpriteShader("trees", "heatwave")
		setSpriteShader("trees2", "heatwave")
		setSpriteShader("trees3", "heatwave")
	
		setSpriteShader("AIfront", "heatwave")
		setSpriteShader("AIfront2", "heatwave")
		setSpriteShader("AIfront3", "heatwave")	
	end
	
	if curStep == 1919 then
		runHaxeCode([[
			game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader2").shader)]);
			game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader2").shader)]);
			return;
		]]);
	end
	
	if curStep == 2047 then
		--debugPrint('Work you fuck')
		removeLuaSprite("temporaryShader2")
		runHaxeCode('game.camGame.setFilters([]);')
		runHaxeCode('game.camHUD.setFilters([]);')
	end
	end
end