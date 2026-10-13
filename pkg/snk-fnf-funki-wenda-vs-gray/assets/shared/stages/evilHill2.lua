local XSize = 0.7
local YSize = 0.7

function onCreate()
	makeLuaSprite('sky', 'evilHill/sky', -650, -600)
	setScrollFactor('sky', 0.85, 0.85)
	addLuaSprite('sky', false)

	makeLuaSprite('clouds', 'evilHill/clouds', -1400, -300)
	setScrollFactor('clouds', 0.4, 0.4)
	scaleObject('clouds', XSize, YSize) 
	addLuaSprite('clouds', false)

	makeLuaSprite('hills', 'evilHill/hills', -1600, 400)
	setScrollFactor('hills', 1.1, 1.1)
	addLuaSprite('hills', false)

	makeLuaSprite('theFucking (2)', 'evilHill/theFucking (2)', -1600, 400)
	addLuaSprite('theFucking (2)', false)

	makeLuaSprite('mid', 'evilHill/mid', -1050, 700)
	addLuaSprite('mid', false)

	makeLuaSprite('front', 'evilHill/front', -460, 1070)
	addLuaSprite('front', false)
end