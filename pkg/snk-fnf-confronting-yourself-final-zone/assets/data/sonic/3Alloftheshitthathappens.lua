-- DO NOT DELETE THIS FILE.
-- ... i mean you can if you want but then it'll just break.
-- trust me.
-- im not hiding anything.

selectedsong = 1
canselect = 0
canflicker = 1
introstillgoing = 1
local widescreen = true
local selectedd = false

wideScreen = (26 * 6) + 4

function onStartCountdown()
	-- countdown started, duh
	if not allowCountdown then
		return Function_Stop
	end
	return Function_Continue;
end

function onCreate()
	addHaxeLibrary("Lib", "openfl");
	setProperty('cameraSpeed', 99)

	setPropertyFromClass('openfl.Lib', 'application.window.title', "SONIC")
	
	setProperty('scoreTxt.alpha', 0)
	setProperty('botplayTxt.visible', false)
	setProperty('healthBar.alpha', 0)
	setProperty('healthBarBG.alpha', 0)

	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('boyfriend.alpha', 0)
	setProperty('dad.alpha', 0)
	setProperty('gf.alpha', 0)
	
	makeLuaSprite('bloodbg', 'title/bloodbg', 0, 0)
	setProperty('bloodbg.antialiasing', false)
	scaleObject('bloodbg', 3, 3)
	setObjectCamera('bloodbg', 'hud')
	addLuaSprite('bloodbg')

	makeLuaSprite('moutains', 'title/mountains', 0, 200)
	setProperty('moutains.antialiasing', false)
	scaleObject('moutains', 3, 3)
	setObjectCamera('moutains', 'hud')
	addLuaSprite('moutains')

	makeLuaSprite('clouds', 'title/clouds', 0, 0)
	setProperty('clouds.antialiasing', false)
	scaleObject('clouds', 3, 3)
	setObjectCamera('clouds', 'hud')
	addLuaSprite('clouds')

	makeLuaSprite('waitbox', 'blackbox', -30, -30)
	scaleObject('waitbox', 1, 1)
	setProperty('waitbox.visible', false)
	addLuaSprite('waitbox')

	makeAnimatedLuaSprite('oiter', 'title/oiter', 0, 335)
	addAnimationByPrefix('oiter', 'oiter', 'oiter', 14, true)
	objectPlayAnimation('oiter', 'oiter')
	setProperty('oiter.antialiasing', false)
	scaleObject('oiter', 3, 3)
	setObjectCamera('oiter', 'hud')
	addLuaSprite('oiter', true)
	setObjectOrder('oiter', 1)

	makeLuaSprite('ringB', 'title/35B', 20, 60)
	setProperty('ringB.antialiasing', false)
	scaleObject('ringB', 3, 3)
	setObjectCamera('ringB', 'hud')
	addLuaSprite('ringB')
	setObjectOrder('ringB', 3)

	makeLuaSprite('sonic', 'title/35F', 50, 230)
	setProperty('sonic.antialiasing', false)
	setProperty('sonic.visible', false)
	scaleObject('sonic', 3, 3)
	setObjectCamera('sonic', 'hud')
	addLuaSprite('sonic', true)
	setObjectOrder('sonic', 5)

	makeAnimatedLuaSprite('sonec', 'title/title', 20, 60)
	addAnimationByPrefix('sonec', 'sonec', 'deez', 6, false)
	setProperty('sonec.antialiasing', false)
	setProperty('sonec.visible', false)
	scaleObject('sonec', 3, 3)
	objectPlayAnimation('sonec', 'deez')
	setObjectCamera('sonec', 'hud')
	addLuaSprite('sonec', true)

	makeAnimatedLuaSprite('statix3', 'title/static', 0, 0)
	addAnimationByPrefix('statix3', 'statix3', 'static', 18, true)
	setProperty('statix3.visible', false)
	setProperty('statix3.alpha', 1)
	scaleObject('statix3', 2.9, 3.3)
	objectPlayAnimation('statix3', 'statix3')
	setObjectCamera('statix3', 'hud')
	addLuaSprite('statix3', false)

	makeAnimatedLuaSprite('statix1', 'title/NewTitleMenuBG', 0, 0)
	addAnimationByPrefix('statix1', 'statix1', 'TitleMenuSSBG instance 1', 24, true)
	setProperty('statix1.visible', false)
	setProperty('statix1.alpha', 0.5)
	scaleObject('statix1', 2.3, 2.9)
	objectPlayAnimation('statix1', 'statix1')
	setObjectCamera('statix1', 'hud')
	addLuaSprite('statix1', false)

	makeAnimatedLuaSprite('statix2', 'title/redstatic', 0, 0)
	addAnimationByPrefix('statix2', 'statix2', 'redstatic', 14, true)
	setProperty('statix2.visible', false)
	setProperty('statix2.alpha', 0.5)
	scaleObject('statix2', 2.3, 2.9)
	objectPlayAnimation('statix2', 'statix2')
	setObjectCamera('statix2', 'hud')
	addLuaSprite('statix2', false)

	makeAnimatedLuaSprite('titleexe', 'title/titleexe', 20, 60)
	addAnimationByPrefix('titleexe', 'titleexe', 'titleexe', 30, false)
	addAnimationByPrefix('titleexe', 'nuts', 'nuts', 6, false)
	setProperty('titleexe.antialiasing', false)
	setProperty('titleexe.visible', false)
	scaleObject('titleexe', 3, 3)
	objectPlayAnimation('titleexe', 'nuts')
	setObjectCamera('titleexe', 'hud')
	addLuaSprite('titleexe', true)

	makeLuaSprite('ring', 'title/35', 20, 60)
	setProperty('ring.antialiasing', false)
	scaleObject('ring', 3, 3)
	setObjectCamera('ring', 'hud')
	addLuaSprite('ring')
	setObjectOrder('ring', 5)
	
	makeLuaSprite('exetitle', 'title/35G', 20, 60)
	setProperty('exetitle.antialiasing', false)
	scaleObject('exetitle', 3, 3)
	setObjectCamera('exetitle', 'hud')
	addLuaSprite('exetitle')
	setProperty('exetitle.alpha', 0)
	addLuaSprite('exetitle', true)

	makeLuaSprite('mask', 'title/35E', 20, 60)
	setProperty('mask.antialiasing', false)
	scaleObject('mask', 3, 3)
	setObjectCamera('mask', 'hud')
	addLuaSprite('mask')
	setObjectOrder('mask', 8)

	makeLuaSprite('redfilter', 'title/redfilter', 0, 0)
	setBlendMode('redfilter', 'Lighten')
	setProperty('redfilter.antialiasing', false)
	setObjectCamera('redfilter', 'hud')
	scaleObject('redfilter', 3, 3)
	updateHitbox('redfilter')
	addLuaSprite('redfilter', true)
	setProperty('redfilter.visible', false)



--- SEGA LOGO NOW!!!

	makeAnimatedLuaSprite('segaaa', 'title/segaaa', -40, 0)
	--addAnimationByPrefix('segaaa', 'segaaa', 'segaaa', 24, false)
	setProperty('segaaa.antialiasing', false)
	setProperty('segaaa.visible', true)
	scaleObject('segaaa', 3.22, 3.22)
	--objectPlayAnimation('segaaa', 'segaaa')
	setObjectCamera('segaaa', 'hud')
	addLuaSprite('segaaa', false)
	doTweenY('sega1', 'waitbox', 1, 0.1, 'linear')
	
	makeLuaSprite('ts', 'title/34', -40, 0)
	scaleObject('ts', 3.22, 3.22)
	setProperty('ts.antialiasing', false)
	setProperty('ts.alpha', 0)
	setObjectCamera('ts', 'other')
	addLuaSprite('ts', true)

	makeLuaSprite('hud1', 'blackbox', 0, 0)
	scaleObject('hud1', 6, 6)
	setProperty('hud1.alpha', 0)
	setObjectCamera('hud1', 'other')
	addLuaSprite('hud1')
	doTweenX('segawait', 'hud1', -20, 1, linear)

	makeLuaSprite('wb', 'whitebox', 0, 0)
	scaleObject('wb', 6, 6)
	setProperty('wb.alpha', 0)
	setBlendMode('wb', 'Lighten')
	setObjectCamera('wb', 'other')
	addLuaSprite('wb')


--- DATASELECT!! :3

	makeLuaSprite('databg', 'title/databg', -20, -0)
	scaleObject('databg', 3.22, 3.22)
	setProperty('databg.antialiasing', false)
	setObjectCamera('databg', 'hud')
	addLuaSprite('databg')
	doTweenX('databg1', 'databg', -512*3.22, 11, 'linear')

	makeLuaSprite('databg2', 'title/databg', 492*3.22, -0)
	scaleObject('databg2', 3.22, 3.22)
	setProperty('databg2.antialiasing', false)
	setObjectCamera('databg2', 'hud')
	addLuaSprite('databg2')
	doTweenX('databg2', 'databg2', -20*3.22, 11, 'linear')
	
	makeLuaSprite('ds', 'title/dataselect', -20, 0)
	scaleObject('ds', 3.22, 3.22)
	setProperty('ds.antialiasing', false)
	setObjectCamera('ds', 'hud')
	addLuaSprite('ds')

	makeLuaSprite('databox', 'title/databox1', -20, -0)
	scaleObject('databox', 3.22, 3.22)
	setProperty('databox.antialiasing', false)
	setObjectCamera('databox', 'hud')
	addLuaSprite('databox')


	makeLuaSprite('tooslow', 'title/TS', -20, -0)
	scaleObject('tooslow', 3.22, 3.22)
	setProperty('tooslow.antialiasing', false)
	setObjectCamera('tooslow', 'hud')
	setProperty('tooslow.alpha', 0)
	addLuaSprite('tooslow', true)

	makeLuaSprite('youcantrun', 'title/YCR', -20, -0)
	scaleObject('youcantrun', 3.22, 3.22)
	setProperty('youcantrun.antialiasing', false)
	setProperty('youcantrun.visible', false)
	setObjectCamera('youcantrun', 'hud')
	addLuaSprite('youcantrun', true)

	makeLuaSprite('databox2', 'title/databox2', -20, -0)
	scaleObject('databox2', 3.22, 3.22)
	setProperty('databox2.antialiasing', false)
	setProperty('databox2.alpha', 0)
	setObjectCamera('databox2', 'hud')
	addLuaSprite('databox2', true)
	doTweenX('databoxloop2', 'waitbox', -20, 0.3, linear)


	makeAnimatedLuaSprite('dataarrows1', 'title/dataarrows', -20, 0)
	addAnimationByPrefix('dataarrows1', 'left', 'left', 12, false)
	addAnimationByPrefix('dataarrows1', 'leftpress', 'leftpress', 12, false)
	objectPlayAnimation('dataarrows1', 'left')
	setProperty('dataarrows1.antialiasing', false)
	scaleObject('dataarrows1', 3.22, 3.22)
	setObjectCamera('dataarrows1', 'hud')
	addLuaSprite('dataarrows1', false)

	makeAnimatedLuaSprite('dataarrows2', 'title/dataarrows', -20, 0)
	addAnimationByPrefix('dataarrows2', 'right', 'right', 12, false)
	addAnimationByPrefix('dataarrows2', 'rightpress', 'rightpress', 12, false)
	objectPlayAnimation('dataarrows2', 'right')
	setProperty('dataarrows2.antialiasing', false)
	scaleObject('dataarrows2', 3.22, 3.22)
	setObjectCamera('dataarrows2', 'hud')
	addLuaSprite('dataarrows2', false)

	makeAnimatedLuaSprite('datastatic', 'title/datastatic', -20, 0)
	addAnimationByPrefix('datastatic', 'datastatic', 'datastatic', 25, false)
	setProperty('datastatic.antialiasing', false)
	scaleObject('datastatic', 3.22, 3.22)
	setObjectCamera('datastatic', 'hud')
	addLuaSprite('datastatic', true)

	setProperty('dataarrows1.visible', false)
	setProperty('dataarrows2.visible', false)
	setProperty('databox.visible', false)
	setProperty('databox2.visible', false)
	setProperty('databg.visible', false)
	setProperty('databg2.visible', false)
	setProperty('ds.visible', false)
	setProperty('datastatic.visible', false)
	setProperty('tooslow.visible', false)
	setProperty('youcantrun.visible', false)
	setProperty('hud1.alpha', 1)
end

function onTweenCompleted(tag)
	if tag == 'sega1' then
		playSound('titlescreen', 1, 'titlescreen')
		doTweenX('segawait', 'hud1', -20, 0.4, linear)
	end
	if tag == 'segawait' then
		doTweenAlpha('byye', 'hud1', 0, 0.001, linear)
		addAnimationByPrefix('segaaa', 'segaaa', 'segaaa', 24, false)
		objectPlayAnimation('segaaa', 'segaaa')
		doTweenX('segawait1', 'waitbox', 0, 4.3, linear)
	end
	if tag == 'segawait1' then
		doTweenAlpha('heloo', 'hud1', 1, 0.35, linear)
		doTweenX('tswait1', 'waitbox', 0, 0.5, linear)
	end
	if tag == 'tswait1' then
		removeLuaSprite('segaaa')
		doTweenAlpha('hoi', 'ts', 1, 0.35, linear)
		doTweenAlpha('hoii', 'hud1', 1, 0.35, linear)
		doTweenX('tswait2', 'waitbox', 0, 2.2, linear)
	end
	if tag == 'tswait2' then
		doTweenAlpha('heyy', 'ts', 0, 0.35, linear)
		doTweenAlpha('hoiii', 'hud1', 1, 0.35, linear)
		doTweenX('tswait3', 'waitbox', 0, 0.6, linear)
	end
	if tag == 'tswait3' then
		doTweenAlpha('sups', 'hud1', 0, 0.25, linear)
		doTweenX('introd', 'waitbox', 0, 0.6, linear)
	end
	if tag == 'introd' then
		doTweenX('hud2t', 'hud1', -20, 0.1, linear)
	end
	if tag == 'hud2t' then
		doTweenX('hand1', 'waitbox', 0, 0.2, 'linear')
	end
	if tag == 'hand1' then
		setProperty('sonic.visible', true)
		doTweenY('helo', 'sonic', 60, 0.15, 'linear');
	end
	if tag == 'helo' then
		removeLuaSprite('sonic')
		removeLuaSprite('ring')
		removeLuaSprite('mask')
		setProperty('sonec.visible', true)
		addAnimationByPrefix('sonec', 'kidnamedfinger', 'sonec', 8, false)
		objectPlayAnimation('sonec', 'kidnamedfinger')
		doTweenY('wait6', 'waitbox', 1, 5.65, 'linear')
		
		doTweenX('cloudscrol', 'clouds', -720, 5.65, 'linear')
		doTweenX('moutainscroll', 'moutains', -1500, 5.65, 'linear')
		doTweenX('oiterscroll', 'oiter', -2000, 5.65, 'linear')
		doTweenX('bloodbgscroll', 'bloodbg', -2000, 5.65, 'linear')
	end
	if tag == 'wait6' then
		removeLuaSprite('sonec')
		removeLuaSprite('ringB')
		setProperty('exetitle.alpha', 1)
		doTweenY('wait7', 'waitbox', 1, 0.2, 'linear')
		removeLuaSprite('oiter')
		removeLuaSprite('clouds')
		removeLuaSprite('moutains')
	end
	if tag == 'wait7' then
		setProperty('hud1.alpha', 1)
		doTweenY('wait66', 'waitbox', 4.4, 2, 'linear')
		removeLuaSprite('exetitle')
		removeLuaSprite('bloodbg')
	end
	if tag == 'wait66' then
		setProperty('hud1.alpha', 1)
		doTweenAlpha('hellloblackboc', 'hud1', 0, 0.6, 'linear')
		canselect = 1
		selectedsong = 1
		playSound('datatheme', 1, 'datathemeyes')
		setProperty('dataarrows1.visible', true)
		setProperty('dataarrows2.visible', true)
		setProperty('databox.visible', true)
		setProperty('databox2.visible', true)
		setProperty('databg.visible', true)
		setProperty('ds.visible', true)
		setProperty('databg2.visible', true)
		setProperty('tooslow.visible', true)
		setProperty('youcantrun.visible', true)
		setProperty('datastatic.visible', true)
		setProperty('tooslow.alpha', 1)
	end

--DATASELECT TOO SLOW
	if tag == 'TOOSLOWwait' then
		playSound('laugh', 1)
		doTweenY('waitTS', 'waitbox', 1, 2.25, 'linear')
		widescreen = false
		selectedd = true
	end
	if tag == 'waitTS' then
		setProperty('hud1.alpha', 1)
		doTweenY('TSwait', 'waitbox', 0, 2, 'linear')
	end
	if tag == 'TSwait' then
		loadSong('confronting-yourself-(jario16)',0)
	end

--DATASELECT YOU CANT RUN
	if tag == 'YOUCANTRUNwait' then
		playSound('laugh', 1)
		doTweenY('waitYCR', 'waitbox', 1, 2.25, 'linear')
		widescreen = true
		selectedd = true
	end
	if tag == 'waitYCR' then
		setProperty('hud1.alpha', 1)
		doTweenY('YCRwait', 'waitbox', 0, 2, 'linear')
	end
	if tag == 'YCRwait' then
		loadSong('confronting-yourself-(jario16)',1)
	end

--databoxloop:3
	if tag == 'databoxloop2' and canflicker == 1 then
		doTweenX('databoxloop1', 'waitbox', -20, 0.14, 'linear')
		setProperty('databox2.alpha', 0)
	end
	if tag == 'databoxloop1' then
		setProperty('databox2.alpha', 1)
		doTweenX('databoxloop2', 'waitbox', -20, 0.14, 'linear')
	end

--BgLoop
	if tag == 'databg2' and canflicker == 1 then
		setProperty('databg.x', -20*3.22)
		setProperty('databg2.x', 492*3.22)
		doTweenX('databg1', 'databg', -512*3.22, 11, 'linear')
		doTweenX('databg2', 'databg2', -20*3.22, 11, 'linear')
	end

end

function onUpdate(elapsed)
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.RIGHT') and canselect == 1 then
		objectPlayAnimation('dataarrows2', 'right', true)
		selectedsong = selectedsong+1
		playSound('select', 1)
		playSound('simplejumpsound', 0.6)
		objectPlayAnimation('datastatic', 'datastatic', true)
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.LEFT') and canselect == 1 then
		objectPlayAnimation('dataarrows1', 'left', true)
		selectedsong = selectedsong-1
		playSound('select', 1)
		playSound('simplejumpsound', 0.6)
		objectPlayAnimation('datastatic', 'datastatic', true)
	end
	if selectedsong == 1 then
		setProperty('tooslow.visible', true)
		setProperty('youcantrun.visible', false)
	end
	if selectedsong == 2 then
		setProperty('tooslow.visible', false)
		setProperty('youcantrun.visible', true)
	end	
	if selectedsong == 3 then
		selectedsong = 1
	end
	if selectedsong == 0 then
		selectedsong = 2
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and selectedsong == 1 then
		if canselect == 1 then
			doTweenY('TOOSLOWwait', 'waitbox', 1, 1.5, 'linear')
			canselect = 0
			canflicker = 0
			cancelTween('databg1')
			cancelTween('databg2')
			setSoundVolume('datathemeyes', 0)
			setProperty('databox2.visible', false)
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and selectedsong == 2 then
		if canselect == 1 then
			doTweenY('YOUCANTRUNwait', 'waitbox', 1, 1.5, 'linear')
			canselect = 0
			canflicker = 0
			cancelTween('databg1')
			cancelTween('databg2')
			setSoundVolume('datathemeyes', 0)
			setProperty('databox2.visible', false)
		end
	end

	--debug
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') then
		restartSong(true);
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
		endSong(true);
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
		doTweenY('wait66', 'waitbox', 4.4, 0.1, 'linear')
	end

	if (getPropertyFromClass('openfl.Lib', 'application.window.fullscreen') == true or getPropertyFromClass('openfl.Lib', 'application.window.maximise') == true) then
		setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
		playSound('fullscreen', 1)
		stopSound('titlescreen')
		stopSound('datathemeyes')
		runHaxeCode([[
		Application.current.window.alert("Irregularity Detected\nWhat Failed: ('INCORRECT_RESOLUTION')\nReason For Error: 'Do not fullscreen or resize the application.'\nStopping Emulation\nClosing Game", "ERROR");
		]]);
		os.exit()
	end

end

function onDestroy()
runHaxeCode([[
    var stage = Lib.current.stage;
    var resolutionX = 0;
    var resolutionY = 0;

    if (stage.window != null)
    {
        var display = stage.window.display;

        if (display != null)
        {
            resolutionX = Math.ceil(display.currentMode.width * stage.window.scale);
            resolutionY = Math.ceil(display.currentMode.height * stage.window.scale);
        }
    }

    if(resolutionX <= 0){
        resolutionX = stage.stageWidth;
        resolutionY = stage.stageHeight;
    }

  Lib.application.window.x = (resolutionX - Lib.application.window.width)/2;
  Lib.application.window.y = (resolutionY - Lib.application.window.height)/2;
]]);
	if selectedd == false then
		setPropertyFromClass('openfl.Lib', 'application.window.borderless', false)
		setPropertyFromClass('openfl.Lib', 'application.window.title', "Friday Night Funkin': Psych Engine")
	end

	if widescreen == true then
		setPropertyFromClass("flixel.FlxG", "width", 1280)
		setPropertyFromClass("openfl.Lib", "current.stage.stageWidth", 1280)
		setPropertyFromClass("openfl.Lib", "application.window.width", 1280)
		setPropertyFromClass("openfl.Lib", "application.window.height", 720)
		setPropertyFromClass("openfl.Lib", "application.window.x", getPropertyFromClass("openfl.Lib", "application.window.x") - wideScreen)
		setPropertyFromClass("openfl.Lib", "application.window.resizable", true)
	end
end

-- delete it if you dare.