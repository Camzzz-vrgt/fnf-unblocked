function onCreate()
	-- background shit
	makeLuaSprite('KOTH', 'bgs/burglary/House', -200, -50);
	scaleObject('KOTH', 0.9,0.9)
	addLuaSprite('KOTH', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end