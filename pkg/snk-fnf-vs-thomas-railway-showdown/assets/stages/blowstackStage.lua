function onCreate()
	-- background shit
		makeLuaSprite('sky', 'blowstack/skyblow', -580, -300);
		setScrollFactor('sky', 0.7, 0.7);
	
                makeLuaSprite('bridge', 'blowstack/bridgeblow', -600, -300);
		setScrollFactor('bridge', 0.8, 0.8);

                makeLuaSprite('trackblow', 'blowstack/trackblow', -600, -300);
		setScrollFactor('trackblow', 1.0, 1.0);
		
		addLuaSprite('sky', false);
                addLuaSprite('bridge', false);
                addLuaSprite('trackblow', false);
	
	close(true);
end