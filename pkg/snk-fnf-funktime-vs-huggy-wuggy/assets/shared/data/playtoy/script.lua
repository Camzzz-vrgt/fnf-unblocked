local xx = 400
local yy = 700
local xx2 = 600
local yy2 = 850
local ofs = 40

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
	makeLuaSprite('imagen2', 'chapter1/playtoy_w', 0, 0)
	setObjectCamera('imagen2', 'other')
	setProperty('imagen2.alpha', 0)
	addLuaSprite('imagen2', true)
	setProperty('imagen2.x', screenWidth / 2 - getProperty('imagen2.width') / 2)
	setProperty('imagen2.y', screenHeight / 2 - getProperty('imagen2.height') / 2 - 170)

	-- autor
	makeLuaSprite('imagen3', 'chapter1/awe_w', 0, 0)
	setObjectCamera('imagen3', 'other')
	setProperty('imagen3.alpha', 0)
	addLuaSprite('imagen3', true)
	setProperty('imagen3.x', screenWidth / 2 - getProperty('imagen3.width') / 2)
	setProperty('imagen3.y', screenHeight / 2 - getProperty('imagen3.height') / 2 - 110)

    runTimer('startFade', 5.0)

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
	elseif tag == 'volverZoom' then
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = -100
		tweenTime = 10.0
		tweenTimer = 0
		tweening = true
        doTweenZoom('zoomOut', 'camGame', 0.8, 10.0, 'sineInOut')
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

function onBeatHit()

	if mustHitSection then
		originalZoom = 1.2
		setProperty('defaultCamZoom', originalZoom)
	else
		originalZoom = 0.8
		setProperty('defaultCamZoom', originalZoom)
	end

	if curBeat == 1 then
		setProperty('camHUD.visible', false)
		setProperty('camZooming', false)
		doTweenZoom('zoomIn', 'camGame', 2.0, 1, 'linear')
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = 30
		targetOffsetY = 80
		tweenTime = 1
		tweenTimer = 0
		tweening = true
		runTimer('volverZoom', 1)
	end

	if curBeat == 10 then
        doTweenAlpha('fadeInImagen', 'imagen1', 1, 0.5, 'sineInOut')
        runTimer('subir1', 1)
        runTimer('desaparecer1', 5)

		runTimer('aparecer2', 1)
        runTimer('desaparecer2', 5)

		runTimer('aparecer3', 2)
        runTimer('desaparecer3', 5) 
	end

	if curBeat == 25 then
        runTimer('volverAlTrigger', 1)
	end

	if curBeat == 32 then
		setProperty('blackscreen.alpha', 1)
		setProperty('camHUD.visible', true)
	end

	if curBeat == 33 then
		doTweenAlpha('fadeOutBlack', 'blackscreen', 0, 3.0, 'linear')
	end

	if curBeat == 96 then
		setProperty('camZooming', false)
		doTweenZoom('zoomIn', 'camGame', 1.2, 1.4, 'linear')
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = 0
		tweenTime = 1.4
		tweenTimer = 0
		tweening = true
        runTimer('volverAlTrigger', 1.4)
	end

	if curBeat ==  104 then
		setProperty('camZooming', false)
		doTweenZoom('zoomIn', 'camGame', 1.2, 1.4, 'linear')
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = 0
		tweenTime = 1.4
		tweenTimer = 0
		tweening = true
        runTimer('volverAlTrigger', 1.4)
	end

    if curBeat > 32 then
		if curBeat < 160 then
			if curBeat % 4 == 0 then
				triggerEvent('Add Camera Zoom', 0.1,0.1)
			end
		end
	end

	if curBeat == 152 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = 30
		targetOffsetY = 80
		tweenTime = 2.7
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.6, 2.7, 'sineIn')
		runTimer('volverAlTrigger', 2.7);
	end

	if curBeat == 160 then
		triggerEvent('Add Camera Zoom', 0.1,0.5)
	end

    if curBeat > 160 then
		if curBeat < 256 then
			if curBeat % 2 == 0 then
				triggerEvent('Add Camera Zoom', 0.1,0.1)
			end
		end
	end

	if curBeat == 168 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = 0
		tweenTime = 0.1
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.1, 0.3, 'sineIn')
		runTimer('volverAlTrigger', 0.3);
	end

	if curBeat == 170 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = -150
		tweenTime = 0.1
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.1, 0.3, 'sineIn')
		runTimer('volverAlTrigger', 0.3);
	end

	if curBeat == 204 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = -150
		tweenTime = 0.1
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.1, 0.3, 'sineOut')
		runTimer('volverAlTrigger', 0.4);
	end

	if curBeat == 206 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = -100
		tweenTime = 0.1
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.1, 0.4, 'sineOut')
		runTimer('volverAlTrigger', 0.4);
	end

	if curBeat == 248 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = 30
		targetOffsetY = 80
		tweenTime = 2.7
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 2.0, 2.7, 'sineIn')
		runTimer('volverAlTrigger', 2.7);
	end

    if curBeat == 254 then
        triggerEvent('Add Camera Zoom', 0.3,0.3)
    end

    if curBeat == 255 then
        triggerEvent('Add Camera Zoom', 0.5,0.3)
    end

    if curBeat > 255 then
		if curBeat < 288 then
			if curBeat % 1 == 0 then
				triggerEvent('Add Camera Zoom', 0.1,0.05)
			end
		end
	end

    if curBeat > 255 then
        if curBeat < 288 then
		    triggerEvent('Add Camera Zoom', 0.00,0.03)
	    else
		    setProperty('camHUD.angle',0)
		    setProperty('camHUD.x',0)
		    setProperty('camHUD.x',0)
	    end
    end

	if curBeat == 256 then
		setProperty('blackscreen.alpha', 1)
	end

	if curBeat == 257 then
		doTweenAlpha('fadeOutBlack', 'blackscreen', 0, 2.0, 'linear')
	end

	if curBeat == 290 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -50
		targetOffsetY = -150
		tweenTime = 1.5
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.2, 1.5, 'sineIn')
		runTimer('volverAlTrigger', 1);
	end

    if curBeat > 288 then
		if curBeat < 295 then
			if curBeat % 1 == 0 then
				triggerEvent('Add Camera Zoom', 0,0)
			end
		end
	end

    if curBeat > 288 then
        if curBeat < 295 then
		    triggerEvent('Add Camera Zoom', 0.00,0.00)
	    else
		    setProperty('camHUD.angle',0)
		    setProperty('camHUD.x',0)
		    setProperty('camHUD.x',0)
	    end
    end

    if curBeat == 293 then
        triggerEvent('Add Camera Zoom', 0.1,0.1)
    end

    if curBeat == 294 then
        triggerEvent('Add Camera Zoom', 0.2,0.2)
    end

    if curBeat == 295 then
        triggerEvent('Add Camera Zoom', 0.3,0.3)
    end

    if curBeat == 296 then
        triggerEvent('Add Camera Zoom', 0.5,0.5)
    end

    if curBeat > 296 then
		if curBeat < 320 then
			if curBeat % 1 == 0 then
				triggerEvent('Add Camera Zoom', 0.1,0.05)
			end
		end
	end

    if curBeat > 296 then
        if curBeat < 320 then
		    triggerEvent('Add Camera Zoom', 0.00,0.03)
	    else
		    setProperty('camHUD.angle',0)
		    setProperty('camHUD.x',0)
		    setProperty('camHUD.x',0)
	    end
    end

	if curBeat == 320 then
		setProperty('blackscreen.alpha', 1)
	end

	if curBeat == 321 then
		doTweenAlpha('fadeOutBlack', 'blackscreen', 0, 2.0, 'linear')
	end

    if curBeat > 320 then
		if curBeat < 384 then
			if curBeat % 2 == 0 then
				triggerEvent('Add Camera Zoom', 0.1,0.1)
			end
		end
	end

	if curBeat == 382 then
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = 500
		targetOffsetY = 0
		tweenTime = 1
		tweenTimer = 0
		tweening = true
		runTimer('volverAlTrigger', 2);
	end

	if curBeat == 384 then
		setProperty('blackscreen.alpha', 1)
	end
end

function onStepHit()
	if curStep == 898 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = 0
		tweenTime = 0.1
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.1, 0.4, 'sineOut')
		runTimer('volverAlTrigger', 0.4);
	end

	if curStep == 906 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = -150
		tweenTime = 0.1
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.1, 0.4, 'sineOut')
		runTimer('volverAlTrigger', 0.4);
	end

	if curStep == 914 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = -100
		tweenTime = 0.1
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.1, 0.4, 'sineOut')
		runTimer('volverAlTrigger', 0.4);
	end

	if curStep == 930 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = 0
		tweenTime = 0.1
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.1, 0.4, 'sineOut')
		runTimer('volverAlTrigger', 0.4);
	end

	if curStep == 938 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -100
		targetOffsetY = -150
		tweenTime = 0.1
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.1, 0.4, 'sineOut')
		runTimer('volverAlTrigger', 0.4);
	end
	
	if curStep == 952 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -150
		targetOffsetY = -150
		tweenTime = 0.1
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.1, 0.1, 'sineOut')
		runTimer('volverAlTrigger', 0.1);
	end
	
	if curStep == 956 then
		setProperty('camZooming', false)
		startOffsetX = camOffsetX
		startOffsetY = camOffsetY
		targetOffsetX = -150
		targetOffsetY = 0
		tweenTime = 0.1
		tweenTimer = 0
		tweening = true
		doTweenZoom('zoomIn', 'camGame', 1.1, 0.1, 'sineOut')
		runTimer('volverAlTrigger', 0.1);
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
				triggerEvent('Camera Follow Pos', xx2 + camOffsetX - ofs, yy2 + camOffsetY)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos', xx2 + camOffsetX + ofs, yy2 + camOffsetY)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos', xx2 + camOffsetX, yy2 + camOffsetY - ofs)
			elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos', xx2 + camOffsetX, yy2 + camOffsetY + ofs)
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