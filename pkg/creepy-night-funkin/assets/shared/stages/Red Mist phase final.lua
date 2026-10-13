function onCreate()
	makeLuaSprite('vignette', 'Red Mist/phase final/136 sin titulo_20240308130507',0,0)
	screenCenter('vignette')
	addLuaSprite('vignette',false)
	setObjectCamera('vignette','camHUD')

	makeLuaSprite('bg1', 'Red Mist/phase final/123 sin titulo_20240216214816',-400,-700)
	addLuaSprite('bg1',false)
	scaleObject('bg1', 6.0, 6.0)

	makeLuaSprite('bg2', 'Red Mist/phase final/294_sin_titulo_20240118173705-2',820,400)
	addLuaSprite('bg2',false)
	scaleObjec('bg2', 2.0, 2.0)
end
function onCreatePost()
setProperty('gf.visible', false)
end