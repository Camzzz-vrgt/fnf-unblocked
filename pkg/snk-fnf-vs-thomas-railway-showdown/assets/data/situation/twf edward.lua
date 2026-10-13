function onCreate()
    makeLuaSprite('tanker2', 'twf/Tank3r', -4810, -10);
	setScrollFactor('tanker2', 1, 1);
	scaleObject('tanker2', 0.7, 0.7);
	addLuaSprite('tanker2', true);

    makeLuaSprite('tanker1', 'twf/Tank3r', -3910, -10);
	setScrollFactor('tanker1', 1, 1);
	scaleObject('tanker1', 0.7, 0.7);
	addLuaSprite('tanker1', true);

    makeLuaSprite('eggward', 'twf/Eddy', -3010, -10);
	setScrollFactor('eggward', 1, 1);
	scaleObject('eggward', 0.7, 0.7);
	addLuaSprite('eggward', true);

end

function onUpdate()

	if curBeat > 298 then
        setProperty('eggward.x', getProperty('eggward.x')+200)
        setProperty('tanker1.x', getProperty('tanker1.x')+200)
        setProperty('tanker2.x', getProperty('tanker2.x')+200)
    end
end