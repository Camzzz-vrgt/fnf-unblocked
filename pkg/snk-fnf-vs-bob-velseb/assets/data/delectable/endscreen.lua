canEnd = false

function onCreate()
	makeLuaSprite("thieves", "freeplay", 0, 0)
	setObjectCamera("thieves", "camHUD")
	setObjectOrder("thieves", 100)
	addLuaSprite("thieves")
	setProperty("thieves.alpha", 0)
end

function onEndSong()
	if not canEnd then
		doTweenAlpha("thievesTween", "thieves", 1, 1)
		return Function_Stop
	else
		return Function_Continue
	end
end

function onUpdate()
	if getProperty("thieves.alpha") == 1 then
		if keyJustPressed("space") or keyboardJustPressed("ESCAPE") or keyboardJustPressed("ENTER") then
			canEnd = true
			endSong()
		end
	end
end