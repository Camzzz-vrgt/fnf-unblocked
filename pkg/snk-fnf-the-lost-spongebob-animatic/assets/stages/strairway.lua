function onCreate()

	makeLuaSprite('insurance', 'Insurance BG', 0, -600);
	setLuaSpriteScrollFactor('insurance', 1.0, 1.0);
	scaleObject('insurance', 0.7, 0.7)
	addLuaSprite('insurance', false);
	
	makeLuaSprite('shadow1', 'shadow1', -140, -675);
	setLuaSpriteScrollFactor('shadow1', 1.0, 1.0);
	scaleObject('shadow1', 0.7, 0.7)
	addLuaSprite('shadow1', false);
	
	makeLuaSprite('shadow2', 'shadow2', -68, -683);
	setLuaSpriteScrollFactor('shadow2', 1.0, 1.0);
	scaleObject('shadow2', 0.7, 0.7)
	addLuaSprite('shadow2', false);

end
