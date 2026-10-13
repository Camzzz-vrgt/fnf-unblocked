function onCreate()
  
end
function onUpdate()
    curDifficulty = getPropertyFromClass('StoryMenuState','curDifficulty');
    curDifficulty2 = getPropertyFromClass('FreeplayState','curDifficulty');

    if(curStep == 16) then
        setProperty('defaultCamZoom',1);
    elseif(curStep == 55) then
        setProperty('defaultCamZoom',1.5);
    elseif(curStep == 59) then
        setProperty('defaultCamZoom',1);
    elseif(curStep == 88) then
        setProperty('defaultCamZoom',1.5);
    elseif(curStep == 94) then
        setProperty('defaultCamZoom',1);
    elseif(curStep == 128) then
        setProperty('defaultCamZoom',0.9);
    elseif(curStep == 176) then
        setProperty('defaultCamZoom',1.3);
    elseif(curStep == 192) then
        setProperty('defaultCamZoom',1);
    elseif(curStep == 224) then
        setProperty('defaultCamZoom',1.5);
    elseif(curStep == 240) then
        setProperty('defaultCamZoom',1.1);
    elseif(curStep == 495) then
        setProperty('defaultCamZoom',0.8);
    elseif(curStep == 639) then
        setProperty('defaultCamZoom',1);
    elseif(curStep == 672) then
        setProperty('defaultCamZoom',1.2);
    elseif(curStep == 703) then
        setProperty('defaultCamZoom',1.4);
    elseif(curStep == 735) then
        setProperty('defaultCamZoom',1.5);
    elseif(curStep == 763) then
        setProperty('defaultCamZoom',2);
    elseif(curStep == 767) then
        setProperty('defaultCamZoom',1);
    elseif(curStep == 1010) then
        setProperty('defaultCamZoom',0.8);
    elseif(curStep == 1024) then
        setProperty('defaultCamZoom',1.2);
    elseif(curStep == 1280) then
        setProperty('defaultCamZoom',1);
    elseif(curStep == 1520) then
        setProperty('defaultCamZoom',1.1);
    elseif(curStep == 1524) then
        setProperty('defaultCamZoom',1.2);
    elseif(curStep == 1528) then
        setProperty('defaultCamZoom',1.3);
    elseif(curStep == 1532) then
        setProperty('defaultCamZoom',1.4);
    elseif(curStep == 1535) then
        setProperty('defaultCamZoom',1);
    elseif(curStep == 1568) then
        setProperty('defaultCamZoom',1.5);
    elseif(curStep == 1584) then
        setProperty('defaultCamZoom',1);
    elseif(curStep == 1607) then
        setProperty('defaultCamZoom',1.5);
    elseif(curStep == 1611) then
        setProperty('defaultCamZoom',1);
    elseif(curStep == 1639) then
        setProperty('defaultCamZoom',1.5);
    elseif(curStep == 1645) then
        setProperty('defaultCamZoom',1);
    elseif(curStep == 1665) then
        setProperty('defaultCamZoom',1.5);
    elseif(curStep == 1680) then
        setProperty('defaultCamZoom',0.7);
    end
   -- setProperty('showRating', false);
   --setProperty('showComboNum', false);

   
   noteTweenAlpha('alt001','0','0','0.01','circInOut')
   noteTweenAlpha('alt002','1','0','0.01','circInOut')
   noteTweenAlpha('alt003','2','0','0.01','circInOut')
   noteTweenAlpha('alt004','3','0','0.01','circInOut')
   noteTweenX('alt0011','0','-400','0.01','circInOut')
   noteTweenX('alt0021','1','-400','0.01','circInOut')
   noteTweenX('alt0031','2','-400','0.01','circInOut')
   noteTweenX('alt0041','3','-400','0.01','circInOut')
   --[[
   setPropertyFromGroup('opponentStrums', 0, 'alpha', 0)
   setPropertyFromGroup('opponentStrums', 1, 'alpha', 0)
   setPropertyFromGroup('opponentStrums', 2, 'alpha', 0)
   setPropertyFromGroup('opponentStrums', 3, 'alpha', 0)
   ]]
   
end
function onBeatHit()
    if(curStep > 64 and curStep < 1551)then
        triggerEvent('Add Camera Zoom',0.03,0.03);
    end
    if(curStep > 1616)then
        triggerEvent('Add Camera Zoom',0.03,0.03);
    end
end
function goodNoteHit()
    if(curStep > 1664) then
        triggerEvent('Add Camera Zoom',0.02,0.02);
    end
end

function onStepHit()
    if curStep == 240 then
        doTweenZoom('zoomOut', 'camGame', 1.1, 1, 'quadInOut')
    end
    if curStep == 1010 then
        doTweenZoom('zoomOut', 'camGame', 0.8, 1, 'quadInOut') 
    end
    if curStep == 1535 then
        doTweenZoom('zoomOut', 'camGame', 1, 2.5, 'quadInOut') 
    end

end
