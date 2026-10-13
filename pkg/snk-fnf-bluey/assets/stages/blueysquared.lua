function onCreate()
	-- background shit
	makeLuaSprite('blueybg', 'blueybg', -900, -500);
	setLuaSpriteScrollFactor('blueybg', 0.9, 0.9);	
	addLuaSprite('blueybg', false);
	
	makeLuaSprite('bingobg', 'bingobg', -900, -500);
	setLuaSpriteScrollFactor('bingobg', 0.9, 0.9);	
	
	makeLuaSprite('mackenziebg', 'mackenziebg', -900, -500);
	setLuaSpriteScrollFactor('mackenziebg', 0.9, 0.9);	

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end