function onCreatePost()
	makeLuaSprite('bg','bgstuffs/circus',-810,-60)
	addLuaSprite('bg',false)
	
	makeLuaSprite('sl','scanline',0,0)
	setObjectCamera('sl','other')
	scaleObject('sl',screenWidth/883,screenHeight/600)
	addLuaSprite('sl',true)
end