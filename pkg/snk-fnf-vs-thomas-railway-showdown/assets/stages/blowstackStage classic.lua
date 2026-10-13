function onCreate()
	-- background shit

	makeLuaSprite('sky', 'blowstack/old/sky', 400, -1230);
	setScrollFactor('sky', 0.9, 0.9);

	makeLuaSprite('floor', 'blowstack/old/floor', 400, -1230);
	setScrollFactor('floor', 1, 1);

	makeLuaSprite('bridge', 'blowstack/old/bridge', 400, -1230);
	setScrollFactor('bridge', 1, 1);

	addLuaSprite('sky', false);
        addLuaSprite('bridge', false);
        addLuaSprite('floor', false);
       

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end