function onCreate()
	-- background shit
	makeLuaSprite('fondo', 'fondo', -600, -500);
	setScrollFactor('fondo', 0.9, 0.9);
	scaleObject('fondo', 1.0, 1.0);

	makeLuaSprite('piso', 'piso', -600, -500);
	setScrollFactor('piso', 1.0, 1.0);
	scaleObject('piso', 1.0, 1.0);
	

	makeLuaSprite('Vista', 'Vista', -600, -500);
	setScrollFactor('Vista', 1.0, 1.0);
	scaleObject('Vista', 1.0, 1.0);

	addLuaSprite('fondo', false);
      addLuaSprite('piso', false);
	addLuaSprite('Delante', true);
end
function onCreatePost()
	setScrollFactor('gf', 0.89, 1);
end