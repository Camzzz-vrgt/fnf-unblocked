local stop = false
local beatFlag = 0
local stepFlag = 0
local jumpscare = 1

function onCreate()
	
	makeLuaSprite('spook1', 'spookies/xenocrouch', 100, 100)
    setProperty('spook1.antialiasing', false)
	setObjectCamera('spook1','hud')
    scaleObject('spook1', 9, 9)
	setBlendMode('spook1', 'add')
    addLuaSprite('spook1', false)
	setProperty('spook1.alpha', 0)
	
	makeLuaSprite('spook2', 'spookies/xenohug', 400, 100)
    setProperty('spook2.antialiasing', false)
	setObjectCamera('spook2','hud')
    scaleObject('spook2', 14, 14)
	setBlendMode('spook2', 'add')
    addLuaSprite('spook2', false)
	setProperty('spook2.alpha', 0)
	
	makeLuaSprite('spook3', 'spookies/xenoside', 750, 50)
    setProperty('spook3.antialiasing', false)
	setObjectCamera('spook3','hud')
    scaleObject('spook3', 10, 10)
	setBlendMode('spook3', 'add')
    addLuaSprite('spook3', false)
	setProperty('spook3.alpha', 0)
end


function onCreatePost()
	initLuaShader('blur')
end

function onUpdate(elapsed)
	setSpriteShader('spook1', 'blur')
	setSpriteShader('spook2', 'blur')
	setSpriteShader('spook3', 'blur')
end

function onEvent(name,value1,value2)

	if name == 'floatyboys' then
		if value1 == 'spook1' then
			doTweenX('start1', 'spook1.scale', 7, 0.4, 'elasticInOut')
			doTweenY('start1b', 'spook1.scale', 7, 0.4, 'elasticInOut')
			doTweenX('start1c', 'spook1', 200, 0.4, 'elasticInOut')
			doTweenAlpha('start1d', 'spook1', 1, 0.3, 'elasticInOut')
		elseif value1 == 'spook2' then
			doTweenX('start2', 'spook2.scale', 12, 0.3, 'elasticInOut')
			doTweenY('start2b', 'spook2.scale', 12, 0.3, 'elasticInOut')
			doTweenX('start2c', 'spook2', 300, 0.3, 'elasticInOut')
			doTweenAlpha('start2d', 'spook2', 1, 0.3, 'elasticInOut')
		elseif value1 == 'spook3' then
			doTweenX('start3', 'spook3.scale', 9, 0.4, 'elasticInOut')
			doTweenY('start3b', 'spook3.scale', 9, 0.4, 'elasticInOut')
			doTweenAlpha('start3d', 'spook3', 1, 0.3, 'elasticInOut')
			doTweenX('minishakeC1', 'spook3', 740, 0.05, 'linear')
		end
	end
	
end

function onTweenCompleted(tag, elapsed)
--- 1
	if tag == 'start1' then
		runTimer('crouchending', '0.2')
		
		doTweenX('minishakeA1', 'spook1', 205, 0.05, 'linear')
		
		doTweenX('crouch', 'spook1.scale', 6, 0.2, 'linear')
		doTweenY('crouchb', 'spook1.scale', 6, 0.2, 'linear')
	end
	
	if tag == 'minishakeA1' then	
		doTweenX('minishakeA2', 'spook1', 195, 0.05, 'linear')
	end
		
	if tag == 'minishakeA2' then	
		doTweenX('minishakeA1', 'spook1', 205, 0.05, 'linear')
	end
	
--- 2
	if tag == 'start2' then
		
		doTweenX('hug', 'spook2.scale', 10, 0.2, 'quadOut')
		doTweenY('hugb', 'spook2.scale', 10, 0.2, 'quadOut')
	end
	
	if tag == 'start2c' then
		
		doTweenX('minishakeB1', 'spook2', math.random(280, 320), 0.04, 'linear')
		doTweenY('minishakeBa1', 'spook2', math.random(80, 120), 0.04, 'linear')
	
	end
	
	if tag == 'hug' then
		runTimer('hugending', '0.5')
		
		doTweenX('hug2', 'spook2.scale', 14, 0.1, 'quadIn')
		doTweenY('hug2b', 'spook2.scale', 14, 0.1, 'quadIn')
	end
	
	if tag == 'hug2' then	
		doTweenX('hug3', 'spook2.scale', 10, 0.4, 'quadOut')
		doTweenY('hug3b', 'spook2.scale', 10, 0.4, 'quadOut')
	end
	
	if tag == 'hugend' then	
		doTweenX('fix1', 'spook2.scale', 14, 0.01, 'linear')
		doTweenY('fix2', 'spook2.scale', 14, 0.01, 'linear')
		doTweenX('fix3', 'spook2', 400, 0.01, 'linear')
		doTweenY('fix4', 'spook2', 100, 0.01, 'linear')
	end
	
	if tag == 'minishakeB1' then
		doTweenX('minishakeB2', 'spook2', math.random(280, 320), 0.04, 'linear')
		doTweenY('minishakeBa2', 'spook2', math.random(80, 120), 0.04, 'linear')
	end
	
	if tag == 'minishakeB2' then
		doTweenX('minishakeB1', 'spook2', math.random(280, 320), 0.04, 'linear')
		doTweenY('minishakeBa1', 'spook2', math.random(80, 120), 0.04, 'linear')
	end
	
---3
	if tag == 'start3' then
		runTimer('sideending', '0.2')
		
		doTweenX('minishakeC1', 'spook3', 745, 0.05, 'linear')
		
		doTweenX('side', 'spook3.scale', 8, 0.2, 'linear')
		doTweenY('sideb', 'spook3.scale', 8, 0.2, 'linear')
	end
	
	if tag == 'minishakeC1' then	
		doTweenX('minishakeC2', 'spook3', 740, 0.05, 'linear')
	end
		
	if tag == 'minishakeC2' then	
		doTweenX('minishakeC1', 'spook3', 760, 0.05, 'linear')
	end
end




function onTimerCompleted(tag, loops, loopsLeft)
	
	if tag == 'crouchending' then
		cancelTween('minishakeA1')
		cancelTween('minishakeA2')

		doTweenX('crouchend', 'spook1.scale', 9, 0.2, 'elasticInOut')
		doTweenY('crouchendb', 'spook1.scale', 9, 0.2, 'elasticInOut')
		doTweenX('crouchendc', 'spook1', 100, 0.2, 'elasticInOut')
		doTweenAlpha('crouchendd', 'spook1', 0, 0.2, 'elasticInOut')
	end
	
	if tag == 'hugending' then
		cancelTween('minishakeB1')
		cancelTween('minishakeBa1')

		doTweenX('hugend', 'spook2.scale', 15, 0.2, 'quadOut')
		doTweenY('hugendb', 'spook2.scale', 15, 0.2, 'quadOut')
		doTweenX('hugend', 'spook2.scale', 15, 0.2, 'quadOut')
		doTweenAlpha('hugendd', 'spook2', 0, 0.2, 'quadOut')
	end
	
	if tag == 'sideending' then
		cancelTween('minishakeC1')
		cancelTween('minishakeC2')

		doTweenX('sideend', 'spook3.scale', 10, 0.2, 'elasticInOut')
		doTweenY('sideendb', 'spook3.scale', 10, 0.2, 'elasticInOut')
		doTweenX('sideendc', 'spook3', 850, 0.2, 'elasticInOut')
		doTweenAlpha('sideendd', 'spook3', 0, 0.2, 'elasticInOut')
	end
end