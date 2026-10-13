local scale = 1.7

function onCreate()
	makeAnimatedLuaSprite('herbert', 'stages/gadgetroom/herbert', -80, -250);
	addAnimationByPrefix('herbert', 'idle', 'herbert idle', 24, false);
	setLuaSpriteScrollFactor('herbert', 1, 1);
	scaleObject('herbert', 1.2, 1.2)
	addLuaSprite('herbert');

	makeAnimatedLuaSprite('cat', 'stages/gadgetroom/cat animation', -80, -250);
	addAnimationByPrefix('cat', 'idle', 'cat animation cat animation', 36, false);
	setLuaSpriteScrollFactor('cat', 1, 1);
	scaleObject('cat', 1.2, 1.2)
	addLuaSprite('cat');

	makeLuaSprite('bg', 'stages/gadgetroom/Gadget', -400, -250);
	setLuaSpriteScrollFactor('bg', 1, 1);
	scaleObject('bg', 1.7, 1.7)
	addLuaSprite('bg', false); 
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('cat', 'idle', false);
		objectPlayAnimation('herbert', 'idle', false);
	end

	if songName == 'Gadget Groove' then
		if curBeat == 139 then
			cameraFlash("game", "FFFFFF", 0.7, false);
			getObjectOrder('herbert');
			setObjectOrder('herbert', 1);
		end
	end
end