local allowCountdown = false

function onStartCountdown()
    if not allowCountdown then
        setProperty('camHUD.alpha', 0);
        setProperty('boyfriend.visible', false);
        setProperty('gf.visible', false);
        setProperty('dad.visible', false);

        playSound('iminafuckinwheelchair', 1);

        runTimer('startcount', 5, 1)
        runTimer('startsong', 6.5, 1);
        runTimer('hudalpha', 12, 1);
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'startcount' then
        startCountdown();
    end

    if tag == 'startsong' then
        setProperty('camGame.visible', true);
        setProperty('dad.visible', true);
        triggerEvent('Play Animation', 'fadeIn', 'Dad');
    end

    if tag == 'hudalpha' then
        doTweenAlpha('hudalpha', 'camHUD', 1, 5, 'linear');

        noteTweenX('left', 0, -5000, 0.01, 'linear');
        noteTweenX('down', 1, -5000, 0.01, 'linear');
        noteTweenX('up', 2, -5000, 0.01, 'linear');
        noteTweenX('right', 3, -5000, 0.01, 'linear');

    end
end

function onCountdownTick(counter)
    if counter == 0 then
        
    end
    if counter == 1 then
        setProperty('countdownReady.x', -5000);
    end
    if counter == 2 then
        setProperty('countdownSet.x', -5000);
    end
    if counter == 3 then
        setProperty('countdownGo.x', -5000);
        
    end
end