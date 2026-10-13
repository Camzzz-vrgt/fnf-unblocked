local defaultX = 0
local defaultY = 0
local defaultAngle = 0
local defaultZoom = 1
function onCreate()
	setProperty('skipArrowStartTween', true) 
	
	makeLuaSprite('cinedown', 'visuals/cinedown', -350, 25)
	setObjectCamera('cinedown', 'hud')
	scaleObject('cinedown', 0.7, 0.7)
	addLuaSprite('cinedown', false)
	
	makeLuaSprite('cineup', 'visuals/cineup', -350, -75)
	setObjectCamera('cineup', 'hud')
	scaleObject('cineup', 0.7, 0.7)
	addLuaSprite('cineup', false)
	
	makeLuaSprite('black', nil, -600, -300)
	makeGraphic('black', 2560, 1400, '000000')
	setObjectCamera('black', 'other')	
	addLuaSprite('black', true)	
end

function onCreatePost()
	initLuaShader('mirrorRepeat')
	makeLuaSprite('mirror', '', defaultX,defaultY)
	setSpriteShader('mirror', 'mirrorRepeat')
	setProperty('mirror.angle', defaultAngle)
	makeLuaSprite('mirrorZoom', '', defaultZoom,0)
	runHaxeCode('game.variables["mirrorRepeat"] = game.modchartSprites.get("mirror").shader;')
	runHaxeCode('game.camHUD.setFilters([new ShaderFilter(game.variables["mirrorRepeat"])]);')		
	
	doTweenAngle('turn', 'camGame', 1.5, crochet/300, 'sineInOut')
	doTweenAngle('turnlol', 'mirror', -1.5, crochet/300, 'sineInOut')	
end

function onBeatHit()
	if curBeat == 91 then
	doTweenAlpha('blackBye2', 'black', 0.8, 0.2, 'cubeIn')
	end
	if curBeat == 96 then
	doTweenAlpha('blackBye3', 'black', 0, 10, 'cubeIn')
	end
end

function updateShader()
	setShaderFloat('mirror', 'x', getProperty('mirror.x'))
	setShaderFloat('mirror', 'y', getProperty('mirror.y'))
	setShaderFloat('mirror', 'angle', getProperty('mirror.angle'))
	setShaderFloat('mirror', 'zoom', getProperty('mirrorZoom.x'))
end

function onUpdate(elapsed)
	updateShader()
end

function onTweenCompleted(t)
	if t == 'turn' then
		doTweenAngle('turn1', 'camGame', -1.5, crochet/300, 'sineInOut')
		doTweenAngle('turnlol', 'mirror', 1.5, crochet/300, 'sineInOut')
	end
	if t == 'turn1' then
		doTweenAngle('turn', 'camGame', 1.5, crochet/300, 'sineInOut')
		doTweenAngle('turnlol', 'mirror', -1.5, crochet/300, 'sineInOut')
	end
end
