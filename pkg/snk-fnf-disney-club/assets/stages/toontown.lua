function onCreate()
	makeLuaSprite('fg', 'stages/toontown/fg', -400, -400);
	setLuaSpriteScrollFactor('fg', 1, 1);
	scaleObject('fg', 1.4, 1.4)
	makeLuaSprite('bg', 'stages/toontown/bg', -400, -400);
	setLuaSpriteScrollFactor('bg', 1, 1);
	scaleObject('bg', 1.4, 1.4)
	addLuaSprite('bg', false);
	addLuaSprite('fg', false);
	close(true); 
end