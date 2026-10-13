function onCreate()

	makeLuaSprite('sea', 'stages/sponge tears/sea', 0, -200);
	addLuaSprite('sea', false);

        makeAnimatedLuaSprite('squid','stages/sponge tears/WGGSB Squid look',1500,230)addAnimationByPrefix('squid','bop','WGGSB Squid look idle',13,true)
        objectPlayAnimation('squid','bop',false)

	makeAnimatedLuaSprite('sp','sponge tears/sp', -40, -40)
	setLuaSpriteScrollFactor('sp',0,0)
	addAnimationByPrefix('sp','sp','sp',20,true)
	addLuaSprite('sp',true)
	objectPlayAnimation('sp','sp',false)

	addLuaSprite('squid', true);

	close(true)
end