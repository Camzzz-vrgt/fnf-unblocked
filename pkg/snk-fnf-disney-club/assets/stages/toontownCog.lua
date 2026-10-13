function onCreate()
	makeLuaSprite('fg', 'stages/toontown/fg', -400, -400);
	setLuaSpriteScrollFactor('fg', 1, 1);
	scaleObject('fg', 1.4, 1.4)

	makeLuaSprite('bg', 'stages/toontown/bg', -400, -400);
	setLuaSpriteScrollFactor('bg', 1, 1);
	scaleObject('bg', 1.4, 1.4)

	makeAnimatedLuaSprite('cog1', 'stages/toontown/doubleTalker', 1100, 60);
	addAnimationByPrefix('cog1', 'doubleTalker', 'doubleTalker dance', 18, false);
	scaleObject('cog1', 0.5, 0.5);

	makeAnimatedLuaSprite('cog2', 'stages/toontown/gladHander', 150, 180);
	addAnimationByPrefix('cog2', 'gladHander', 'gladHander dance', 18, false);
	scaleObject('cog2', 0.4, 0.4);

	makeAnimatedLuaSprite('cog3', 'stages/toontown/pencilPusher', 1800, 80);
	addAnimationByPrefix('cog3', 'pencilPusher', 'pencilPusher dance', 18, false);
	scaleObject('cog3', 0.5, 0.5);

	makeAnimatedLuaSprite('cog4', 'stages/toontown/shortChange', -500, 120);
	addAnimationByPrefix('cog4', 'shortChange', 'shortChange dance', 18, false);
	scaleObject('cog4', 0.6, 0.6);

	addLuaSprite('bg', false);
	addLuaSprite('fg', false);

	addLuaSprite('cog1', false);
	addLuaSprite('cog2', false);
	addLuaSprite('cog3', false);
	addLuaSprite('cog4', false);

	setProperty('pencilPusher.flipX', true)
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('cog1', 'doubleTalker', true);
		objectPlayAnimation('cog2', 'gladHander', true);
		objectPlayAnimation('cog3', 'pencilPusher', true);
		objectPlayAnimation('cog4', 'shortChange', true);
	end
end
function onCountdownTick(counter)
  if counter == 0 or counter == 1 or counter == 2 or counter == 3 then
	objectPlayAnimation('cog1', 'doubleTalker');
	objectPlayAnimation('cog2', 'gladHander');
	objectPlayAnimation('cog3', 'pencilPusher');
	objectPlayAnimation('cog4', 'shortChange');
  end
end