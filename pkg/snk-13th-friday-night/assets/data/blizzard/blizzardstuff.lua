function onCreate()
	makeLuaSprite('treesnow', 'snowforest/treesnow', -580, -0);
	scaleObject('treesnow', 1, 1);
	setProperty('treesnow.visible', false);
	addLuaSprite('treesnow', false);

	makeLuaSprite('blood', 'snowforest/blood', -580, -0);
	scaleObject('blood', 1, 1);
	setProperty('blood.visible', false);
	addLuaSprite('blood', false);
	setBlendMode('blood', 'multiply');
	setObjectOrder('frozenscreen', 11);

end

function onStepHit()
	if curStep == 5 then 
		setProperty('blizzardtrees.visible', true);
		setProperty('blizzardtrees.alpha', 1.0);
    end

	if curStep == 280 then
		setProperty('blizzardtrees.visible', false);
		setProperty('blizzardtrees.alpha', 0.0);
	end
	
	if curStep == 300 then 
		setProperty('treesnow.visible', true);
		setProperty('treesnow.alpha', 0.5);
		doTweenAlpha('intro:treesnow', 'treesnow', 0.65, 0.75, 'linear');
    end

	if curStep == 312 then 
		cancelTween('intro:treesnow');
		setProperty('treesnow.alpha', 1.0);
    end

	if curStep == 1353 then
		setProperty('blood.visible', true);
		setProperty('blood.alpha', 1.0);
		setObjectOrder('blood', getObjectOrder('dadGroup')+1);
	end
	
end