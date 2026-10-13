function onCreate()
	
	makeLuaSprite('Sahor', 'OldHouse', -300, -70);
	scaleObject('Sahor', 1.6, 1.6);
	makeLuaSprite('Light', 'OldLight', -300, -70);
	scaleObject('Light', 1.6, 1.6);


	addLuaSprite('Sahor', false);
	addLuaSprite('Light', true);
	
end