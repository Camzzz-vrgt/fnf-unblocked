function onCreate() 
	for i,v in ipairs({'Front trees','Back trees','Trees','Post'}) do
		makeLuaSprite(v,'stages/BNB/'..v..' BNB',575,400)
		scaleObject(v, 0.75,0.75)
		if v == 'Trees' then
			setScrollFactor(v, 0.9, 0.9)
		end
		addLuaSprite(v, v == 'Front trees')
	end
	--setProperty('cameraSpeed', 10.5)
	if shadersEnabled then	
		makeLuaSprite("spooky",'',555,250)
		makeGraphic("spooky",1,1,'FFFFFF')
		setProperty("spooky.color", 0xFF0000)
		scaleObject("spooky", 3200, 3200)
		setProperty("spooky.visible", false)
		addLuaSprite("spooky")
		setSpriteShader("spooky", "wavyOil")
		makeLuaSprite('winterVibe')
    	setSpriteShader('winterVibe', 'winterVibe')
		runHaxeCode([[
			game.camGame.setFilters([new ShaderFilter(game.getLuaObject('winterVibe').shader)]);
		]])
	end
end

function onUpdatePost()
	setShaderFloat('winterVibe', "iTime", os.clock())
	if getProperty("spooky.visible") then
		setShaderFloat("spooky", "iTime", os.clock())
	end
end

function showBG()
	for _,v in ipairs({'Front trees','Back trees','Trees','Post','spooky'}) do
		setProperty(v..".visible", not getProperty(v..".visible"))
	end
end

function shaderToggle(toggle)
	if not shadersEnabled then
		return
	end
	if toggle then
		runHaxeCode([[
			game.camGame.setFilters([new ShaderFilter(game.getLuaObject('winterVibe').shader)]);
		]])
	else
		runHaxeCode([[
			game.camGame.setFilters([]);
		]])
	end
end

function onStepHit()
	if curSection == 53 or curSection == 57 or curSection == 61 or curSection == 65 then
		if curStep % 8 == 0 then
			onSectionHit()
		end
	end
end

randAngle = 1
angles = {0,90,180,360}
function onSectionHit()
    if curStep >= 799 and curStep <= 1055 then
		randAngle = getRandomInt(1,#angles,tostring(randAngle))
		setProperty("spooky.angle", angles[randAngle])
    end
end