function onCreate()
	-- background shit
	makeLuaSprite('Z', 'Z', -600, -300);
	setLuaSpriteScrollFactor('Z', 0.9, 0.9);

	makeAnimatedLuaSprite('animation','AGMUY',100,200)
	addAnimationByPrefix('animation','AGMUY','AGMUY idle',24,true);
	objectPlayAnimation('animation','AGMUY',false);

	makeAnimatedLuaSprite('K','K',1370, 100)
	addAnimationByPrefix('K','K','KFlyRight',24,true);
	objectPlayAnimation('K','K',false);

	addLuaSprite('Z', false);
	addLuaSprite('K', false);
	addLuaSprite('animation', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end