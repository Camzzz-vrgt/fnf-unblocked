function onCreate()
	setProperty('skipArrowStartTween', true) 
	
	makeAnimatedLuaSprite('Smoke3', 'visuals/Smoke3', 0, 0)
	addAnimationByPrefix('Smoke3', 'idle', 'idle', 24, true)
	objectPlayAnimation('Smoke3', 'idle', false)
	setObjectCamera('Smoke3', 'hud')
	setBlendMode('Smoke3', 'add')
	setProperty('Smoke3.alpha', 0.25)
	addLuaSprite('Smoke3', false)
	
	makeLuaSprite('cinedown', 'visuals/cinedown', -350, -25)
	setObjectCamera('cinedown', 'hud')
	scaleObject('cinedown', 0.7, 0.7)
	addLuaSprite('cinedown', false)
	
	makeLuaSprite('cineup', 'visuals/cineup', -350, -25)
	setObjectCamera('cineup', 'hud')
	scaleObject('cineup', 0.7, 0.7)
	addLuaSprite('cineup', false)		
	
	makeLuaSprite('black', nil, -500, 0)
	makeGraphic('black', 1920, 1080, '000000')
	setObjectCamera('black', 'hud')	
	addLuaSprite('black', true)
end

function onCreatePost()
	doTweenY('cineDownDOWN', 'cinedown', 25, 2, 'cubeOut')
	doTweenY('cineUpUP', 'cineup', -75, 2, 'cubeOut')		
	doTweenAlpha('iconP10', 'iconP1', 0, 0.1)
	doTweenAlpha('iconP20', 'iconP2', 0, 0.1)	
	doTweenAlpha('design0', 'design', 0, 0.1)		
	doTweenAlpha('healthBar0', 'healthBar', 0, 0.1)	
	doTweenAlpha('healthBarBG0', 'healthBarBG', 0, 0.1)		
	doTweenAlpha('newGUI0', 'newGUI', 0, 0.1)		
end

function onSongStart()
	doTweenAlpha('blackBye', 'black', 0, 20, 'cubeIn')
end

function onBeatHit()
	if curBeat == 62 then	
	doTweenAlpha('iconP10', 'iconP1', 1, 0.5, 'cubeIn')
	doTweenAlpha('iconP20', 'iconP2', 1, 0.5, 'cubeIn')	
	doTweenAlpha('design0', 'design', 1, 0.5, 'cubeIn')	
	doTweenAlpha('healthBar0', 'healthBar', 1, 0.5, 'cubeIn')	
	doTweenAlpha('healthBarBG0', 'healthBarBG', 1, 0.5, 'cubeIn')		
	doTweenAlpha('newGUI0', 'newGUI', 1, 0.5, 'cubeIn')		
	end
end
