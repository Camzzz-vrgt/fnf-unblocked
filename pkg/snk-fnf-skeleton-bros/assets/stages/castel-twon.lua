function onCreate()
	makeLuaSprite('fondo', 'susie/fondo', -300, -300)
	setScrollFactor('fondo', 0.6, 0.6)
	scaleObject('fondo', 1, 1)

	makeLuaSprite('piso', 'susie/piso', -570, 560)
	setScrollFactor('piso', 1, 1)
	scaleObject('piso', 1, 1)

	makeLuaSprite('arbustos1', 'susie/arbustos1', 1500, 900)
	setScrollFactor('arbustos1', 1.1, 1.1)
	scaleObject('arbustos1', 1.1, 1.1)

	makeLuaSprite('arbustos2', 'susie/arbustos2', -600, 900)
	setScrollFactor('arbustos2', 1.1, 1.1)
	scaleObject('arbustos2', 1.1, 1.1)

	makeLuaSprite('casas', 'susie/casas', -130, -90)
	setScrollFactor('casas', 0.9, 0.9)
	scaleObject('casas', 1, 1)

	makeLuaSprite('casas1', 'susie/casas1', -430, -180)
	setScrollFactor('casas1', 0.8, 0.8)
	scaleObject('casas1', 1, 1)
	
	makeLuaSprite('castillo', 'susie/castillo', 450, 27)
	setScrollFactor('castillo', 0.7, 0.7)
	scaleObject('castillo', 1, 1)
	
	addLuaSprite('fondo', false);
	addLuaSprite('castillo', false);
	addLuaSprite('casas1', false);
	addLuaSprite('casas', false);
	addLuaSprite('piso', false);
	addLuaSprite('arbustos1', true);
	addLuaSprite('arbustos2', true);

    setProperty('gfGroup.visible', false)
	
end