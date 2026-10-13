function onCreate()
	-- background shit
	makeLuaSprite('background', 'background', -450, -50);
	setLuaSpriteScrollFactor('background', 1, 1);
	addLuaSprite('background', false);
	
	makeLuaSprite('spotlights', 'spotlights', -725, -50);
	setLuaSpriteScrollFactor('spotlights', 1, 1);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end