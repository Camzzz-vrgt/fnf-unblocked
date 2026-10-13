function onCreate()
	makeLuaSprite('spooky back trees', 'stage/spooky back trees', -800, -300);
	setScrollFactor('spooky back trees', 0.9, 0.9);
	scaleObject('spooky back trees', 1, 1);

        makeLuaSprite('spooky grass', 'stage/spooky grass', -600, -300);
	setScrollFactor('spooky grass', 1, 1);
	
		makeLuaSprite('spooky stump', 'stage/spooky stump', -750, -335);
		setScrollFactor('spooky stump', 1, 1);
		scaleObject('spooky stump', 1, 1);
		
		makeLuaSprite('top spooky trees', 'stage/top spooky trees', -750, -550);
		setScrollFactor('top spooky trees', 1.2, 1.2);
		scaleObject('top spooky trees', 1.2, 1.2);

		makeLuaSprite('spooky leafs', 'stage/spooky leafs', -600, -430);
		setScrollFactor('spooky leafs', 1.1, 1.1);
		scaleObject('spooky leafs', 1.1, 1.1);

                makeLuaSprite('spooky sky', 'stage/spooky sky', -800, -600);
		setScrollFactor('spooky sky', 1, 1);
		scaleObject('spooky sky', 1.2, 1.2);

                makeLuaSprite('spooky effect', 'stage/spooky effect', -600, -300);
		setScrollFactor('spooky effect', 1, 1);
		scaleObject('spooky effect', 1, 1);
                
                makeAnimatedLuaSprite('rotom dex', 'stage/rotom dex', 550, 300);
                addAnimationByPrefix('rotom dex','dance','idle', 24, true);
		setScrollFactor('rotom dex', 1, 1);
		scaleObject('rotom dex', 1, 1);

        addLuaSprite('spooky sky', false);
        addLuaSprite('spooky back trees', false);
	addLuaSprite('spooky grass', false);
	addLuaSprite('spooky stump', false);
        addLuaSprite('rotom dex', false);
	addLuaSprite('top spooky trees', true);
        addLuaSprite('spooky leafs', true);
	addLuaSprite('spooky effect', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end