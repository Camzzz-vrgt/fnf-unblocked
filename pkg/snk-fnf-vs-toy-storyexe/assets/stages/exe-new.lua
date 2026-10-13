function onStartCountdown()
    makeLuaSprite('coso', 'empty', 0, 0)
	makeGraphic('coso', 1400, 1100, '000000')
	setObjectCamera('coso', 'camOther')
    doTweenAlpha('fadeout', 'coso', 0.2, 5, 'linear')
	addLuaSprite('coso', true)
end  
function onCreatePost()
    ekis=-400
    ye=-300
    scales=1.2
    extrax=0;
    extray=0;
    makeLuaSprite('bg', 'woodyexe-bg-new/bg', -400, -300);
	scaleObject('bg', 1.2, 1.2);
    makeLuaSprite('bratzo', 'woodyexe-bg-new/lol', -400, -300);
	scaleObject('bratzo', 1.2, 1.2);


	makeLuaSprite('papa', 'woodyexe-bg-new/sr-face-papa', -400, -300);
	scaleObject('papa', 1.2, 1.2);

    

    makeLuaSprite('sex', 'woodyexe-bg-new/rex', -400, -300);
	scaleObject('sex', 1.2, 1.2);

    makeLuaSprite('efect','woodyexe-bg-new/819_sin_titulo_20230521191951',-50,-200)
    setObjectCamera('efect','camOther')
    scaleObject('efect',0.8,0.8)


    addLuaSprite('bg', false);
    addLuaSprite('bratzo', false);
    addLuaSprite('papa', false);
    addLuaSprite('sex', false);
    addLuaSprite('efect',true);
    

end    

camera1=true
camera2=false
function onUpdate()

  
    if camera1== false then
    end    
    if camera1== true then
        local xx = 660;
        local yy = 390;
        local xx2 = 700;
        local yy2 = 450;
        local ofs = 18;
        local followchars = true;
        local del = 0;
        local del2 = 0;
	    if del > 0 then
		  del = del - 1
	    end
	    if del2 > 0 then
		   del2 = del2 - 1
	    end
        if followchars == true then
           if mustHitSection == false then
               if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                   triggerEvent('Camera Follow Pos',xx-ofs,yy)
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                   triggerEvent('Camera Follow Pos',xx+ofs,yy)
                end
                if getProperty('dad.animation.curAnim.name') == 'singUP' then
                   triggerEvent('Camera Follow Pos',xx,yy-ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                   triggerEvent('Camera Follow Pos',xx,yy+ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                   triggerEvent('Camera Follow Pos',xx-ofs,yy)
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                   triggerEvent('Camera Follow Pos',xx+ofs,yy)
                end
                if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                   triggerEvent('Camera Follow Pos',xx,yy-ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                   triggerEvent('Camera Follow Pos',xx,yy+ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                   triggerEvent('Camera Follow Pos',xx,yy)
                end
                if getProperty('dad.animation.curAnim.name') == 'idle' then
                   triggerEvent('Camera Follow Pos',xx,yy)
                end
           else

                if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                   triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                end
	            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                   triggerEvent('Camera Follow Pos',xx2,yy2)
                end
           end
        else
           triggerEvent('Camera Follow Pos','','')
        end

    end

    if camera2==true then
       -- camera 2 
        local xx3 = 1150;
        local yy3 = 450;
        local ofs = 18;
        local followchars = true;
        local del = 0;
        local del2 = 0;
        if del > 0 then
		  del = del - 1
	    end
	    if del2 > 0 then
		  del2 = del2 - 1
	    end
        if followchars == true then
            if mustHitSection == false then

            else    
              if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                  triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
               end
               if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                 triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                  triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                   triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
	            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                   triggerEvent('Camera Follow Pos',xx3,yy3)
                end
            end
        else
           triggerEvent('Camera Follow Pos','','')
        end
    end

    for i=0,3 do
        noteTweenAlpha(i+0, i, 0.3, 1)
    end
    for i=4,7 do
        noteTweenAlpha(i+0, i, 0.7, 1)
    end
    if curStep==374 then
        doTweenAlpha('ekisde2', 'bg', 0, 2, 'linear')
        doTweenAlpha('lelolero2', 'gf', 0, 2, 'linear')
        doTweenAlpha('lelolero23', 'boyfriend', 0, 2, 'linear')
        doTweenAlpha('lelolero12', 'papa', 0, 2, 'linear')
    end    
    if curStep==440 then
        doTweenAlpha('ekisde', 'bg', 1, 2, 'linear')
        doTweenAlpha('lelolero', 'gf', 1, 2, 'linear')
        doTweenAlpha('lelole3', 'boyfriend', 1, 2, 'linear')
        doTweenAlpha('leloler', 'papa', 1, 2, 'linear')
    end
    if curStep==1367 then
        triggerEvent('Change Character','dad','Faker')
    end   
    if curStep==1400 then
     doTweenAlpha('lel', 'gf', 0.2, 2, 'linear')
     doTweenAlpha('bgalphacero', 'bg', 0.2, 2, 'linear')
     doTweenAlpha('lapapa', 'papa', 0.2, 2, 'linear')
   
     
    end

    if curStep==1512 then
        doTweenAlpha('lel2', 'gf', 1, 2, 'linear')
        doTweenAlpha('bgal2phacero', 'bg', 1, 2, 'linear')
        doTweenAlpha('lapap2a', 'papa', 1, 2, 'linear')
      
        
       end
       if curStep==1768 then
        doTweenAlpha('lel2', 'gf', 0, 0.1, 'linear')
        doTweenAlpha('bgal2phacero', 'bg', 0, 0.1, 'linear')
        doTweenAlpha('lapap2a', 'papa', 0, 0.1, 'linear')
        doTweenAlpha('lapapasxac', 'dad', 0, 0.1, 'linear')
        setProperty('healthBarBG.alpha',0)
        setProperty('healthBar.alpha',0)
        setProperty('scoreTxt.alpha',0)
        setProperty('iconP1.alpha',0)
        setProperty('iconP2.alpha',0)
       end
       if curStep==1104 then
        doTweenAlpha('lels2', 'gf', 1, 0.1, 'linear')
        doTweenAlpha('bgal2psahacero', 'bg', 1, 0.1, 'linear')
        doTweenAlpha('lapaasp2a', 'papa', 1, 0.1, 'linear')
        doTweenAlpha('lapapaassxac', 'dad', 1, 0.1, 'linear')
      
        
       end
       if curStep==2105 then
        doTweenAlpha('lelssa2', 'gf', 1, 0.1, 'linear')
        doTweenAlpha('bgal2sadpsahacero', 'bg', 1, 0.1, 'linear')
        doTweenAlpha('lapaaasdsp2a', 'papa', 1, 0.1, 'linear')
        doTweenAlpha('lapapasaassxac', 'dad', 1, 0.1, 'linear')
        setProperty('healthBarBG.alpha',1)
        setProperty('healthBar.alpha',1)
        setProperty('scoreTxt.alpha',1)
        setProperty('iconP1.alpha',1)
        setProperty('iconP2.alpha',1)
        
       end
       if curStep==1896 then
        doTweenAlpha('lels2', 'gf', 0.4, 0.2, 'linear')
       end
       if curStep==1899 then
        doTweenAlpha('lels2', 'gf', 0, 0.1, 'linear')
       end
    if curStep== 429 then
        doTweenZoom('screenZoom3', 'camGame',1.5, 3, 'circInOut')
    end

    if curStep== 450 then
     triggerEvent('Change Character','dad','Woody.Exe-Reskin')
    end
    if curStep== 1511 then
        triggerEvent('Change Character','dad','Woody.Exe-Reskin')
     end
  

    if curStep==1767 then
        camera2=true;
        camera1=false;
    end    
    if curStep==2487 then
        camera1=false;
        camera2=true;
        doTweenAlpha('lelssaxa2', 'gf', 0, 0.1, 'linear')
        doTweenAlpha('bgalax', 'bg', 0, 0.1, 'linear')
        doTweenAlpha('lapaca', 'papa', 0, 0.1, 'linear')
        doTweenAlpha('lasssxac', 'dad', 0, 0.1, 'linear')
        setProperty('healthBarBG.alpha',0)
        setProperty('healthBar.alpha',0)
        setProperty('scoreTxt.alpha',0)
        setProperty('iconP1.alpha',0)
        setProperty('iconP2.alpha',0)
        setProperty('timeTxt.alpha',0)
        setProperty('timeBarBG.alpha',0)
        setProperty('timeBar.alpha',0)
    end    
    if curStep==2055 then
        camera2=false;
        camera1=true;
    end    

end