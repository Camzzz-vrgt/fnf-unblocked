function onCreate()


	-- back
	makeLuaSprite('stageback', 'bgback', -200, -750);
	setLuaSpriteScrollFactor('stageback', 1.0, 1.0);

	makeLuaSprite('stagefront', 'bgfront', -160, -110);
	setLuaSpriteScrollFactor('stagefront', 0, 0);


	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', true);
	
	setProperty('gf.visible',false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end