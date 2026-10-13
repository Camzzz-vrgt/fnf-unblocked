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
	
	makeLuaSprite('vignette', 'visuals/vignette', 0, 0)
	setObjectCamera('vignette', 'hud')
	doTweenColor('vignettePurple', 'vignette', '8300FF', 0.00001)
	setBlendMode('vignette', 'add')
	doTweenAlpha('vignette0', 'vignette', 0, 0.1)
	setProperty('vignette.visible', false)
	addLuaSprite('vignette', true)	
	
	makeLuaSprite('black', nil, -600, -300)
	makeGraphic('black', 2048, 1440, '000000')
	setObjectCamera('black', 'other')	
	addLuaSprite('black', true)
	
	makeLuaSprite('black2', nil, -600, -300)
	makeGraphic('black2', 2048, 1440, '000000')
	setObjectCamera('black2', 'other')	
	doTweenAlpha('lolol', 'black2', 0, 0.1)
	addLuaSprite('black2', true)	
	
	makeLuaSprite('purple', nil, -600, -300)
	makeGraphic('purple', 2048, 1440, '8300FF')
	setObjectCamera('purple', 'other')	
	setBlendMode('purple', 'add')
	doTweenAlpha('purple0', 'purple', 0, 0.1)
	addLuaSprite('purple', true)
end

function onCreatePost()
	doTweenAlpha('whitebg0', 'whitebg', 1, 0.1)
	doTweenColor('juguetez3Black', 'juguetez3', '000000', 0.1)
	doTweenColor('forkyBlack', 'boyfriend', '000000', 0.1)
	doTweenColor('misfitsBlack', 'dad', '000000', 0.1)
	doTweenAlpha('iconP10', 'iconP1', 0, 0.1)
	doTweenAlpha('iconP20', 'iconP2', 0, 0.1)	
	doTweenAlpha('healthBar0', 'healthBar', 0, 0.1)	
	doTweenAlpha('healthBarBG0', 'healthBarBG', 0, 0.1)		
	doTweenAlpha('newGUI0', 'newGUI', 0, 0.1)	
	noteTweenAlpha("nb1", 0, 0, 0.1)
	noteTweenAlpha("nb2", 1, 0, 0.1)
	noteTweenAlpha("nb3", 2, 0, 0.1)
	noteTweenAlpha("nb4", 3, 0, 0.1)	
	noteTweenAlpha("nb5", 4, 0, 0.1)
	noteTweenAlpha("nb6", 5, 0, 0.1)
	noteTweenAlpha("nb7", 6, 0, 0.1)
	noteTweenAlpha("nb8", 7, 0, 0.1)		
end

function onBeatHit()
	if curBeat % 1 == 0 then
	doTweenAlpha('vignette100', 'vignette', 1, 0.0001)
	doTweenAlpha('vignette0', 'vignette', 0, 0.25)
		for i=0,7 do
		setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.65)
		setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.65)
		setPropertyFromGroup('unspawnNotes', i, 'scale.x', 0.65)
		setPropertyFromGroup('unspawnNotes', i, 'scale.y', 0.65)	
		end
	end
	if curBeat % 2 == 0 then
		for i=0,7 do
		setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.7)
		setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.7)
		setPropertyFromGroup('unspawnNotes', i, 'scale.x', 0.7)
		setPropertyFromGroup('unspawnNotes', i, 'scale.y', 0.7)	
		end
	end	
	if curBeat == 62 or curBeat == 399 then
	doTweenAlpha('whitebg0', 'whitebg', 0, 0.6, 'cubeIn')
	doTweenColor('juguetez3Normal', 'juguetez3', 'FFFFFF', 0.6, 'cubeIn')
	doTweenColor('forkyNormal', 'boyfriend', 'FFFFFF', 0.6, 'cubeIn')
	doTweenColor('misfitsNormal', 'dad', 'FFFFFF', 0.6, 'cubeIn')
	doTweenAlpha('iconP10', 'iconP1', 1, 0.6, 'cubeIn')
	doTweenAlpha('iconP20', 'iconP2', 1, 0.6, 'cubeIn')	
	doTweenAlpha('healthBar0', 'healthBar', 1, 0.6, 'cubeIn')	
	doTweenAlpha('healthBarBG0', 'healthBarBG', 1, 0.6, 'cubeIn')		
	doTweenAlpha('newGUI0', 'newGUI', 1, 0.6, 'cubeIn')		
	
	noteTweenAlpha("nb1", 0, 1, 0.6, 'cubeIn')
	noteTweenAlpha("nb2", 1, 1, 0.6, 'cubeIn')
	noteTweenAlpha("nb3", 2, 1, 0.6, 'cubeIn')
	noteTweenAlpha("nb4", 3, 1, 0.6, 'cubeIn')		
	noteTweenAlpha("nb5", 4, 1, 0.6, 'cubeIn')
	noteTweenAlpha("nb6", 5, 1, 0.6, 'cubeIn')
	noteTweenAlpha("nb7", 6, 1, 0.6, 'cubeIn')
	noteTweenAlpha("nb8", 7, 1, 0.6, 'cubeIn')		
	end
	if curBeat == 382 then
	doTweenAlpha('whitebg0', 'whitebg', 1, 0.75, 'cubeIn')
	doTweenColor('juguetez3Black', 'juguetez3', '000000', 0.75, 'cubeIn')
	doTweenColor('forkyBlack', 'boyfriend', '000000', 0.75, 'cubeIn')
	doTweenColor('misfitsBlack', 'dad', '000000', 0.75, 'cubeIn')
	doTweenAlpha('iconP10', 'iconP1', 0, 0.75, 'cubeIn')
	doTweenAlpha('iconP20', 'iconP2', 0, 0.75, 'cubeIn')	
	doTweenAlpha('healthBar0', 'healthBar', 0, 0.75, 'cubeIn')	
	doTweenAlpha('healthBarBG0', 'healthBarBG', 0, 0.75, 'cubeIn')		
	doTweenAlpha('newGUI0', 'newGUI', 0, 0.75, 'cubeIn')	
	doTweenAlpha('black10000', 'black2', 1, 0.75, 'cubeIn')
	end
	if curBeat == 384 then
	doTweenAlpha('black000', 'black2', 0, 2)
	end
	if curBeat == 128 or curBeat == 400 or curBeat == 512 then
	setProperty('vignette.visible', true)
	doTweenAlpha('purple100', 'purple', 1, 0.0001)
	doTweenAlpha('purple00', 'purple', 0, 1)
	end
	if curBeat == 256 or curBeat == 448 or curBeat == 640 then
	setProperty('vignette.visible', false)
	doTweenAlpha('black100', 'black', 1, 0.0001)
	doTweenAlpha('black00', 'black', 0, 1)
	end	
	if curBeat == 640 then
	doTweenAlpha('black1000', 'black2', 1, 18)
	end	
end

function onSongStart()
	doTweenAlpha('blackBye', 'black', 0, 20, 'cubeIn')
end


f = 1
function onStepHit()
	Particle()	
end
function Particle()
	songPos = getSongPosition()
	currentBeat = (songPos/500)
	f = f + 1
	cub = math.random(2, 1500)
	cub2 = math.random(2, 1500)
	makeLuaSprite('part' .. f, 'visuals/particle', math.random(0, 2000), 1600)
	doTweenY(cub, 'part' .. f, -900*math.tan((currentBeat+1*0.1)*math.pi), 6)
	doTweenX(cub2, 'part' .. f, -900*math.sin((currentBeat+1*0.1)*math.pi), 6)
	scaleObject('part' .. f, 0.25, 0.25)
	setObjectCamera('part' .. f, 'other')
	doTweenColor('lollol', 'part' .. f, '8300FF', 0.1)
	addLuaSprite('part' .. f, true)
	if f >= 50 then
	f = 1
	end
end
