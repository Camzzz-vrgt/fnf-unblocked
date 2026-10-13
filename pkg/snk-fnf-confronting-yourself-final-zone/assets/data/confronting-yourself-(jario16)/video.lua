-- Sprite Video function by detective_baldi

-- REMINDER TO SNOW, "LOWQUALITY" MUST BE EQUAL TO FALSE, ITS CURRENTLY ON TRUE CUZ IM TOO LAZY TO CHANGE A VALUE, K COOL.

local widescreen = true
local currentboy = 0
local stop = false
local black = false

function onCreate()

	if getPropertyFromClass("openfl.Lib", "application.window.width") ~= 960 then
		widescreen = true
	else
		widescreen = false
	end
	if lowQuality == false then
	
		if widescreen == false then
			precacheImage('fuckyouhxcodec/normalfloaty1')
			precacheImage('fuckyouhxcodec/normalfloaty2')
			precacheImage('fuckyouhxcodec/normalfloaty3')
			precacheImage('fuckyouhxcodec/normalfloaty4')
		else
			precacheImage('fuckyouhxcodec/widefloaty1')
			precacheImage('fuckyouhxcodec/widefloaty2')
			precacheImage('fuckyouhxcodec/widefloaty3')
			precacheImage('fuckyouhxcodec/widefloaty4')
		end
		
		if widescreen == false then
			makeAnimatedLuaSprite('NormalFloaty1', 'fuckyouhxcodec/normalfloaty1', 0, 0)
			addAnimationByPrefix('NormalFloaty1', 'NormalFloaty1', 'normalfloaty1', 60, false)
			objectPlayAnimation('NormalFloaty1', 'NormalFloaty1')
			setProperty('NormalFloaty1.antialiasing', false)
			scaleObject('NormalFloaty1', 1.5, 1.5)
			addLuaSprite('NormalFloaty1', true)
			setObjectCamera('NormalFloaty1', 'other')
			setBlendMode('NormalFloaty1', 'add')
			setProperty('NormalFloaty1.alpha', 0)
	
			makeAnimatedLuaSprite('NormalFloaty2', 'fuckyouhxcodec/normalfloaty2', 0, 0)
			addAnimationByPrefix('NormalFloaty2', 'NormalFloaty2', 'normalfloaty2', 60, false)
			objectPlayAnimation('NormalFloaty2', 'NormalFloaty2')
			setProperty('NormalFloaty2.antialiasing', false)
			scaleObject('NormalFloaty2', 1.5, 1.5)
			addLuaSprite('NormalFloaty2', true)
			setObjectCamera('NormalFloaty2', 'other')
			setBlendMode('NormalFloaty2', 'add')
			setProperty('NormalFloaty2.alpha', 0)
			
			makeAnimatedLuaSprite('NormalFloaty3', 'fuckyouhxcodec/normalfloaty3', 0, 0)
			addAnimationByPrefix('NormalFloaty3', 'NormalFloaty3', 'normalfloaty3', 60, false)
			objectPlayAnimation('NormalFloaty3', 'NormalFloaty3')
			setProperty('NormalFloaty3.antialiasing', false)
			scaleObject('NormalFloaty3', 1.5, 1.5)
			addLuaSprite('NormalFloaty3', true)
			setObjectCamera('NormalFloaty3', 'other')
			setBlendMode('NormalFloaty3', 'add')
			setProperty('NormalFloaty3.alpha', 0)
			
			makeAnimatedLuaSprite('NormalFloaty4', 'fuckyouhxcodec/normalfloaty4', 0, 0)
			addAnimationByPrefix('NormalFloaty4', 'NormalFloaty4', 'normalfloaty4', 60, false)
			objectPlayAnimation('NormalFloaty4', 'NormalFloaty4')
			setProperty('NormalFloaty4.antialiasing', false)
			scaleObject('NormalFloaty4', 1.5, 1.5)
			addLuaSprite('NormalFloaty4', true)
			setObjectCamera('NormalFloaty4', 'other')
			setBlendMode('NormalFloaty4', 'add')
			setProperty('NormalFloaty4.alpha', 0)
		else
			makeAnimatedLuaSprite('WideFloaty1', 'fuckyouhxcodec/widefloaty1', 0, 0)
			addAnimationByPrefix('WideFloaty1', 'WideFloaty1', 'widefloaty1', 60, false)
			objectPlayAnimation('WideFloaty1', 'WideFloaty1')
			setProperty('WideFloaty1.antialiasing', false)
			scaleObject('WideFloaty1', 1.5, 1.5)
			addLuaSprite('WideFloaty1', true)
			setObjectCamera('WideFloaty1', 'other')
			setBlendMode('WideFloaty1', 'add')
			setProperty('WideFloaty1.alpha', 0)
	
			makeAnimatedLuaSprite('WideFloaty2', 'fuckyouhxcodec/widefloaty2', 0, 0)
			addAnimationByPrefix('WideFloaty2', 'WideFloaty2', 'widefloaty2', 60, false)
			objectPlayAnimation('WideFloaty2', 'WideFloaty2')
			setProperty('WideFloaty2.antialiasing', false)
			scaleObject('WideFloaty2', 1.5, 1.5)
			addLuaSprite('WideFloaty2', true)
			setObjectCamera('WideFloaty2', 'other')
			setBlendMode('WideFloaty2', 'add')
			setProperty('WideFloaty2.alpha', 0)
	
			makeAnimatedLuaSprite('WideFloaty3', 'fuckyouhxcodec/widefloaty3', 0, 0)
			addAnimationByPrefix('WideFloaty3', 'WideFloaty3', 'widefloaty3', 60, false)
			objectPlayAnimation('WideFloaty3', 'WideFloaty3')
			setProperty('WideFloaty3.antialiasing', false)
			scaleObject('WideFloaty3', 1.5, 1.5)
			addLuaSprite('WideFloaty3', true)
			setObjectCamera('WideFloaty3', 'other')
			setBlendMode('WideFloaty3', 'add')
			setProperty('WideFloaty3.alpha', 0)
	
			makeAnimatedLuaSprite('WideFloaty4', 'fuckyouhxcodec/widefloaty4', 0, 0)
			addAnimationByPrefix('WideFloaty4', 'WideFloaty4', 'widefloaty4', 60, false)
			objectPlayAnimation('WideFloaty4', 'WideFloaty4')
			setProperty('WideFloaty4.antialiasing', false)
			scaleObject('WideFloaty4', 1.5, 1.5)
			addLuaSprite('WideFloaty4', true)
			setObjectCamera('WideFloaty4', 'other')
			setBlendMode('WideFloaty4', 'add')
			setProperty('WideFloaty4.alpha', 0)
		end
	end
end

function onStepHit()
	if curStep >= 1023 and curStep <= 1050 then
		if widescreen == false then
			removeLuaSprite('NormalFloaty1')
			removeLuaSprite('NormalFloaty2')
			removeLuaSprite('NormalFloaty3')
			removeLuaSprite('NormalFloaty4')
		else
			removeLuaSprite('WideFloaty1')
			removeLuaSprite('WideFloaty2')
			removeLuaSprite('WideFloaty3')
			removeLuaSprite('WideFloaty4')
		end
	end
--767
	if curStep >= 767 and curStep <= 1023 then
		if widescreen == false then
			setProperty('NormalFloaty1.alpha', 1)
			setProperty('NormalFloaty2.alpha', 1)
			setProperty('NormalFloaty3.alpha', 1)
			setProperty('NormalFloaty4.alpha', 1)
		else
			setProperty('WideFloaty1.alpha', 1)
			setProperty('WideFloaty2.alpha', 1)
			setProperty('WideFloaty3.alpha', 1)
			setProperty('WideFloaty4.alpha', 1)
		end
	end
	
	if curStep >= 767 and curStep <= 1023 then
		black = true
	else
		black = false
	end
end

function onBeatHit()
	if curBeat %4 == 0 then
		runTimer('stop', 0.01)
		--debugPrint(currentboy)
	end
	
	if curBeat %2 == 0 then
		runTimer('black', 0.01)
	end
end

function onUpdate(elasped)

	if currentboy >= 5 then
		currentboy = 1
	end
	
	if currentboy == 1 then
		if widescreen == false then
			setProperty('NormalFloaty1.visible', false)
			setProperty('NormalFloaty2.visible', true)
			setProperty('NormalFloaty3.visible', false)
			setProperty('NormalFloaty4.visible', false)
		else
			setProperty('WideFloaty1.visible', false)
			setProperty('WideFloaty2.visible', true)
			setProperty('WideFloaty3.visible', false)
			setProperty('WideFloaty4.visible', false)
		end
	elseif currentboy == 2 then
		if widescreen == false then
			setProperty('NormalFloaty1.visible', false)
			setProperty('NormalFloaty2.visible', false)
			setProperty('NormalFloaty3.visible', true)
			setProperty('NormalFloaty4.visible', false)
		else
			setProperty('WideFloaty1.visible', false)
			setProperty('WideFloaty2.visible', false)
			setProperty('WideFloaty3.visible', true)
			setProperty('WideFloaty4.visible', false)
		end
	elseif currentboy == 3 then
		if widescreen == false then
			setProperty('NormalFloaty1.visible', false)
			setProperty('NormalFloaty2.visible', false)
			setProperty('NormalFloaty3.visible', false)
			setProperty('NormalFloaty4.visible', true)
		else
			setProperty('WideFloaty1.visible', false)
			setProperty('WideFloaty2.visible', false)
			setProperty('WideFloaty3.visible', false)
			setProperty('WideFloaty4.visible', true)
		end
	elseif currentboy == 4 then
		if widescreen == false then
			setProperty('NormalFloaty1.visible', true)
			setProperty('NormalFloaty2.visible', false)
			setProperty('NormalFloaty3.visible', false)
			setProperty('NormalFloaty4.visible', false)
		else
			setProperty('WideFloaty1.visible', true)
			setProperty('WideFloaty2.visible', false)
			setProperty('WideFloaty3.visible', false)
			setProperty('WideFloaty4.visible', false)
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'stop' then
		currentboy = currentboy + 1
		
		if currentboy == 1 or currentboy == 5 then
			if widescreen == false then
				objectPlayAnimation('NormalFloaty2', 'NormalFloaty2')
			else
				objectPlayAnimation('WideFloaty2', 'WideFloaty2')
			end
		elseif currentboy == 2 then
			if widescreen == false then
				objectPlayAnimation('NormalFloaty3', 'NormalFloaty3')
			else
				objectPlayAnimation('WideFloaty3', 'WideFloaty3')
			end
		elseif currentboy == 3 then
			if widescreen == false then
				objectPlayAnimation('NormalFloaty4', 'NormalFloaty4')
			else
				objectPlayAnimation('WideFloaty4', 'WideFloaty4')
			end
		elseif currentboy == 4 then
			if widescreen == false then
				objectPlayAnimation('NormalFloaty1', 'NormalFloaty1')
			else
				objectPlayAnimation('WideFloaty1', 'WideFloaty1')
			end
		end
	end
	
	if tag == 'black' then
		if black == true then
			setProperty('black.alpha', 0.9)
			doTweenAlpha('blackflash', 'black', 0.3, 0.4, 'quadInOut')
		end
	end
end

------FUCK YOU HXCODEC I FUCKING HATE YOU CRASHING THE FUCKING GAME HAVING TO RECREATE ALL THIS SHIT FUCK YOU ASSHOLE FUCK SHIT DICK CUNT FUUUCK!!!!!!

--[[
function onCreate()
	
	if getPropertyFromClass("openfl.Lib", "application.window.width") ~= 960 then
		widescreen = true
	else
		widescreen = false
	end
	if lowQuality == false then
		precacheVideos('floatyboys')
		precacheVideos('floatyboysWIDE')
		precacheVideos('floatyboysLQ')	-- Precache
	end
end

function onCreatePost()
	-- this is just to force load the videos before the song starts, so when the section starts the game shouldn't have a massive lag spike.
	if lowQuality == false then
		if widescreen == false then
			makeVideoSprite('floatyboysload', 'floatyboys', 2280, 0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
			setProperty('floatyboysload_video.visible', false)
		else
			makeVideoSprite('floatyboysload2', 'floatyboysWIDE', 2280, 0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
			setProperty('floatyboysload2_video.visible', false)
		end
	end
end

function onUpdate(elapsed)
end

function onStepHit()
	if curStep == 767 then
		runTimer('floaty1', 0.01)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if lowQuality == false then
		if tag == 'floaty1' then
			if widescreen == false then
				makeVideoSprite('floatyboys', 'floatyboys', 0, 0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
				setProperty('floatyboys_video.alpha', 1) -- when you setProperty add _video
				setBlendMode('floatyboys_video', 'add')
			else
				makeVideoSprite('floatyboysWIDE', 'floatyboysWIDE', 0, 0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
				setProperty('floatyboysWIDE_video.alpha', 1) -- when you setProperty add _video
				setBlendMode('floatyboysWIDE_video', 'add')
			end
		end
		if tag == 'floaty2' then
			if widescreen == false then
				makeVideoSprite('floatyboys2', 'floatyboys', 0, 0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
				setProperty('floatyboys2_video.alpha', 1) -- when you setProperty add _video
				setBlendMode('floatyboys2_video', 'add')
			else
				makeVideoSprite('floatyboysWIDE2', 'floatyboysWIDE', 0, 0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
				setProperty('floatyboysWIDE2_video.alpha', 1) -- when you setProperty add _video
				doTweenAlpha('go','floatyboysWIDE2_video',1,1,'sineOut');
				setBlendMode('floatyboysWIDE2_video', 'add')
			end
		end
		if tag == 'floaty3' then
			if widescreen == false then
				makeVideoSprite('floatyboys3', 'floatyboys', 0, 0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
				setProperty('floatyboys3_video.alpha', 1) -- when you setProperty add _video
				setBlendMode('floatyboys3_video', 'add')
			else
				makeVideoSprite('floatyboysWIDE3', 'floatyboysWIDE', 0, 0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
				setProperty('floatyboysWIDE3_video.alpha', 1) -- when you setProperty add _video
				setBlendMode('floatyboysWIDE3_video', 'add')
			end
		end
		if tag == 'floaty4' then
			if widescreen == false then
				makeVideoSprite('floatyboys4', 'floatyboys', 0, 0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
				setProperty('floatyboys4_video.alpha', 1) -- when you setProperty add _video
				setBlendMode('floatyboys4_video', 'add')
			else
				makeVideoSprite('floatyboysWIDE4', 'floatyboysWIDE', 0, 0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
				setProperty('floatyboysWIDE4_video.alpha', 1) -- when you setProperty add _video
				setBlendMode('floatyboysWIDE4_video', 'add')
			end
		end

    end
end

function onVideoFinished(tag)
    --debugPrint('Video Finished! ('..tag..')') -- DISCLAMER! Will not call if the video has `shouldLoop` set to true!
end

--]]