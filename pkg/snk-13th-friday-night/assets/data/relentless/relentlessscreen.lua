function onCreate()
	makeLuaSprite('axe', 'relentlessbg/axe', -1050, -670);
	scaleObject('axe', 1, 1);
	setProperty('axe.visible', false);
	addLuaSprite('axe', false);

	makeLuaSprite('relentlessoverlay', 'relentlessbg/relentlessoverlay', -450, -260);
	scaleObject('relentlessoverlay', 1.1, 1.2);
	setProperty('relentlessoverlay.visible', false);
	addLuaSprite('relentlessoverlay', false);
	setBlendMode('relentlessoverlay', 'multiply');
	setObjectOrder('relentlessoverlay', 12);
	setScrollFactor('relentlessoverlay', 0, 0);

end

function onStepHit()
	if curStep == 1162 then
		setProperty('relentlessoverlay.visible', true);
		setProperty('relentlessoverlay.alpha', 1.0);
	end
	
	if curStep == 1154 then 
		setProperty('axe.visible', true);
		setProperty('axe.alpha', 1.0);
    end

	if curStep == 1296 then
		setProperty('relentlessoverlay.visible', false);
		setProperty('relentlessoverlay.alpha', 0.0);
	end

	
end