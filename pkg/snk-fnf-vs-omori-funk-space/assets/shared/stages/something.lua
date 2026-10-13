function onCreatePost()
makeLuaSprite('BG', 'bonus/images/somethingBG/somethingBG', -280, -166)
	addLuaSprite('BG', false)

makeLuaSprite("blackshit", "", -1050, -500)
	makeGraphic('blackshit', 3400, 2000, '000000')
	addLuaSprite('blackshit', true)
setProperty('blackshit.alpha', 0.4)


makeLuaSprite('OverlayBG', 'bonus/images/somethingBG/somethingOverlay', 0, -220)
scaleObject('OverlayBG',0.85, 1)
	addLuaSprite('OverlayBG', true)
end