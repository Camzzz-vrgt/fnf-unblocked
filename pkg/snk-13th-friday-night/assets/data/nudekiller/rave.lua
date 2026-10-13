function onCreate()
	makeAnimatedLuaSprite('Rave', 'Nudeforest/Rave',  -650, -380)
	addAnimationByPrefix('Rave', 'flash', 'flash', 24, true)
	setScrollFactor('Rave', 1.1, 1.1);
	scaleObject('Rave', 2, 2);
	setObjectOrder('Rave', 0);
	setProperty('Rave.visible', false);

end

function onStepHit()
	if curStep == 896 then 
		setProperty('Rave.visible', true);
		setProperty('Rave.alpha', 1.0);
    end

	if curStep == 1406 then
		setProperty('Rave.visible', false);
		setProperty('Rave.alpha', 0.0);
	end

	
end