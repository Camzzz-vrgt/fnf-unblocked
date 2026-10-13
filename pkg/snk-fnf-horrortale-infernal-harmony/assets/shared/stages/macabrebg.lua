local playVideo = true
function onCreate()
	-- background shit redone by SwagaRuney
	makeLuaSprite('bosque', 'stages/maca/forest', -600, -400);
	setScrollFactor('bosque',0.7,0.7);
	
	makeLuaSprite('puesto', 'stages/maca/post', -500, -400);
	setScrollFactor('puesto', 0.9, 0.9);
	scaleObject('puesto',1,1);
		        
	addLuaSprite('bosque', false);
	
	setProperty('cameraSpeed', 10.5)
	--setProperty("skipCountdown", true)

	createInstance('snowdinF', 'flixel.addons.display.FlxBackdrop', {nil,0x01})
	setProperty("snowdinF.y", -400)
	loadGraphic('snowdinF', 'stages/snowdinFog')
	scaleObject("snowdinF", 1, 1)
	setProperty('snowdinF.velocity.x', -70)
	setProperty("snowdinF.color", 0x6e0000)
	addInstance('snowdinF')
	addLuaSprite('puesto', false)
	triggerEvent("Toggle Ghost For All", nil, nil)
	--setProperty('snowdinF.alpha',0)

	--[[makeLuaSprite('sansStand','stages/maca/bg_full',350,250)
	scaleObject("sansStand", 0.7, 0.7)
	addLuaSprite("sansStand")
	setProperty("sansStand.visible", false)--]]

	for i = 1,2 do
		makeLuaSprite("borderCam"..i,nil, (i == 1 and (screenWidth-100) or 0), 0)
		makeGraphic("borderCam"..i, 1, 1, '000000')
		addLuaSprite("borderCam"..i)
		scaleObject("borderCam"..i, 100, screenHeight)
		setObjectCamera("borderCam"..i, "HUD")
		setProperty("borderCam"..i..'.visible', false)
	end
	--setProperty("introSoundsSuffix", '-silence')

end

function onStartCountdown()
	setProperty("camZoomingMult", 0)
	setProperty("boyfriend.visible", false)
	if isStoryMode and playVideo and not seenCutscene then
		startVideo('macabre')
		playVideo = false
		return Function_Stop
	end
end

function onSongStart()
	for i,v in ipairs ({'130','242','956','1068'}) do
		setPropertyFromGroup("playerStrums", (i-1), 'x', v)
		setPropertyFromGroup("opponentStrums", (i-1), 'x', v *  10)
	end
end

function onGameOverStart()
	setProperty("boyfriend.visible", false)
	
	makeAnimatedLuaSprite("fakeBoyfriend", "stages/maca/gameover/bfdead", getProperty("boyfriend.x"),getProperty("boyfriend.y"))
	--playAnim("fakeBoyfriend", "idle", true)
	scaleObject("fakeBoyfriend", 0.8, 0.8)

	makeAnimatedLuaSprite("buttonRetry", "stages/maca/gameover/retrybutton", getProperty("boyfriend.x") + 50, getProperty("boyfriend.y") - 100)
	--playAnim("buttonRetry", "idle", true)
	addAnimationByPrefix("fakeBoyfriend", "idle", "bfdead", 24, false)
	addAnimationByPrefix("buttonRetry", "idle", "retrybutton", 24, false)
	addLuaSprite("fakeBoyfriend")
	addLuaSprite("buttonRetry")
end

function onGameOverConfirm(isNotGoingToMenu)
	if isNotGoingToMenu then
		loadFrames("buttonRetry", "stages/maca/gameover/confirmretrybutton")
		updateHitbox("buttonRetry")
		addAnimationByPrefix("buttonRetry", "confirm", "confirmretrybutton", 24, false)
		playAnim("buttonRetry", "confirm", true)
	end	
end

function shadowAppear()
	for i,v in ipairs ({'boyfriend','borderCam1','borderCam2','dad','puesto'}) do
		setProperty(v..".visible", not getProperty(v..".visible"))
	end
	if getProperty("defaultCamZoom") ~= 0.68 then
		setProperty("defaultCamZoom", 0.68)
		setProperty("camGame.zoom", 0.68)
		triggerEvent("Camera Follow Pos", '1200', '760')
	else
		triggerEvent("Set Zoom", '0.43', '0.3')
		triggerEvent("Camera Follow Pos", '', '')
	end
end

function opponentNoteHit(_,d,_,s)
	if getProperty("camZoomingMult") == 0 then
		return
	end
	if not s then
		movzoom = (d == 0 and -0.008 or d == 3 and 0.008 or 0)
		doTweenZoom('camGamezoom','camGame',getProperty('camGame.zoom') + movzoom,0.08,'quartInOut')
	end
end