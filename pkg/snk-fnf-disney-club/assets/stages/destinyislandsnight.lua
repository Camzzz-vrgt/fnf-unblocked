function onCreate()
	makeAnimatedLuaSprite('bg', 'stages/destinyislands/destinyislandsnight', -860, -240);
	addAnimationByPrefix('bg', 'destinyislandsnight', 'destinyislandsnight waterfall', 24, true);
	objectPlayAnimation('bg', 'destinyislandsnight', true)
	scaleObject('bg', 1.5, 1.5)
	
	makeLuaSprite('crate', 'stages/destinyislands/Crate_2', 500, 480);
	setLuaSpriteScrollFactor('crate', 1, 1);
	scaleObject('crate', 0.6, 0.6)
	
	makeAnimatedLuaSprite('woman', 'characters/kairi', 1360, 350);
	addAnimationByPrefix('woman', 'kairi', 'kairi idle', 24, false);
	scaleObject('woman', 0.4, 0.4);
	
	makeAnimatedLuaSprite('disney', 'stages/destinyislands/losers', 0, 225);
	addAnimationByPrefix('disney', 'losers', 'nerds idle', 24, false);
	scaleObject('disney', 0.55, 0.55);
	
	addLuaSprite('bg', false);
	addLuaSprite('crate', false);
	addLuaSprite('disney', false);
	addLuaSprite('woman', false);
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('woman', 'kairi', true);
		objectPlayAnimation('disney', 'losers', true);
	end
end
function onCountdownTick(counter)
  if counter == 0 or counter == 1 or counter == 2 or counter == 3 then
    objectPlayAnimation('woman', 'kairi');
    objectPlayAnimation('disney', 'losers');
  end
end
