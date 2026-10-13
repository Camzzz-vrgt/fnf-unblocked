function onCreate()
	makeLuaSprite('inn_1_back', 'inn_1_back', -370, -137)

	makeLuaSprite('inn_1_front', 'inn_1_front', -370, -137)

	makeLuaSprite('black', 'black')
	doTweenAlpha('black', 'black', 0, 0.0001 / playbackRate)
	setObjectCamera('black', 'hud')

	addLuaSprite('inn_1_back')
	addLuaSprite('inn_1_front', true)
	addLuaSprite('black', true)
scaleObject('inn_1_back',2,2)
scaleObject('inn_1_front',2,2)
scaleObject('black',2,2)
end
function onTweenCompleted(t)
	if t == 'black' then
		close(false)
	end
end
