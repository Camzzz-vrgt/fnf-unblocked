local bopCam = false
local followMiddle = false
local canPause = true
local shakeCam = false
function onCreate()
    addCharacterToList('Zoe', 'boyfriend')
    addCharacterToList('bigbird', 'boyfriend')
    precacheImage('Tantrum_Week/Tantrum_BG2')
end

function onStepHit()
    if shakeCam then
        if getProperty('health') > 0.2 then
            cameraShake('camGame', 0.005, 0.07)
            cameraShake('camHUD', 0.005, 0.07)
        elseif getProperty('health') <= 0.2 then
            cameraShake('camGame', 0.01, 0.07)
            cameraShake('camHUD', 0.01, 0.07)

        end
        
      

    end
    if curStep == 127 then
        bopCam = 'idles'
    elseif curStep == 190 then
        bopCam = 'beats'
    elseif curStep == 510 then
        bopCam = false
    elseif curStep == 512 then
        setProperty('defaultCamZoom', 0.9)
        doTweenZoom('d', 'camGame', 0.9, 1, 'linear')
    elseif curStep == 576 then
        setProperty('defaultCamZoom', 0.4)
        doTweenZoom('d', 'camGame', 0.4, 1, 'linear')
        bopCam = 'beats'
    elseif curStep == 1088 then
        epicMoment()
    elseif curStep == 1216 then
        epicMoment(true)
        bopCam = 'beats'
    elseif curStep == 1472 then  
        cameraFlash('camGame', 'ffffff', 2, true)
        bopCam = 'sections'
        setProperty('Tantrum_BG2.alpha',1)

        setProperty('ernie.alpha', 0)
        setProperty('bert.alpha', 0)
        setProperty('oscar.alpha', 0)
        setProperty('cookiemonster.alpha', 0)

        doTweenAlpha('hud1', 'iconP1', 0, 0.1, 'linear')
        doTweenAlpha('hud2', 'iconP2', 0, 0.1, 'linear')
        doTweenAlpha('hud3', 'healthBar', 0, 0.1, 'linear')
       -- doTweenAlpha('hud5', 'healthbarBG', 0, 1, 'linear')

        doTweenAlpha('hud4', 'scoreTxt', 0, 0.1, 'linear')
        triggerEvent('Change Character', 'BF', 'Zoe')
        doTweenAlpha('f', 'Tantrum_BG', 0, 0.1, 'linear')
        doTweenAlpha('f2', 'Tantrum_Post', 0, 0.1, 'linear')
        noteTweenAlpha('1', 0, 0, 0.1, 'linear')
        noteTweenAlpha('2', 1, 0, 0.1, 'linear')
        noteTweenAlpha('3', 2, 0, 0.1, 'linear')
        noteTweenAlpha('4', 3, 0, 0.1, 'linear')
        noteTweenX('5', 4, 415, 0.01, 'linear')
        noteTweenX('6', 5, 525, 0.01, 'linear')
        noteTweenX('7', 6, 635, 0.01, 'linear')
        noteTweenX('8', 7, 745, 0.01, 'linear')
    elseif curStep == 1600 then 
        setProperty('boyfriend.color', getColorFromHex('ffffff'))
        cameraFlash('camGame', 'ffffff', 2, true)
    elseif curStep == 1728 then 
        bopCam = 'beats'
    elseif curStep == 1856 then 
        bopCam = 'idles'
    elseif curStep == 1984 then 
        bopCam = 'beats'
    elseif curStep == 2112 then 
        bopCam = 'idles'

    elseif curStep == 2240 then 
        bopCam = false
        
    elseif curStep == 2616 then 
        triggerEvent('Play Animation', 'ded', 'BF')
       

        --setProperty('camGame.alpha', 0)
        cameraShake('camHUD', 0.1, 1)
    elseif curStep == 2620 then 
        setProperty('camGame.alpha', 0)
    elseif curStep == 2624 then 
        bopCam = 'beats'
        setProperty('camGame.alpha', 1)
        setProperty('defaultCamZoom', 0.4)
        doTweenZoom('d', 'camGame', 0.4, 1, 'linear')
        
        cameraFlash('camGame', 'ffffff', 2, true)
        setProperty('Tantrum_BG.alpha',1)
        triggerEvent('Change Character', 'BF', 'bigbird')

        doTweenAlpha('hud1', 'iconP1', 1, 0.1, 'linear')
        doTweenAlpha('hud2', 'iconP2', 1, 0.1, 'linear')
        doTweenAlpha('hud3', 'healthBar', 1, 0.1, 'linear')
       -- doTweenAlpha('hud5', 'healthbarBG', 0, 1, 'linear')

        doTweenAlpha('hud4', 'scoreTxt', 1, 0.1, 'linear')
        noteTweenAlpha('1', 0, 1, 0.1, 'linear')
        noteTweenAlpha('2', 1, 1, 0.1, 'linear')
        noteTweenAlpha('3', 2, 1, 0.1, 'linear')
        noteTweenAlpha('4', 3, 1, 0.1, 'linear')
        noteTweenX('5', 4, 732, 0.01, 'linear')
        noteTweenX('6', 5, 844, 0.01, 'linear')
        noteTweenX('7', 6, 956, 0.01, 'linear')
        noteTweenX('8', 7, 1068, 0.01, 'linear')
        setProperty('camGame.alpha', 1)
        setProperty('ernie.alpha', 1)
        setProperty('Tantrum_BG2.alpha',0)

        setProperty('bert.alpha', 1)
        setProperty('oscar.alpha', 1)
        setProperty('cookiemonster.alpha', 1)
    elseif curStep == 3136 then 
        bopCam = 'idles'
        epicMoment()

    elseif curStep == 3264 then
        bopCam = false
        epicMoment(true)

    elseif curStep == 3391 then
	setProperty('camGame.alpha', 0)

    elseif curStep == 3648 then
        bopCam = 'beats'
	
	setProperty('camGame.alpha', 1)
        setProperty('ernie.alpha', 0)
        setProperty('bert.alpha', 0)
	setProperty('oscar.alpha', 0)
    elseif curStep == 3926 then
        bopCam = 'idles'
	
        setProperty('cookiemonster.alpha', 0)
    elseif curStep == 4160 then
        bopCam = 'beats'

    elseif curStep == 4544 then
        bopCam = 'sections'

    elseif curStep == 4800 then
        shakeCam = true
    elseif curStep == 4928 then
        setProperty('camGame.alpha', 0)
        setProperty('camHUD.alpha', 0)

    end
end
function onBeatHit()
    if bopCam == 'idles' then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', '0.07', '0.07')

        end
    elseif bopCam == 'beats' then
        triggerEvent('Add Camera Zoom', '0.05', '0.05')

    elseif bopCam == 'section' then
        if curBeat % 4 == 0 then
            triggerEvent('Add Camera Zoom', '0.07', '0.07')

       
        end

 
    end
end
function epicMoment(endIt)
    if endIt == nil then endIt = false end
    if not endIt then
        bopCam = false;
        followMiddle = true;
        setProperty('defaultCamZoom', 0.2);
        doTweenZoom('d', 'camGame', 0.2, 1, 'linear');
        doTweenAlpha('f', 'Tantrum_BG', 0, 1, 'linear');
        doTweenAlpha('f2', 'Tantrum_Post', 0, 1, 'linear');
        doTweenColor('bird', 'boyfriend', 'FFF200', 1, 'linear');
        doTweenColor('cookiemonster', 'cookiemonster', '5072F9', 1, 'linear');
        doTweenColor('oscar', 'oscar', '768245', 1, 'linear');
        doTweenColor('dad', 'dad', 'FF0000', 1, 'linear');
         
        doTweenColor('ernie', 'ernie', 'EC753B', 1, 'linear');
        doTweenColor('bert', 'bert', 'E3AF35', 1, 'linear');
        doTweenAlpha('hud1', 'iconP1', 0, 1, 'linear');
        doTweenAlpha('hud2', 'iconP2', 0, 1, 'linear');
        doTweenAlpha('hud3', 'healthBar', 0, 1, 'linear');

        doTweenAlpha('hud4', 'scoreTxt', 0, 1, 'linear');
        

    else
        followMiddle = false
        setProperty('defaultCamZoom', 0.4);
        doTweenZoom('d', 'camGame', 0.4, 1, 'linear');
        doTweenAlpha('f', 'Tantrum_BG', 1, 1, 'linear');
        doTweenAlpha('f2', 'Tantrum_Post', 1, 1, 'linear');
        doTweenColor('bird', 'boyfriend', 'ffffff', 1, 'linear');
        doTweenColor('cookiemonster', 'cookiemonster', 'ffffff', 1, 'linear');
        doTweenColor('oscar', 'oscar', 'ffffff', 1, 'linear');
        doTweenColor('dad', 'dad', 'ffffff', 1, 'linear');

        doTweenColor('ernie', 'ernie', 'ffffff', 1, 'linear');
        doTweenColor('bert', 'bert', 'ffffff', 1, 'linear');
        doTweenAlpha('hud1', 'iconP1', 1, 1, 'linear');
        doTweenAlpha('hud2', 'iconP2', 1, 1, 'linear');
        doTweenAlpha('hud3', 'healthBar', 1, 1, 'linear');

        doTweenAlpha('hud4', 'scoreTxt', 1, 1, 'linear');
    end

end
function onUpdate(elapsed)
    if followMiddle then
        setProperty('camFollow.x', 1900)
        setProperty('camFollow.y', 1600)


    end
    if shakeCam then
        if getProperty('health') > 0.1 then
        setProperty('health', getProperty('health')-0.002)    


     end
    end
end
function onPause()
    if not canPause then
        
        return Function_Stop

    else
        return Function_Continue 

    end

end