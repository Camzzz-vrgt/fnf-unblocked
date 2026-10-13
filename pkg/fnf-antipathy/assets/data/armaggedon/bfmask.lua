local masked = true
local hankhere = false
local hankXfollow = true

function onCreate()
	--cool mask icons
	--if getProperty('SONG.song') == 'Armaggeddon'
    makeAnimatedLuaSprite('maskIcon', 'wank/icon-maskk', 635, 15)
    addAnimationByPrefix('maskIcon', 'neutral', 'icon-maskk neutral', 1, true)
    addAnimationByPrefix('maskIcon', 'lose', 'icon-maskk lose', 1, true)
	addAnimationByPrefix('maskIcon', 'win', 'icon-maskk win', 1, true)
    setObjectCamera('maskIcon', 'camHud')
    objectPlayAnimation('maskIcon', 'neutral', true)
	setProperty("maskIcon.alpha", 1)
	
	makeAnimatedLuaSprite('hankIcon', 'wank/icon-efnhank', 635, -200)
    addAnimationByPrefix('hankIcon', 'neutral', 'icon-efnhank neutral', 1, true)
    addAnimationByPrefix('hankIcon', 'lose', 'icon-efnhank lose', 1, true)
	addAnimationByPrefix('hankIcon', 'win', 'icon-efnhank win', 1, true)
    setObjectCamera('hankIcon', 'camHud')
    objectPlayAnimation('hankIcon', 'neutral', true)
	setProperty("hankIcon.alpha", 1)
end

function onCreatePost()
	addLuaSprite('maskIcon', true)
	addLuaSprite('hankIcon', true)
end

function onEvent(name, value1, value2)
	if name == 'HUD Alpha' then --adjust damascus with the stupid hud
		alpha = tonumber(value1)
		speed = tonumber(value2)
		doTweenAlpha('yikes', 'maskIcon', alpha, speed, 'circOut')
	end
	if name == 'Griddy' then --events BS
		gritty = tonumber(value1)
		if gritty == 0 then --mask off, just like the phantom thieves frfr
			runTimer('ohwedointhis',3)
			runTimer('waitasec',0.2)
		elseif gritty == 1 then --byebye hankicon
			doTweenAlpha('assblast', 'hankIcon', 0, 0.4, 'circOut')
		end
	end
end

function onUpdate(elapsed)

	if hideHud then
		setProperty("maskIcon.alpha", 0)
	end
	
	if masked then
		setProperty('maskIcon.x', getProperty('iconP1.x'))
		setProperty('maskIcon.y', getProperty('iconP1.y'))
		
		setProperty('maskIcon.scale.x', getProperty('iconP1.scale.x'))
		setProperty('maskIcon.scale.y', getProperty('iconP1.scale.y'))
	end
	
	--just so he actually lands in the proper spot
	if hankXfollow then
		setProperty('hankIcon.x', getProperty('iconP2.x') - 50)
	end
	
	if hankhere then
		setProperty('hankIcon.y', getProperty('iconP2.y') - 50)
		
		setProperty('hankIcon.scale.x', getProperty('iconP2.scale.x'))
		setProperty('hankIcon.scale.y', getProperty('iconP2.scale.y'))
	end

	--health accurate
	if getProperty('healthBar.percent') > 80 then
		objectPlayAnimation('maskIcon', 'win', true)
		objectPlayAnimation('hankIcon', 'lose', true)
	elseif getProperty('healthBar.percent') < 20 then
		objectPlayAnimation('maskIcon', 'lose', true)
		objectPlayAnimation('hankIcon', 'win', true)
	else
		objectPlayAnimation('maskIcon', 'neutral', true)
		objectPlayAnimation('hankIcon', 'neutral', true)
	end
end

function onTweenCompleted(tag) 
	if tag == 'heckin' then
		removeSprite('maskIcon')
	end
	if tag == 'assblast' then
		removeSprite('hankIcon')
	end
	if tag == 'hopOn' then
		hankhere = true
	end
end

function onTimerCompleted(tag) 
	if tag == 'damascus' then
		masked = false
		doTweenAngle('heckin', 'maskIcon', 180, 0.3, 'linear')
		doTweenX('hellin', 'maskIcon', 1400, 0.3, 'linear')
		doTweenY('hockey', 'maskIcon', 340, 0.3, 'linear')
		triggerEvent('Alt Idle Animation', 'gf', '-alt')
	end
	if tag == 'ohwedointhis' then
		triggerEvent('Change Character', 'boyfriend', 'bf-efn-nomask')
		triggerEvent('Play Animation', 'maskoff', 'bf')
		runTimer('damascus',1.3)
	end
	if tag == 'waitasec' then --ok go
		if not downscroll then
			doTweenY('hopOn', 'hankIcon', 570, 0.2, 'linear')
		else
			doTweenY('hopOn', 'hankIcon', 15, 0.2, 'linear')
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote) --goofy ahh health drain
	if getProperty("health") > 0.01 then
			setProperty("health", getProperty("health") - 0.01)
	end
end