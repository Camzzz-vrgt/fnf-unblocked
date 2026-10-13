function onCreate()

	makeLuaSprite('kkbg', 'kkbg', 330, -210)
	setLuaSpriteScrollFactor('kkbg', 1.0, 1.0)
	scaleObject('kkbg', 1, 1)
	addLuaSprite('kkbg', false)
	
	makeLuaSprite('radiobg', 'radiobg', 330, -210)
	setLuaSpriteScrollFactor('radiobg', 1.0, 1.0)
	scaleObject('radiobg', 1, 1)
	addLuaSprite('radiobg', true)
	
	makeLuaSprite('separator', 'separator', 330, -210)
	setLuaSpriteScrollFactor('separator', 1.0, 1.0)
	scaleObject('separator', 1, 1)
	addLuaSprite('separator', true)
	
end

function onCreatePost()

	setObjectOrder('dadGroup', 2356)

end