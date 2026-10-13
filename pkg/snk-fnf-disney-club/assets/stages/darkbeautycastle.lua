function onCreate()
	makeLuaSprite('bg', 'stages/darkbeautycastle/darkbeautycastle', -600, -100);
	setLuaSpriteScrollFactor('bg', 1, 1);
	scaleObject('bg', 0.8, 0.8)
	
	makeAnimatedLuaSprite('gus', 'stages/em/Gus', 990, 300);
	addAnimationByPrefix('gus', 'idle', 'idle instance 1', 24, false);
	setLuaSpriteScrollFactor('gus', 1, 1);
	scaleObject('gus', 1.4,1.4)
	
	addLuaSprite('bg', false);
	addLuaSprite('gus', false);
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('gus', 'idle', true);
	end
end
	function onCountdownTick(counter)
  	if counter == 0 or counter == 1 or counter == 2 or counter == 3 then
    	objectPlayAnimation('gus', 'Gus');
	end
end