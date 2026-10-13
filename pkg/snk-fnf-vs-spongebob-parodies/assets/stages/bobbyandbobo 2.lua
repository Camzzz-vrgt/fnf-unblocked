function onCreate()
	-- background shit
	makeLuaSprite('southbobby', 'stages/bobbyandbobo/southbobby', 45, -280);
	scaleObject('southbobby', 1.9, 1.9);

	addLuaSprite('southbobby', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end