function onCreate()

	makeLuaSprite("blackk")
	makeGraphic("blackk", 1280, 720, "000000")
	addLuaSprite("blackk", false)
	setProperty("blackk.visible", true)
	setObjectCamera("blackk", "hud")
	
	makeLuaSprite('extrascary', 'titlecards/extrascary', -500, 15)
	setLuaSpriteScrollFactor('extrascary', 1.0, 1.0)
	scaleObject('extrascary', 0.35, 0.35)
	addLuaSprite('extrascary', true)
	setObjectCamera("extrascary", "hud")
	
	makeLuaSprite('hans', 'titlecards/hans', -1000, -25)
	setLuaSpriteScrollFactor('hans', 1.0, 1.0)
	scaleObject('hans', 0.35, 0.35)
	addLuaSprite('hans', true)
	setObjectCamera("hans", "hud")

end

function onSongStart()
    doTweenAlpha("blackkfade", "blackk", 0, 3)
	doTweenX("jumbojosh",'extrascary', 10, 0.5,"CubicIn")
	doTweenX("hanshand",'hans', -540, 0.5,"CubicIn")

end

function onBeatHit()

	if curBeat == 15 then
	doTweenX("jumbojosh",'extrascary', -500, 0.5,"CubicIn")
	doTweenX("hanshand",'hans', -1000, 0.5,"CubicIn")
	end
	
	if curBeat == 2 then
	doTweenX("hanshand",'hans', -1000, 0.5,"CubicIn")
	end
	
	if curBeat == 12 then
	doTweenX("hanshand",'hans', -540, 0.5,"CubicIn")
	end

end

function onStepHit()

	if curStep == 0 then
	setProperty("blackk.alpha", 0)
	end

end

function onStepHit()

	if curStep == 1680 then
	setProperty("blackk.alpha", 1)
	end

end