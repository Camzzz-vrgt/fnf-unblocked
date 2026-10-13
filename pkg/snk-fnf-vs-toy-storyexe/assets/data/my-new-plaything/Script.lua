function onBeatHit()
    if bump2 == true then
        if curBeat % 1 == 0 then

            doTweenZoom('awer', 'camGame', 0.8, 0.070, 'linear') 

            setProperty('camGame.angle', -5)
            doTweenAngle('cero', 'camGame', 0, 0.7,'circOut')  

            setProperty('camHUD.angle', -4)
            doTweenAngle('cer3o', 'camHUD', 0, 0.7,'circOut')  
            
            setProperty('camHUD.x', -50)
            doTweenX('ceer3o', 'camHUD', 0, 0.7,'linear')  
 
        end
        if curBeat % 2 == 0 then

            doTweenZoom('awer', 'camGame', 0.8, 0.070, 'linear') 

            setProperty('camGame.angle', 5)
            doTweenAngle('cero', 'camGame', 0, 0.7,'circOut') 

            setProperty('camHUD.angle', 4)
            doTweenAngle('cer3o', 'camHUD', 0, 0.7,'circOut') 

            setProperty('camHUD.x', 50)
            doTweenX('ceer3o', 'camHUD', 0, 0.7,'linear') 
  
        end
    end
    if bump2==false then
    end    
end   
function onUpdate(elapsed)



   
    if ola ==true then
        triggerEvent('Camera Follow Pos','500','190')   
        
    else
        triggerEvent('Camera Follow Pos','','')   
    end    
    if curStep == 360 then
        doTweenAlpha('fadeousad4', 'oscuro', 0.7, 5, 'linear')
      
    end
    if curStep == 400 then
        doTweenAlpha('fadeoxddxadkakd', 'oscuro', 1, 1, 'linear')
      
    end
    if curStep == 460 then
        doTweenAlpha('fadkacdaksdkaskd', 'oscuro', 0, 1, 'linear')
      
        activo=false;
    end
    if curStep==380 then
       ola=true
    end    
    if curStep==530 then
        ola=false
    end    
    if curStep == 440 then
        doTweenAlpha('fadeoudfeas', 'oscuro', 0, 5, 'linear')
    end    
    if curStep == 460 then 
        bump2 =true;
    end
    if curStep==1367 then
        bump2 =false;
    end    
    if curStep==1512 then
     
        bump2=true;
    end    
  
    if curStep==1767 then 
        bump2=false;
    end    
      

      
end  
