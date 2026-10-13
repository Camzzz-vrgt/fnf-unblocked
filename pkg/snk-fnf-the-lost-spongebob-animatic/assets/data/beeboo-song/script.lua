function onCreate()

	makeLuaSprite("blackk")
	makeGraphic("blackk", 1280, 720, "000000")
	addLuaSprite("blackk", false)
	setProperty("blackk.visible", true)
	setObjectCamera("blackk", "hud")
	
	makeLuaSprite('beeboosong', 'titlecards/beeboosong', -500, 15)
	setLuaSpriteScrollFactor('beeboosong', 1.0, 1.0)
	scaleObject('beeboosong', 0.35, 0.35)
	addLuaSprite('beeboosong', true)
	setObjectCamera("beeboosong", "hud")
	
	makeLuaSprite('hans', 'titlecards/hans', -1000, -25)
	setLuaSpriteScrollFactor('hans', 1.0, 1.0)
	scaleObject('hans', 0.35, 0.35)
	addLuaSprite('hans', true)
	setObjectCamera("hans", "hud")

end

function onSongStart()
    doTweenAlpha("blackkfade", "blackk", 0, 3)
	doTweenX("theonethatgoes",'beeboosong', 10, 0.5,"CubicIn")
	doTweenX("hanshand",'hans', -540, 0.5,"CubicIn")
end

function onBeatHit()

	if curBeat == 15 then
	doTweenX("theonethatgoes",'beeboosong', -500, 0.5,"CubicIn")
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

	if curStep == 1408 then
	setProperty("blackk.alpha", 1)
	end

end