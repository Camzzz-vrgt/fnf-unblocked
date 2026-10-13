local xx = 650
local yy = 690
local xx2 = 650
local yy2 = 700
local ofs = 40
local ofsBF = 100
local camOffsetX = 0
local camOffsetY = 0

local targetOffsetX = 0
local targetOffsetY = 0

local tweenTime = 2.0
local tweenTimer = 0
local tweening = false

local originalZoom = 1.0 
local followchars = true
local modchart = true

function onCreate()
    makeLuaSprite('back2','chapter1/back2',-395,-500)
	setLuaSpriteScrollFactor('back2', 1.0, 1.0)

	makeLuaSprite('blackscreen', '', 0, 0)
    makeGraphic('blackscreen', screenWidth, screenHeight, '000000')
    setObjectCamera('blackscreen', 'other')
    addLuaSprite('blackscreen', true)
    setProperty('blackscreen.alpha', 1)

	-- song
	makeLuaSprite('imagen1', 'chapter1/song_w', 0, 0)
	setObjectCamera('imagen1', 'other')
	setProperty('imagen1.alpha', 0)
	addLuaSprite('imagen1', true)
	setProperty('imagen1.x', screenWidth / 2 - getProperty('imagen1.width') / 2)
	setProperty('imagen1.y', screenHeight / 2 - getProperty('imagen1.height') / 2 - 165)

	-- titulo
	makeLuaSprite('imagen2', 'chapter1/finalHug_w', 0, 0)
	setObjectCamera('imagen2', 'other')
	setProperty('imagen2.alpha', 0)
	addLuaSprite('imagen2', true)
	setProperty('imagen2.x', screenWidth / 2 - getProperty('imagen2.width') / 2)
	setProperty('imagen2.y', screenHeight / 2 - getProperty('imagen2.height') / 2 - 170)

	-- autor
	makeLuaSprite('imagen3', 'chapter1/sep_w', 0, 0)
	setObjectCamera('imagen3', 'other')
	setProperty('imagen3.alpha', 0)
	addLuaSprite('imagen3', true)
	setProperty('imagen3.x', screenWidth / 2 - getProperty('imagen3.width') / 2)
	setProperty('imagen3.y', screenHeight / 2 - getProperty('imagen3.height') / 2 - 110)

    runTimer('startFade', 4.0)
end

function onBeatHit()
    if mustHitSection then
		originalZoom = 0.8
		setProperty('defaultCamZoom', originalZoom)
	else
		originalZoom = 1.0
		setProperty('defaultCamZoom', originalZoom)
	end

	if curBeat == 5 then
        doTweenAlpha('fadeInImagen', 'imagen1', 1, 0.5, 'sineInOut')
        runTimer('subir1', 1)
        runTimer('desaparecer1', 5)

		runTimer('aparecer2', 1)
        runTimer('desaparecer2', 5)

		runTimer('aparecer3', 2)
        runTimer('desaparecer3', 5) 
	end

	if curBeat == 129 then
		doTweenAlpha('fadeOutBlack', 'blackscreen', 0, 2.0, 'linear')
	end

    if curBeat == 128 then
		addLuaSprite('back2',false)

	end
end

function onStepHit()
	if curStep == 511 then
		setProperty('blackscreen.alpha', 1)
	end

	if curStep == 760 then
		setProperty('blackscreen.alpha', 1)
	end

	if curStep == 761 then
		setProperty('blackscreen.alpha', 0)
	end

	if curStep == 762 then
		setProperty('blackscreen.alpha', 1)
	end

	if curStep == 763 then
		setProperty('blackscreen.alpha', 0)
	end

	if curStep == 764 then
		setProperty('blackscreen.alpha', 1)
	end

	if curStep == 765 then
		doTweenAlpha('fadeOutBlack', 'blackscreen', 0, 0.1, 'linear')
	end

	if curStep == 768 then
		setProperty('blackscreen.alpha', 1)
	end

	if curStep == 769 then
		doTweenAlpha('fadeOutBlack', 'blackscreen', 0, 1, 'linear')
	end

	if curStep == 1280 then
		setProperty('blackscreen.alpha', 1)
	end

	if curStep == 1284 then
		doTweenAlpha('fadeOutBlack', 'blackscreen', 0, 1, 'linear')
	end

	if curStep == 1532 then
		setProperty('blackscreen.alpha', 1)
	end

	if curStep == 1533 then
		setProperty('blackscreen.alpha', 0)
	end

	if curStep == 1534 then
		setProperty('blackscreen.alpha', 1)
	end

	if curStep == 1535 then
		setProperty('blackscreen.alpha', 0)
	end

	if curStep == 1536 then
		setProperty('blackscreen.alpha', 1)
	end

	if curStep == 1540 then
		doTweenAlpha('fadeOutBlack', 'blackscreen', 0, 1, 'linear')
	end

	if curStep == 1792 then
		setProperty('blackscreen.alpha', 1)
	end
end

function onTimerCompleted(tag)
    if tag == 'startFade' then
        doTweenAlpha('fadeOutBlack', 'blackscreen', 0, 3.0, 'linear') -- 3 segundos de fade
    elseif tag == 'volverAlTrigger' then
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = 0
		targetOffsetY = 0
		tweenTime = 1.0
		tweenTimer = 0
		tweening = true
		setProperty('camZooming', true)
	elseif tag == 'subir1' then
        doTweenY('moverImagen1', 'imagen1', getProperty('imagen1.y') - 50, 0.5, 'sineInOut')
    elseif tag == 'desaparecer1' then
        doTweenAlpha('fadeOut1', 'imagen1', 0, 0.5, 'sineInOut')
	elseif tag == 'aparecer2' then
        doTweenAlpha('fadeIn2', 'imagen2', 1, 0.5, 'sineInOut')
    elseif tag == 'desaparecer2' then
        doTweenAlpha('fadeOut2', 'imagen2', 0, 0.5, 'sineInOut')
	elseif tag == 'aparecer3' then
        doTweenAlpha('fadeIn3', 'imagen3', 1, 0.5, 'sineInOut')
    elseif tag == 'desaparecer3' then
        doTweenAlpha('fadeOut3', 'imagen3', 0, 0.5, 'sineInOut')
    end
end

function onUpdate(elapsed)
	if tweening then
		tweenTimer = tweenTimer + elapsed
		local ratio = math.min(tweenTimer / tweenTime, 1)

		-- interpolación lineal
		camOffsetX = lerp(startOffsetX, targetOffsetX, ratio)
		camOffsetY = lerp(startOffsetY, targetOffsetY, ratio)

		if ratio >= 1 then
			tweening = false
		end
	end
	if followchars == true then
		if mustHitSection == false then
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos', xx + camOffsetX - ofs, yy + camOffsetY)
			elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos', xx + camOffsetX + ofs, yy + camOffsetY)
			elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos', xx + camOffsetX, yy + camOffsetY - ofs)
			elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos', xx + camOffsetX, yy + camOffsetY + ofs)
			else
				triggerEvent('Camera Follow Pos', xx + camOffsetX, yy + camOffsetY)
			end
		else
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos', xx2 + camOffsetX - ofsBF, yy2 + camOffsetY)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos', xx2 + camOffsetX + ofsBF, yy2 + camOffsetY)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos', xx2 + camOffsetX, yy2 + camOffsetY - ofsBF)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos', xx2 + camOffsetX, yy2 + camOffsetY + ofsBF)
			else
				triggerEvent('Camera Follow Pos', xx2 + camOffsetX, yy2 + camOffsetY)
			end
		end
	end

	if modchart == true then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
		end
	end
end

function onGameOver()
	modchart = false
	return Function_Continue;
end

function lerp(a, b, t)
	return a + (b - a) * t
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if mustHitSection == false and curStep >= 1280 and curStep <= 1535 then
        cameraShake('game', 0.003, 0.2)
    end
end
