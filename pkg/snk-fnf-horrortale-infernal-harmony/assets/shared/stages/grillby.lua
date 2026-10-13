function onCreate()
	makeLuaSprite('background', 'stages/grill/background', 480, 320);
	makeLuaSprite('foreground', 'stages/grill/foreground', 480, 320);
	scaleObject('background', 0.8, 0.8)
	scaleObject('foreground', 0.8, 0.8)
	addLuaSprite('foreground', false)
	addLuaSprite('background', false)
	makeAnimatedLuaSprite("bear", 'stages/grill/bear', 3000,3000) --1000
	addAnimationByPrefix("bear", "idle", "idle", 24, false)
	makeAnimatedLuaSprite("bird", 'stages/grill/bird', 2800,3350) --1350
	addAnimationByPrefix("bird", "idle", "idle", 24, false)
	makeAnimatedLuaSprite("dogressa", 'stages/grill/dogressa', 200,3200) --1200
	addAnimationByPrefix("dogressa", "idle", "idle", 24, false)
	makeAnimatedLuaSprite("rabbit", 'stages/grill/rabbit', 900,3200) --1200
	addAnimationByPrefix("rabbit", "idle", "idle", 24, false)
	addLuaSprite('bear', true)
	addLuaSprite('bird', true)
	addLuaSprite('dogressa', true)
	addLuaSprite('rabbit', true)

	if shadersEnabled then
		makeLuaSprite("bgshader",nil,300,200)
		makeGraphic("bgshader", 1,1,'572364')
		addLuaSprite("bgshader")
		setSpriteShader("bgshader", "gradOil")
		setShaderFloat("bgshader", "ALPHA", 1.0)
		setShaderFloatArray("bgshader", "colorFrom", {0,0,0})
		setShaderFloatArray("bgshader", "colorTo", {1,0,1})	
		scaleObject("bgshader", screenWidth * 6, screenHeight * 6)
		setProperty("bgshader.visible", false)
	end	
end
function onBeatHit()
	playAnim('bear', 'idle', true, false, 0)
	playAnim('bird', 'idle', true, false, 1)
	playAnim('dogressa', 'idle', true, false, 0)
	playAnim('rabbit', 'idle', true, false, 1)
end

function onUpdatePost(e)
	setShaderFloat("bgshader", "iTime", os.clock())
end

function onStepHit()
	--[[if curStep == 124 then
		doTweenY('ybear', 'bear', 900, 0.5, 'circOut')
		doTweenY('ybird', 'bird', 1550, 0.5, 'circOut')
		doTweenY('ydogressa', 'dogressa', 1300, 0.5, 'circOut')
		doTweenY('yrabbit', 'rabbit', 1300, 0.5, 'circOut')
	end
	if curStep == 128 then
		doTweenY('ybear', 'bear', 1000, 0.2, 'circOut')
		doTweenY('ybird', 'bird', 1350, 0.2, 'circOut')
		doTweenY('ydogressa', 'dogressa', 1200, 0.2, 'circOut')
		doTweenY('yrabbit', 'rabbit', 1400, 0.2, 'circOut')
	end--]]
end