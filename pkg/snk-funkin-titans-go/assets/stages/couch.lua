function onCreate()
	-- background stuff
	makeLuaSprite('BG', 'Couch', -1020, 150);
        scaleLuaSprite('BG', 1.8, 1.8);
	setLuaSpriteScrollFactor('BG', 0.9, 0.9);
        addLuaSprite('BG', false);
		makeAnimatedLuaSprite('star', 'StarfireBop', -30, 650);
		addAnimationByPrefix('star', 'starbop', 'Starfire', 24, false);
		addLuaSprite('star', false);
		setProperty('star.scale.x', 0.8);
		setProperty('star.scale.y', 0.8);
		setLuaSpriteScrollFactor('star', 0.9, 0.9);
		makeAnimatedLuaSprite('bb', 'BeastBop', -180, 1150);
		addAnimationByPrefix('bb', 'bbop', 'BeastBoy', 24, false);
		addLuaSprite('bb', false);
		setProperty('bb.scale.x', 0.8);
		setProperty('bb.scale.y', 0.8);
		setLuaSpriteScrollFactor('bb', 0.9, 0.9);
		makeAnimatedLuaSprite('rav', 'RavenBop', 770, 1045);
		addAnimationByPrefix('rav', 'ravbop', 'Raven', 24, false);
		addLuaSprite('rav', false);
		setProperty('rav.scale.x', 0.8);
		setProperty('rav.scale.y', 0.8);
		setLuaSpriteScrollFactor('rav', 0.9, 0.9);
		makeAnimatedLuaSprite('cy', 'CyborgBop', 100, 890);
		addAnimationByPrefix('cy', 'cybop', 'Cyborg', 24, false);
		addLuaSprite('cy', false);
		setProperty('cy.scale.x', 0.98);
		setProperty('cy.scale.y', 0.98);
		setLuaSpriteScrollFactor('cy', 0.9, 0.9);

		function onBeatHit()
			-- triggered 4 times per section
			if curBeat % 2 == 0 then
				objectPlayAnimation('rav', 'ravbop');
				objectPlayAnimation('bb', 'bbop');
				objectPlayAnimation('star', 'starbop');
				objectPlayAnimation('cy', 'cybop');
		end
	end

	function onUpdate(elapsed)
		songPos = getSongPosition()
		local currentBeat = (songPos/5000)*(curBpm/160)
		doTweenY('starfloat', 'star', -100 - 150*math.sin((currentBeat_12*12)*math.pi), 2)
		doTweenX('disruptor2', 'star.y', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)
		doTweenY('disruptor2', 'star.y', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)
	end
end