local XSize = 2.5
local YSize = 2
local XPos = -400

function onCreate()
	makeLuaSprite('sky', 'happyHill/sky', XPos, 0)
	scaleObject('sky', XSize, YSize) 
	addLuaSprite('sky', false)

	makeLuaSprite('cloud', 'happyHill/cloud', XPos, 0)
	scaleObject('cloud', XSize, YSize) 
	addLuaSprite('cloud', false)

	makeLuaSprite('back', 'happyHill/back', XPos, 0)
	scaleObject('back', XSize, YSize) 
	addLuaSprite('back', false)

	makeLuaSprite('mid', 'happyHill/mid', XPos, 0)
	scaleObject('mid', XSize, YSize) 
	addLuaSprite('mid', false)

	makeLuaSprite('front', 'happyHill/front', XPos, 0)
	scaleObject('front', XSize, YSize) 
	addLuaSprite('front', false)
end
