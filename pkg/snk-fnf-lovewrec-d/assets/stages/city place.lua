function onCreate()

	-- hello boyfriend

	makeLuaSprite('BGsun', 'city/sunny/sun1', 0, 0)
	scaleObject('BGsun', 0.8, 0.8)
	setScrollFactor('BGsun', 0.7, 0.7)

	makeLuaSprite('BG2sun', 'city/sunny/clouds', 0, 0)
	scaleObject('BG2sun', 0.8, 0.8)
	setScrollFactor('BG2sun', 0.75, 0.75)

	makeLuaSprite('helpsun', 'city/sunny/bg2', 0, 0)
	scaleObject('helpsun', 0.8, 0.8)
	setScrollFactor('helpsun', 0.85, 0.85)

	makeLuaSprite('AAAAAAHsun', 'city/sunny/bg1', 0, 0)
	scaleObject('AAAAAAHsun', 0.8, 0.8)
	setScrollFactor('AAAAAAHsun', 0.9, 0.9)

	makeLuaSprite('Floorsun', 'city/sunny/fg', 0, 0)
	scaleObject('Floorsun', 0.8, 0.8)
	setScrollFactor('Floorsun', 1, 1)

	makeLuaSprite('overlaysun', 'city/sunny/te thing', -100, -100)
	setBlendMode('overlaysun', 'screen')
	setProperty('overlaysun.alpha', 0.75)
	setScrollFactor('overlaysun', 0, 0)
	setObjectCamera('overlaysun', 'hud')
	setObjectOrder('overlaysun', 1)

	addLuaSprite('BGsun')
	addLuaSprite('BG2sun')
	addLuaSprite('AAAAAAHsun')
	addLuaSprite('helpsun')
	addLuaSprite('Floorsun')
	addLuaSprite('overlaysun', true)

-- hello nene

	makeLuaSprite('BG', 'city/rainy/sky', 0, 0)
	scaleObject('BG', 0.8, 0.8)
	setScrollFactor('BG', 0.7, 0.7)

	makeLuaSprite('BG2', 'city/rainy/backsky', 0, 0)
	scaleObject('BG2', 0.8, 0.8)
	setScrollFactor('BG2', 0.75, 0.75)

	makeLuaSprite('help', 'city/rainy/bg2', 0, 0)
	scaleObject('help', 0.8, 0.8)
	setScrollFactor('help', 0.9, 0.9)

	makeLuaSprite('AAAAAAH', 'city/rainy/BG', 0, 0)
	scaleObject('AAAAAAH', 0.8, 0.8)
	setScrollFactor('AAAAAAH', 0.85, 0.85)

	makeLuaSprite('Floor', 'city/rainy/fg', 0, 0)
	scaleObject('Floor', 0.8, 0.8)
	setScrollFactor('Floor', 1, 1)

	makeLuaSprite('overlay', 'city/rainy/te thing', -100, -100)
	setBlendMode('overlay', 'screen')
	setProperty('overlay.alpha', 0.75)
	setScrollFactor('overlay', 0, 0)
	setObjectCamera('overlay', 'hud')
	setObjectOrder('overlay', 1)

	addLuaSprite('BG')
	addLuaSprite('BG2')
	addLuaSprite('AAAAAAH')
	addLuaSprite('help')
	addLuaSprite('Floor')
	addLuaSprite('overlay', true)

	setProperty('BG.alpha', 0.0000001)
	setProperty('BG2.alpha', 0.0000001)
	setProperty('help.alpha', 0.0000001)
	setProperty('AAAAAAH.alpha', 0.0000001)
	setProperty('Floor.alpha', 0.0000001)
	setProperty('overlay.alpha', 0.0000001)
	
end

function onSongStart()
	doTweenX('clouds fly', 'BG2sun', -1500, 119.46, 'linear')
	doTweenY('sun rise', 'BGsun', -1500, 119.46, 'linear')
end

function onBeatHit()
	if curBeat == 105 then
		doTweenAlpha('rain start1', 'BG', 1, 2, 'cubeIn')
		doTweenAlpha('rain start2', 'BG2', 1, 2, 'cubeIn')
		doTweenAlpha('rain start3', 'AAAAAAH', 1, 2, 'cubeIn')
		doTweenAlpha('rain start4', 'help', 1, 2, 'cubeIn')
		doTweenAlpha('rain start5', 'Floor', 1, 2, 'cubeIn')
		doTweenAlpha('rain start6', 'overlay', 0.75, 2, 'cubeIn')
		doTweenAlpha('rain start7', 'overlaysun', 0, 2, 'cubeOut')
	end

	if curBeat == 112 then
		removeLuaSprite('BGsun', true)
		removeLuaSprite('BG2sun', true)
		removeLuaSprite('AAAAAAHsun', true)
		removeLuaSprite('helpsun', true)
		removeLuaSprite('Floorsun', true)
		removeLuaSprite('overlaysun', true)
	end
end