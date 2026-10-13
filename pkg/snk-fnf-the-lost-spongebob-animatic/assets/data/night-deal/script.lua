function onCreate()
	
	makeLuaSprite('nightdeal', 'titlecards/nightdeal', -500, 15)
	setLuaSpriteScrollFactor('nightdeal', 1.0, 1.0)
	scaleObject('nightdeal', 0.35, 0.35)
	addLuaSprite('nightdeal', true)
	setObjectCamera("nightdeal", "hud")
	
	makeLuaSprite('hans', 'titlecards/hans', -1000, -25)
	setLuaSpriteScrollFactor('hans', 1.0, 1.0)
	scaleObject('hans', 0.35, 0.35)
	addLuaSprite('hans', true)
	setObjectCamera("hans", "hud")

end

function onSongStart()

	doTweenX("hurhurhurhur",'nightdeal', 10, 0.5,"CubicIn")
	doTweenX("hanshand",'hans', -540, 0.5,"CubicIn")

end

function onBeatHit()

	if curBeat == 15 then
	doTweenX("hurhurhurhur",'nightdeal', -500, 0.5,"CubicIn")
	doTweenX("hanshand",'hans', -1000, 0.5,"CubicIn")
	end
	
	if curBeat == 2 then
	doTweenX("hanshand",'hans', -1000, 0.5,"CubicIn")
	end
	
	if curBeat == 12 then
	doTweenX("hanshand",'hans', -540, 0.5,"CubicIn")
	end

end