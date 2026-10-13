function onCreate()
	-- background shit
        makeAnimatedLuaSprite('ipod bg','stages/ipod/ipod bg',-1100,-300)addAnimationByPrefix('ipod bg','ipod bop','ipod bop',3,true)
        objectPlayAnimation('ipod bg','ipod bop',false)

	makeLuaSprite('shadow', 'stages/ipod/shadow', -199, 750);
	scaleObject('shadow', 1.1, 1.1);

	makeLuaSprite('2shadow', 'stages/ipod/shadow', 780, 750);

	makeLuaSprite('3shadow', 'stages/ipod/shadow', 1400, 650);

        makeLuaSprite('4shadow', 'stages/ipod/shadow', -780, 650);

        makeAnimatedLuaSprite('grey cat','stages/ipod/greycat',470,200)addAnimationByPrefix('grey cat','dance','catmid',24,true)
        objectPlayAnimation('grey cat','dance',false)

        makeAnimatedLuaSprite('white cat','stages/ipod/whiteahhcat',-770,200)addAnimationByPrefix('white cat','dance','whitecat',24,true)
        objectPlayAnimation('white cat','dance',false)

	addLuaSprite('ipod bg', false);
	addLuaSprite('shadow', false);
	addLuaSprite('2shadow', false);
	addLuaSprite('3shadow', false);
	addLuaSprite('4shadow', false);
	addLuaSprite('grey cat', false);
	addLuaSprite('white cat', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end