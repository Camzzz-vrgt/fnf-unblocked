function onCreatePost()
initLuaShader("Glitchy")
initLuaShader("CameraGlitch")
initLuaShader("file")
makeLuaSprite("Shader")
setSpriteShader("Shader", "blur")

makeLuaSprite("Shader2")
setSpriteShader("Shader2", "old film")


runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader),new ShaderFilter(game.getLuaObject("Shader2").shader)]);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader),new ShaderFilter(game.getLuaObject("Shader2").shader)]);
		]])

addHaxeLibrary("ShaderFilter1", "openfl.filters")
setShaderFloat("Shader", "blurWidth", 0)
setShaderFloat("Shader", "cx", 0.5)
setShaderFloat("Shader", "cy", 0.5)


makeAnimatedLuaSprite('S', 'screenstatic', 0, 0)
scaleObject('S', 1, 1);
setObjectCamera('S', 'hud')
addAnimationByPrefix('S','S','screenstatic',24,true)
addLuaSprite('S',true)

setProperty('S.alpha', 0)

makeLuaSprite('vig', 'vig', 0,0)
setObjectCamera('vig', 'other')
setProperty('vig.alpha', 0.5)
addLuaSprite('vig', false)
end

dodo = true
blurval = 0
function onUpdatePost()
if curStep < 1024 or curStep > 1153 then
setShaderFloat("Shader", "blurWidth", blurval)
end

if dodo then
setShaderFloat("Shader2", "iTime", os.clock())
end



if curStep == 128 or curStep == 512 or curStep == 1152 then
setSpriteShader("Shader", "blur")

runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader)]);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader)]);
		]])
setShaderFloat("Shader", "cx", 0.5)
setShaderFloat("Shader", "cy", 0.5)
dodo = false
elseif curStep == 384 then
setSpriteShader("Shader", "blur")
setSpriteShader("Shader2", "old film")
dodo = true
runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader),new ShaderFilter(game.getLuaObject("Shader2").shader)]);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader),new ShaderFilter(game.getLuaObject("Shader2").shader)]);
		]])
setShaderFloat("Shader", "cx", 0.5)
setShaderFloat("Shader", "cy", 0.5)
setProperty('vig.alpha', 0.5)
elseif curStep == 1024 then
setSpriteShader("Shader", "CameraGlitch")
setSpriteShader("Shader2", "old film")
makeLuaSprite("Shader3")
setSpriteShader("Shader3", "file")
runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);

		]])
addHaxeLibrary("ShaderFilter1", "openfl.filters")
dodo = true
elseif curStep > 1025 and curStep < 1152 then
setShaderFloat("Shader", "iTime", os.clock())
setShaderFloat("Shader3", "iTime", os.clock())
elseif curStep == 1280 or curStep == 1536 then
setSpriteShader("Shader", "blur")
setSpriteShader("Shader2", "Glitchy")
setSpriteShader("Shader3", "glitch2")

runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader),new ShaderFilter(game.getLuaObject("Shader2").shader)]);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);
		]])
setShaderFloat("Shader", "cx", 0.5)
setShaderFloat("Shader", "cy", 0.5)
dodo = true
elseif curStep == 1408 then
runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader)]);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader),new ShaderFilter(game.getLuaObject("Shader2").shader)]);
		]])
setShaderFloat("Shader", "cx", 0.5)
setShaderFloat("Shader", "cy", 0.5)

end

if curStep > 1280 then
setShaderFloat("Shader3", "iTime", os.clock())
end
end


function onUpdate(elapsed)
blurval = math.lerp(blurval, 0, boundTo(elapsed * 7, 0, 500));
end

function onEvent(n,v1,v2)
if n == 'glitchy' then
setShaderFloat("Shader2", "AMT", v1)
setShaderFloat("Shader2", "SPEED", v2)
end
if n == 'Add Camera Zoom' then
blurval = v2
end
end


function boundTo(value, min, max)
return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)
return from+(to-from)*i
end