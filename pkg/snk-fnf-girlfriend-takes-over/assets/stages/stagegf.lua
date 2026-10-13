function onCreate()

        makeLuaSprite('stagegf/stageback', 'stagegf/stageback', -600, -300);
        setScrollFactor('stagegf/stageback', 0.9, 0.9);

        makeLuaSprite('stagegf/stagefront', 'stagegf/stagefront', -600, -300);
        setScrollFactor('stagegf/stagefront', 0.9, 0.9);

        makeLuaSprite('stagegf/spotlight', 'stagegf/spotlight', -600, -300);
        setScrollFactor('stagegf/spotlight', 0.9, 0.9);
        setProperty('stagegf/spotlight.visible', false);

        makeLuaSprite('stagegf/stagecurtains', 'stagegf/stagecurtains', -600, -300);
        setScrollFactor('stagegf/stagecurtains', 0.9, 0.9);

        addLuaSprite('stagegf/stageback', false);
        addLuaSprite('stagegf/stagefront', false);
        addLuaSprite('stagegf/spotlight', true);
        addLuaSprite('stagegf/stagecurtains', false);
end

function onStepHit()
	if(curStep == 288 and songName == "spotlight") then
            setProperty('stagegf/spotlight.visible', true);
   end
end