function onCreate()
	-- background stuff
	makeLuaSprite('BG', 'Couch', -1020, 150);
        scaleLuaSprite('BG', 1.4, 1.4);
	setLuaSpriteScrollFactor('BG', 0.9, 0.9);
        addLuaSprite('BG', false);
		makeLuaSprite('YT', 'YouTube', -820, 150);
        scaleLuaSprite('YT', 2, 2);
	setLuaSpriteScrollFactor('YT', 0.9, 0.9);
        addLuaSprite('YT', true);
end