function onCreate()

	makeLuaSprite('FireBG', 'EXEbg/FireBG', -1200, -800);
	addLuaSprite('FireBG', false);
	setLuaSpriteScrollFactor('FireBG', 0.95, 0.95);

   	makeAnimatedLuaSprite('waterfall','EXEbg/waterfall', -1200, -800)
    	addAnimationByPrefix('waterfall','waterfall','waterfall wawa',12,true);
    	objectPlayAnimation('waterfall','waterfall',false);

	addLuaSprite('waterfall', false);

	makeLuaSprite('Water', 'EXEbg/Water', -1200, -800);
	addLuaSprite('Water', false);
	setLuaSpriteScrollFactor('Water', 0.95, 0.95);

	makeLuaSprite('AngelIsland', 'EXEbg/AngelIsland', -1200, -800);
	addLuaSprite('AngelIsland', false);
	setLuaSpriteScrollFactor('AngelIsland', 1.0, 1.0);


	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end