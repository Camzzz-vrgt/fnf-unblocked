function onCreate()


	-- back
	makeLuaSprite('stageback', 'bg2back', -200, -250);
	setLuaSpriteScrollFactor('stageback', 1.0, 1.0);

	makeLuaSprite('stagemid', 'bg2front', -35, -140);
	setLuaSpriteScrollFactor('stagemid', 1.0, 1.0);

	makeLuaSprite('stagefront', 'bg2front', -35, -140);
	setLuaSpriteScrollFactor('stagefront', 1.0, 1.0);


	addLuaSprite('stageback', false);
	addLuaSprite('stagemid', false);
	addLuaSprite('stagefront', true);
	
	setProperty('gf.visible',false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end