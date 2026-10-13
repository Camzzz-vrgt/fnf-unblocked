function onCreate()
	makeLuaSprite('bg', 'stages/maddoctorsattic/maddoctorslair', -1050, -250);
	setLuaSpriteScrollFactor('bg', 1, 1);
	scaleObject('bg', 0.5, 0.45)
	
	makeLuaSprite('chest', 'stages/maddoctorsattic/treasurechest', 20, 500);
	setLuaSpriteScrollFactor('chest', 1, 1);
	scaleObject('chest', 1.75, 1.75)

	makeAnimatedLuaSprite('gus', 'stages/em/Gus', 990, 300);
	addAnimationByPrefix('gus', 'idle', 'idle instance 1', 24, false);
	setLuaSpriteScrollFactor('gus', 1, 1);
	scaleObject('gus', 1.4, 1.4)

	makeAnimatedLuaSprite('boy', 'stages/maddoctorsattic/bfEvilWorld', 150, 325);
	addAnimationByPrefix('boy', 'idle', 'bfEvilWorld idle', 24, false);
	setLuaSpriteScrollFactor('boy', 1, 1);
	scaleObject('boy', 1.3, 1.3)

	makeAnimatedLuaSprite('ortensia', 'stages/maddoctorsattic/ortensiaBG', -250, 225);
	addAnimationByPrefix('ortensia', 'idle', 'ortensiaBG idle', 24, false);
	setLuaSpriteScrollFactor('ortensia', 1, 1);
	scaleObject('ortensia', 1.2, 1.2)
	
	addLuaSprite('bg', false);
	addLuaSprite('gus', false);
	addLuaSprite('chest', false);
	addLuaSprite('boy', false);
	addLuaSprite('ortensia', false);
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('gus', 'idle', true);
		objectPlayAnimation('boy', 'idle', true);
		objectPlayAnimation('ortensia', 'idle', true);
	end
end
function onCountdownTick(counter)
  	if counter == 0 or counter == 1 or counter == 2 or counter == 3 then
    	objectPlayAnimation('gus', 'Gus');
		objectPlayAnimation('boy', 'idle');
		objectPlayAnimation('ortensia', 'idle');
	end
end