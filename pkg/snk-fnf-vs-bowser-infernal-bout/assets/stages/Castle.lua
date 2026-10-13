function onCreate()
	-- background shit

	makeLuaSprite('castle', 'stages/castle/Bg', 0, -1000);

	makeLuaSprite('floor', 'stages/castle/floor', 0, 0);
	
	makeAnimatedLuaSprite('characters','stages/castle/BG_Characters',400, -100)addAnimationByPrefix('characters','bop','bop', 11, true)
	addLuaSprite('castle', false);
	addLuaSprite('floor', false)
	addLuaSprite('characters', false);
	
	close(true);
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('characters','bop', true)
	end
end