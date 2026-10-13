function onCreate()
	-- background shit
	makeLuaSprite('background', 'background', -200, -140);
	setLuaSpriteScrollFactor('background', 1, 1);
	addLuaSprite('background', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end