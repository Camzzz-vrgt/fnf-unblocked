-- Lua stuff
function onCreate()
	makeLuaSprite('BG', 'rlback', -600, -200)
	addLuaSprite('BG',  false)
	setLuaSpriteScrollFactor('BG', 0.3, 0.3)
	makeLuaSprite('FRONT', 'rlfront', -600, -200)
	addLuaSprite('FRONT',  false)
end

