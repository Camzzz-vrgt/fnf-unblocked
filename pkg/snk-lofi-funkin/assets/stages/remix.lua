function onCreate()
	-- background shit
	makeLuaSprite('ske', 'W3R/ske', -800, -770);
	setLuaSpriteScrollFactor('ske', 0.9, 0.9);
   scaleObject('ske', 2.5, 2.5);
	
   makeLuaSprite('Ground', 'W3R/Ground', -800, -770);
	setLuaSpriteScrollFactor('Ground', 0.9, 0.9);
   scaleObject('Ground', 2.5, 2.5);

   makeLuaSprite('lofi_car', 'W3/lofi_car', -1000, -615);
	setLuaSpriteScrollFactor('lofi_car', 0.9, 0.9);
   scaleObject('lofi_car', 2.4, 2.4);
	
	addLuaSprite('ske', false);
   addLuaSprite('Ground', false);
   addLuaSprite('lofi_car', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end