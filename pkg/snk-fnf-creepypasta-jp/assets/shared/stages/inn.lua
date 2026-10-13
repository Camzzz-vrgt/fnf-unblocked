function onCreate()
	makeLuaSprite('inn_1_back', 'inn_1_back', -370, -137)

	makeLuaSprite('inn_1_front', 'inn_1_front', -370, -137)

	makeLuaSprite('black', 'black')
	doTweenAlpha('black', 'black', 0, 0.0001 / playbackRate, 'linear')
	setObjectCamera('black', 'hud')

	addLuaSprite('inn_1_back')
	addLuaSprite('inn_1_front', true)
	addLuaSprite('black', true)
end

---
--- @param tag string
---
function onTweenCompleted(tag)
	if tag == "black" then
		close(false)
	end
end
