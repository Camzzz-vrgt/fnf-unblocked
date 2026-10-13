function onCreate()
	-- background shit

	-6000 = -6000;
	-200 = -200;

	-8000 = -8000;
	-200 = -200;

	756 = 756;

	1279 = 1279;


	makeLuaSprite('castle', 'stages/d-castle/wall', -200, -6000);
	scaleObject('castle', 1.5, 1.5)

	makeLuaSprite('ship', 'stages/d-castle/ship', -200 + -500, -6000);
	scaleObject('ship', 1.5, 1.5)

	makeLuaSprite('Anchor', 'stages/d-castle/anchor', -200, -6000);
	scaleObject('Anchor', 1.5, 1.5)

	makeLuaSprite('floor', 'stages/d-castle/thronebg', -200, -6000);
	scaleObject('floor', 1.5, 1.5)

	makeLuaSprite('Black', 'stages/inside/Black', -2000, -1000);
	scaleObject('Black', 1.5, 1.5)

	addLuaSprite('castle', false);
	addLuaSprite('floor', false);
	addLuaSprite('ship', false);
	addLuaSprite('Anchor', false);
	


	setScrollFactor("castle", 0.95, 0.95)
	setScrollFactor("floor", 1.0, 1.0)
	setScrollFactor("ship", 1, 1)
	setScrollFactor("Anchor", 1.0, 1.0)



	makeAnimatedLuaSprite('sky', 'stages/d-castle/singing stage', -200, -8000);
	scaleObject('sky', 1.5, 1.5)

	addAnimationByPrefix('sky', 'idle', 'idle0', 12, false);

	objectPlayAnimation('sky', 'idle');
	
	

	makeAnimatedLuaSprite('dsing', 'characters/bowser-dside-rap', -200, -8000 + 50);
	scaleObject('dsing', 1.5, 1.5)

	addAnimationByPrefix('dsing', 'idle', 'idle0', 12, false);
	addAnimationByPrefix('dsing', '0', 'left0', 12, false); 
	addAnimationByPrefix('dsing', '1', 'down0', 12, false); 
	addAnimationByPrefix('dsing', '2', 'up0', 12, false); 
	addAnimationByPrefix('dsing', '3', 'right0', 12, false); 

	objectPlayAnimation('dsing', 'idle'); 
	

end

function onUpdate()
	
if curStep == 756 then

	addLuaSprite('Black', true);
	addLuaSprite('sky', true);
	addLuaSprite('dsing', true);

	triggerEvent("Camera Follow Pos", 2000, -1)
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
	end
	cameraFlash("game", "FFFFFF", 1, true)
	doTweenY('camFollowY', 'camFollow', -6900, 0.1, 'linear')
	doTweenAlpha('Lighten', 'Black', 0, 0.01, 'linear')

	setScrollFactor("Black", 0, 0);
end

if curStep == 756 + 1 then

	doTweenAlpha('Darken', 'Black', 0.5, 0.1, 'linear')

end

if curStep == 1279 then

	doTweenAlpha('Lighten2', 'Black', 0, 0.1, 'linear')
	triggerEvent("Camera Follow Pos", "", "")
	doTweenY('camFollowY', 'camFollow', 1200, 0.1, 'linear')
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
	end
	cameraFlash("game", "FFFFFF", 1, true)

end


end

function onStepHit()
	
	objectPlayAnimation('sky', 'idle');

end

function onBeatHit()

	if curBeat % 2 == 0 then

		objectPlayAnimation('dsing', 'idle', true);
	
	end
end

lastNote = {0, ""}

function opponentNoteHit(id,d,t,s)

    lastNote[1] = d
    lastNote[2] = t
    
    if lastNote[2] == "" then 
	objectPlayAnimation('dsing', lastNote[1], true);
    end
end
