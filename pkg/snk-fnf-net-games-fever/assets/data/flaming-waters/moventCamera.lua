local followchars
function onUpdatePost(elapsed)
    xx =700
    yy =700

    xx2 =1500
    yy2 =700

    yGF=700
    xGF=700
    
    ofs = 25
    ofs2 = 25

    del = 0;
    del2 = 0;
    followchars = true

       if del > 0 then
           del = del - 1
       end
       if del2 > 0 then
           del2 = del2 - 1
       end
     
       if followchars == true then
         
           if mustHitSection == false then
      
               if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                   triggerEvent('Camera Follow Pos',xx-ofs2,yy)
               
               end
               if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                   triggerEvent('Camera Follow Pos',xx+ofs2,yy)
               
               end
               if getProperty('dad.animation.curAnim.name') == 'singUP' then
                   triggerEvent('Camera Follow Pos',xx,yy-ofs2)
                 
               end
               if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                   triggerEvent('Camera Follow Pos',xx,yy+ofs2)
                 
               end
               if getProperty('dad.animation.curAnim.name') == 'idle' then
                   triggerEvent('Camera Follow Pos',xx,yy)
                
                 
               end
                
            else
               
              
                if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt'or getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                  
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt'or getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                end
                 if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
                end
            end
            if gfSection then

        
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' or getProperty('gf.animation.curAnim.name') == 'singLEFT-alt'or getProperty('gf.animation.curAnim.name') == 'singLEFTmiss' then
                    triggerEvent('Camera Follow Pos',xGF-ofs,yGF)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' or getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' or getProperty('gf.animation.curAnim.name') == 'singRIGHTmiss' then
                    triggerEvent('Camera Follow Pos',xGF+ofs,yGF)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' or getProperty('gf.animation.curAnim.name') == 'singUP-alt'or getProperty('gf.animation.curAnim.name') == 'singUPmiss' then
                    triggerEvent('Camera Follow Pos',xGF,yGF-ofs)
                  
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' or getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' or getProperty('gf.animation.curAnim.name') == 'singDOWNmiss' then
                    triggerEvent('Camera Follow Pos',xGF,yGF+ofs)
                  
                end
                 if getProperty('gf.animation.curAnim.name') == 'danceLeft' or getProperty('gf.animation.curAnim.name') == 'danceRight'  then
                    triggerEvent('Camera Follow Pos',xGF,yGF)
                    
                end       
            end         
          
       else
           triggerEvent('Camera Follow Pos','','')
       end

       if curStep== 10 then
        CreateBars()
    end    
  
end

function CreateBars()

    makeLuaSprite('upBarr')
    makeGraphic('upBarr',1500,500,'000000')
    addLuaSprite('upBarr')
    setObjectCamera('upBarr','camHUD')


    makeLuaSprite('downBarr')
    makeGraphic('downBarr',1500,500,'000000')
    addLuaSprite('downBarr')
    setObjectCamera('downBarr','camHUD')


    screenCenter('upBarr','X')
    screenCenter('downBarr','X')
    setProperty('upBarr.y',-1400)
    setProperty('downBarr.y',1400)

	doTweenY('moveStart', 'upBarr', -400, 1 , 'CircInOut')
    doTweenY('moveStart2', 'downBarr', 630, 1 , 'CircInOut')
end   