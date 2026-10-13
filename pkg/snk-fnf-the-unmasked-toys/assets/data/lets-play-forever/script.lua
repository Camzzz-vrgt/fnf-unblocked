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
end

function onBeatHit()
	if curBeat == 221 then
	doTweenAlpha('blacklol', 'black', 1, 1, 'cubeIn')
	end
	if curBeat == 224 then
	cancelTween('blacklol1', true)
	doTweenAlpha('blacklol2', 'black', 0, 10, 'cubeIn')
	
	setProperty('toybed.visible', true)
	setProperty('defaultCamZoom', 0.6)
	setProperty('oscuridad.scale.x', 2.5)
	setProperty('boyfriend.x',  getProperty('boyfriend.x') + 50)
	setProperty('dad.x',  getProperty('dad.x') -50)
	end
	if curBeat == 628 then
	doTweenAlpha('whitalol', 'whita', 1, 1, 'cubeIn')
	end
	if curBeat == 632 then
	cancelTween('whitalol', true)
	doTweenAlpha('whitalol2', 'whita', 1, 0.1)
	doTweenAlpha('whitalol3', 'whita', 0, 0.5)
	doTweenAlpha('blacklol', 'black', 1, 0.0001)
	doTweenAlpha('blacklol2', 'black', 0, 10, 'cubeIn')	
	
	setProperty('toybedbad.visible', true)
	setProperty('defaultCamZoom', 0.6)
	end
	if curBeat == 972 then
	doTweenAlpha('blacklol9', 'black', 1, 0.15)
	end
end

function onCreatePost()
	noteTweenAlpha("NOTESBYE1", 0, 0.25, 0.1)
	noteTweenAlpha("NOTESBYE2", 1, 0.25, 0.1)
	noteTweenAlpha("NOTESBYE3", 2, 0.25, 0.1)
	noteTweenAlpha("NOTESBYE4", 3, 0.25, 0.1)
end

function onSongStart()
	doTweenAlpha('blackBye', 'black', 0, 20, 'cubeIn')
end

function onUpdate()
	setProperty('dad.scale.x', 1.35)
	setProperty('dad.scale.y', 1.35)
end
