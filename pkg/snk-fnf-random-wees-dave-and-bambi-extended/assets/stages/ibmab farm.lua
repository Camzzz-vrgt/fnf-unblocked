function onCreate()
	-- background shit
	makeLuaSprite('ibmab farm', 'ibmab farm', -600, -600);
	setScrollFactor('ibmab farm', 1.0, 1.0);
	scaleObject('ibmab farm', 1.40, 1.40);
	
	makeLuaSprite('ibmab farm2', 'ibmab farm2', -600, -600);
	setScrollFactor('ibmab farm2', 1.0, 1.0);
	scaleObject('ibmab farm2', 1.40, 1.40);
	

	addLuaSprite('ibmab farm', false);
	addLuaSprite('ibmab farm2', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end