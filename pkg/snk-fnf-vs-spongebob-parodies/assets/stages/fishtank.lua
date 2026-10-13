function onCreate()
	-- background shit
	makeLuaSprite('sbspTANK', 'stages/squarebob/sbspTANK', -900, -250);
	scaleObject('sbspTANK', 1.5, 1.5);

	makeLuaSprite('sbspPLANTS', 'stages/squarebob/sbspPLANTS', -900, -250);
	scaleObject('sbspPLANTS', 1.5, 1.5);

	addLuaSprite('sbspTANK', false)
	
	addLuaSprite('sbspPLANTS', false)
end