function onCreate()
	addLuaSprite('bg')
	addLuaSprite('bgtet')
	setProperty('camGame.bgColor', getColorFromHex('BE2B44'))

	makeLuaSprite('BG', nil, -5050, -5580)
	makeGraphic('BG', 10000, 10000, 'BE2B44')
	addLuaSprite('BG')
end

function onUpdate()
	setProperty('bg.x',getProperty('bg.x')+0.3)
	setProperty('bgtet.x',getProperty('bgtet.x')+0.3)
	if getProperty('bg.x') > 1700 then
		setProperty('bg.x',getProperty('bgtet.x')-2000)
	end
	if getProperty('Sky2.x') > 1700 then
		setProperty('bgtet.x',getProperty('bg.x')-2000)
	end
end