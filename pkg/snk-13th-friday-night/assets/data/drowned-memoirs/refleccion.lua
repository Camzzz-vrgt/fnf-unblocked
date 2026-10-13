function onCreate()
	precacheImage("characters/transitions");
	precacheImage("characters/Lake_Jason");
	precacheImage("characters/Lake_JasonMachete");
	precacheImage("characters/Jason_Attacking");
	
	makeLuaSprite('shadow', 'CrystalLake/Jason shadow', -175, 950);
	scaleObject('shadow', 1.2, 1.0);
	setProperty('shadow.visible', false);
	addLuaSprite('shadow', false);
end

function onCreatePost()
	triggerEvent('Show Reflection', 'bf', '-465');
	triggerEvent('Show Reflection', 'gf', '795');
	setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup')+2);
end

function onStepHit()
	if curStep == 1 then
		setObjectOrder('shadow', getObjectOrder('dadGroup')-1);
	end
	
	if curStep == 24 then
		setProperty('shadow.visible', true);
		setProperty('shadow.alpha', 0.0);
		doTweenAlpha('intro:shadow', 'shadow', 0.45, 0.75, 'linear');
	end
	
	if curStep == 52 then 
		cancelTween('intro:shadow');
		setProperty('shadow.alpha', 1.0);
		triggerEvent('Change Character', 'dad', 'Lake_jasonStarsong');
		triggerEvent('Play Animation', 'rising');
		triggerEvent('Show Reflection', 'dad', '-80');
    end
	
	if curStep == 63 then
		triggerEvent('Change Character', 'dad', 'Lake_Jason');
		triggerEvent('Show Reflection', 'dad', '40');
		triggerEvent('Reflection Offset', 'dad', 'upalt,-5');
		triggerEvent('Reflection Offset', 'dad', 'downalt,20');
		triggerEvent('Reflection Offset', 'dad', 'leftalt,0');
		triggerEvent('Reflection Offset', 'dad', 'rightalt,-5');
    end
	
	if curStep == 560 then
		triggerEvent('Change Character', 'dad', 'Lake_jasonMachetepull');
		triggerEvent('Play Animation', 'machetepull', 'dad');
		triggerEvent('Show Reflection', 'dad', '-325');
    end
	
	if curStep == 576 then
		triggerEvent('Change Character', 'dad', 'Lake_jasonMachete');
		triggerEvent('Show Reflection', 'dad', '-185');
		triggerEvent('Reflection Offset', 'dad', 'up,-20');
		triggerEvent('Reflection Offset', 'dad', 'down,-13');
		triggerEvent('Reflection Offset', 'dad', 'leftpose,18');
		triggerEvent('Reflection Offset', 'dad', 'rightpose,0');
    end
	
	if curStep == 1079 then
		triggerEvent('Change Character', 'dad', 'Lake_jasonAttacking');
		triggerEvent('Play Animation', 'swing', 'dad');
		triggerEvent('Show Reflection', 'dad', '20');
    end
	
	if curStep == 1084 then
		triggerEvent('Change Character', 'dad', 'Lake_jasonAttacking');
		triggerEvent('Play Animation', 'swung', 'dad');
		triggerEvent('Show Reflection', 'dad', '-20');
    end
	
	if curStep == 1088 then
		triggerEvent('Change Character', 'dad', 'Lake_jasonMachete');
		triggerEvent('Show Reflection', 'dad', '-310');
		triggerEvent('Reflection Offset', 'dad', 'up,-20');
		triggerEvent('Reflection Offset', 'dad', 'down,-13');
		triggerEvent('Reflection Offset', 'dad', 'leftpose,18');
		triggerEvent('Reflection Offset', 'dad', 'rightpose,0');
    end

	if curStep == 1415 then
		triggerEvent('Change Character', 'dad', 'Lake_jasonAttacking');
		triggerEvent('Play Animation', 'swing', 'dad');
		triggerEvent('Show Reflection', 'dad', '20');
    end

	if curStep == 1420 then
		triggerEvent('Change Character', 'dad', 'Lake_jasonAttacking');
		triggerEvent('Play Animation', 'swung', 'dad');
		triggerEvent('Show Reflection', 'dad', '50');
    end


	if curStep == 1433 then
		triggerEvent('Change Character', 'dad', 'Lake_jasonMachete');
		triggerEvent('Show Reflection', 'dad', '-185');
		triggerEvent('Reflection Offset', 'dad', 'up,-20');
		triggerEvent('Reflection Offset', 'dad', 'down,-13');
		triggerEvent('Reflection Offset', 'dad', 'leftpose,18');
		triggerEvent('Reflection Offset', 'dad', 'rightpose,0');
    end


	
end