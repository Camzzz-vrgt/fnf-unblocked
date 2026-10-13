function onCreate()
	makeLuaSprite('vignette', 'Smile Dog/phase final/export202311062017190200-3',0,0)
	addLuaSprite('vignette',false)
	setObjectCamera('vignette','camHUD')
	screenCenter('vignette', 'x')
	scaleObject('vignette', 2.0, 2.0)

	makeLuaSprite('bg1', 'Smile Dog/phase final/123 sin título_20240216214816',0,0)
	addLuaSprite('bg1',false)

	makeLuaSprite('bg2', 'Smile Dog/phase final/bg 2',0,0)
	addLuaSprite('bg2',false)
end
function onCreatePost()
setProperty('gf.visible', false)
end