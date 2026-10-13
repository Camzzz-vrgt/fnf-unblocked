function onCreate()
	
	makeLuaSprite('ugliestbitch', 'titlecards/ugliestbitch', -500, 15)
	setLuaSpriteScrollFactor('ugliestbitch', 1.0, 1.0)
	scaleObject('ugliestbitch', 0.35, 0.35)
	addLuaSprite('ugliestbitch', true)
	setObjectCamera("ugliestbitch", "hud")
	
	makeLuaSprite('hans', 'titlecards/hans', -1000, -25)
	setLuaSpriteScrollFactor('hans', 1.0, 1.0)
	scaleObject('hans', 0.35, 0.35)
	addLuaSprite('hans', true)
	setObjectCamera("hans", "hud")

end

function onSongStart()

	doTweenX("squilvia",'ugliestbitch', 10, 0.5,"CubicIn")
	doTweenX("hanshand",'hans', -540, 0.5,"CubicIn")

end

function onBeatHit()

	if curBeat == 15 then
	doTweenX("squilvia",'ugliestbitch', -500, 0.5,"CubicIn")
	doTweenX("hanshand",'hans', -1000, 0.5,"CubicIn")
	end
	
	if curBeat == 2 then
	doTweenX("hanshand",'hans', -1000, 0.5,"CubicIn")
	end
	
	if curBeat == 12 then
	doTweenX("hanshand",'hans', -540, 0.5,"CubicIn")
	end

end