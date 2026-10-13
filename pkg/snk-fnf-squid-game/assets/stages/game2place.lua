-- Lua stuff
function onCreate()
	makeLuaSprite('FRONT', 'rlfront', -600, -200)
	addLuaSprite('FRONT',  false)
	makeAnimatedLuaSprite('boppers', 'theppl', -300, 640)
	luaSpriteAddAnimationByPrefix('boppers', 'bop', 'Bopin', 24, true)
	scaleObject('boppers', 1.3, 1.3);
	addLuaSprite('boppers', true)
end

