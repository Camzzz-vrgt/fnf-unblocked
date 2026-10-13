--[[
Original Script  by Niko_matthew
Modified by Toast
]]

local introTextShown = false
local skipIntro = false

IntroTextSize = 102	
IntroSubTextSize = 34 

musicName = 'Object Error'
composerName = 'T1GD'
charterName = 'Diego26007'

fadeinTime = 1
showTime = 2
fadeoutTime = 1

function onCreate()
	makeLuaSprite('JukeBox', ' ', 0, 240)
	makeGraphic('JukeBox', 1280, 240, '000000')
	setObjectCamera('JukeBox', 'other')
	setProperty('JukeBox.alpha', 0)
	addLuaSprite('JukeBox', true)
	
	makeLuaText('JukeBoxText', musicName, 1280, 0, 310)
	setTextAlignment('JukeBoxText', 'center')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	setTextBorder('JukeBoxText', 5, '000000')
	setTextFont('JukeBoxText', 'PANDAPAN.TTF')
	setProperty('JukeBoxText.alpha', 0)
	addLuaText('JukeBoxText')
	

	makeLuaText('JukeBoxSubText', 'Composer: '..composerName..'    '..'Charter: '..charterName, 1280, 0, 380)
	setTextAlignment('JukeBoxSubText', 'center')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	setTextBorder('JukeBoxSubText', 3, '000000')
	setTextFont('JukeBoxSubText', 'PANDAPAN.TTF')
	setProperty('JukeBoxSubText.alpha', 0)
	addLuaText('JukeBoxSubText')	
end

function onStartCountdown()
	if not introTextShown then
		doTweenAlpha('JukeBoxShow', 'JukeBox', 0.5, fadeinTime)
		doTweenAlpha('JukeBoxTextShow', 'JukeBoxText', 1, fadeinTime)
		doTweenAlpha('JukeBoxSubTextShow', 'JukeBoxSubText', 1, fadeinTime)
		return Function_Stop;
	end

	return Function_Continue;
end

function onUpdatePost(elapsed)
	if not skipIntro and not getProperty('inCutscene') and keyJustPressed('accept') then
		setProperty('JukeBox.visible', false)
		setProperty('JukeBoxText.visible', false)
		setProperty('JukeBoxSubText.visible', false)
		introTextShown = true
		skipIntro = true
		startCountdown()
		debugPrint('Skip Introduce',''..skipIntro)
	end
end

function onTweenCompleted(tag)
	if tag == 'JukeBoxTextShow' then
		if not skipIntro then
			runTimer('JukeBoxWait', showTime, 1)
		else
			removeLuaSprite('JukeBox')
			removeLuaText('JukeBoxText')
			removeLuaText('JukeBoxSubText')
		end
	end

	if tag == 'JukeBoxFade' then
		introTextShown = true
		removeLuaSprite('JukeBox')
		removeLuaText('JukeBoxText')
		removeLuaText('JukeBoxSubText')
		startCountdown()
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'JukeBoxWait' then
		doTweenAlpha('JukeBoxFade', 'JukeBox', 0, fadeoutTime)
		doTweenAlpha('JukeBoxTextFade', 'JukeBoxText', 0, fadeoutTime)
		doTweenAlpha('JukeBoxSubTextFade', 'JukeBoxSubText', 0, fadeoutTime)
	end
end