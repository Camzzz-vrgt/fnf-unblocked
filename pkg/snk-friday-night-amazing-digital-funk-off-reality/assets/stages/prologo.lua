
scale = 1.2

function onCreate()
	-- background shit

	

	makeLuaSprite('skyBox', 'stages/prologo/fondo', 240, 0);
	scaleObject('skyBox', 1.2,1.2);
	addLuaSprite('skyBox', false);

	makeLuaSprite('Bbg', 'stages/prologo/cocina', 240, 0);
	scaleObject('Bbg', 1.2,1.2);
	addLuaSprite('Bbg', false);

	makeLuaSprite('bg', 'stages/prologo/bg', 240, 0);
	scaleObject('bg', 1.2,1.2);
	addLuaSprite('bg', false);

	makeLuaSprite('mesa', 'stages/prologo/mesademiperrahijueputaraction', 240, 0);
	scaleObject('mesa', 1.2,1.2);
	addLuaSprite('mesa', true);

end