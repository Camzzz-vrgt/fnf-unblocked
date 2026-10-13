function onCreate()
	-- background shit
	makeLuaSprite('Back', 'Background', -800, -800);
	setLuaSpriteScrollFactor('Back', 0.0, 0.0);
	scaleObject('Back', 8.0, 8.0);       
	addLuaSprite('Back', false);
end