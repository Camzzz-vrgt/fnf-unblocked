local xx = -120;
local yy = 470;
local xx2 = 270;
local yy2 = 470;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()

   addCharacterToList('bf-light', 'bf');
   addCharacterToList('sans-dusttale-almas', 'dad');
   addCharacterToList('bf-dust', 'bf');
   addCharacterToList('sans-dusttale', 'dad');
   precacheImage('Transition', 'SnowForest/Snow-Storm-Transition', true)
   precacheImage('Snow', 'SnowForest/Snow-Storm', true)
   precacheImage('Trees', 'SnowForest/Trees', true)
   precacheImage('Floor2', 'SnowForest/Floor2', true)
   precacheImage('Floor', 'SnowForest/Floor', true)
   precacheImage('BG', 'SnowForest/BG-Dark', true)
   precacheImage('Fungi', 'SnowForest/Fungi-Left-Dark', true)
   precacheImage('Fungi2', 'SnowForest/Fungi-Right-Dark', true)
   precacheImage('Grass', 'SnowForest/Grass-Dark', true)

   makeLuaSprite('Trees', 'SnowForest/Trees', -1000, -710);
   scaleObject('Trees', 0.85, 0.85);
   setScrollFactor('Trees', 0.65, 0.65);
   setProperty('Trees.visible', true)
   addLuaSprite('Trees', false);

   makeLuaSprite('Floor2', 'SnowForest/Floor2', -960, 220);
   scaleObject('Floor2', 0.85, 0.85);
   setProperty('Floor2.visible', true)
   setScrollFactor('Floor2', 0.75, 0.75);
   addLuaSprite('Floor2', false);

   makeLuaSprite('Floor', 'SnowForest/Floor', -1200, 450); 
   scaleObject('Floor', 0.85, 0.9);
   setObjectOrder('Floor', 3);
   setProperty('Floor.visible', true)
   addLuaSprite('Floor', false);

   makeLuaSprite('Overlay', 'SnowForest/Black-Overlay', 0, 0);   
   setObjectCamera('Overlay', 'camHUD')
   setProperty('Overlay.alpha', 0)
   addLuaSprite('Overlay', false);

   makeLuaSprite('BG', 'SnowForest/BG-Dark', -1250, -480);
   scaleObject('BG', 1.1, 1.1);
   setProperty('BG.visible', false)
   addLuaSprite('BG', false);

   makeLuaSprite('Fungi', 'SnowForest/Fungi-Left-Dark', -1250, -450);
   scaleObject('Fungi', 1.1, 1.1);
   setScrollFactor('Fungi', 0.9, 0.9);
   setProperty('Fungi.visible', false)
   addLuaSprite('Fungi', false);

   makeLuaSprite('Grass', 'SnowForest/Grass-Dark', -1250, -400);
   scaleObject('Grass', 1.1, 1.1);
   setScrollFactor('Grass', 0.9, 0.9);
   setProperty('Grass.visible', false)
   addLuaSprite('Grass', false);

   makeLuaSprite('Fungi2', 'SnowForest/Fungi-Right-Dark', -1250, -480);
   scaleObject('Fungi2', 1.1, 1.1);
   setScrollFactor('Fungi2', 0.9, 0.9);
   setProperty('Fungi2.visible', false)
   addLuaSprite('Fungi2', true);

   makeAnimatedLuaSprite('Snow', 'SnowForest/Snow-Storm', 0, 0);
   addAnimationByPrefix('Snow', 'idle', 'tormenta', 24, true);
   setObjectCamera('Snow', 'other')
   setProperty('Snow.visible', true)
   addLuaSprite('Snow', true);

   makeLuaSprite('black', 'black', -380, -400)
   makeGraphic('black', 2400, 1800, '000000')
   setProperty('black.alpha', 1);
   setObjectCamera('black', 'other');
   addLuaSprite('black', true)

   makeAnimatedLuaSprite('Transition', 'SnowForest/Snow-Storm-Transition', 0, -20);
   addAnimationByPrefix('Transition', 'idle', 'trans', 24, false);
   setProperty('Transition.alpha', 0)
   setObjectCamera('Transition', 'other')
   addLuaSprite('Transition', true);
end

function onCreatePost()
   setProperty('camHUD.alpha', 0)
   setProperty('gf.alpha', 1)
   setScrollFactor('gfGroup', 0.75, 0.75)
    setProperty('introSoundsSuffix', 'muted')
end

function onUpdate(elapsed)
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
           if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
               triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
           end
           if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
               triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
           end
           if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
               triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
           end
           if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
               triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
           end
           if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
               triggerEvent('Camera Follow Pos',xx2,yy2)
           end
           if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
               triggerEvent('Camera Follow Pos',xx2,yy2)
           end
       end
   else
       triggerEvent('Camera Follow Pos','','')
   end
  if curStep >= 510 then
    songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/130)

    doTweenY(gfTweenY, 'gf', -45-35*math.sin((currentBeat*0.25)*math.pi),0.001)

  end
end


function onStepHit()
   if curStep == 1 then
      doTweenAlpha('black', 'black', 0, 10, 'linear')
      noteTweenAlpha('play0', 0, 0.65, 0.5)
      noteTweenAlpha('play1', 1, 0.65, 0.5)
      noteTweenAlpha('play2', 2, 0.65, 0.5)
      noteTweenAlpha('play3', 3, 0.65, 0.5)
      noteTweenAlpha('play4', 4, 0.65, 0.5)
      noteTweenAlpha('play5', 5, 0.65, 0.5)
      noteTweenAlpha('play6', 6, 0.65, 0.5)
      noteTweenAlpha('play7', 7, 0.65, 0.5)
   end
   if curStep == 125 then
      doTweenAlpha('camhud', 'camHUD', 1, 1, 'linear')
   end
   if curStep == 460 then
      doTweenAlpha('gf', 'gf', 0, 1, 'linear')
   end
   if curStep == 510 then
   doTweenX('gf.x', 'gf', -295, 0.01, 'sineIn')
   end
   if curStep == 512 then
      setProperty("defaultCamZoom", 0.65) 
      xx = 150
      yy = 390
      xx2 = 150
      yy2 = 390 
      doTweenAlpha('gf', 'gf', 1, 1, 'linear')
   end
   if curStep == 639 then
      setProperty("defaultCamZoom", 0.78) 
      xx2 = 450
      yy2 = 510 
   end
   if curStep == 767 then
      setProperty("defaultCamZoom", 0.65) 
      xx2 = 150
      yy2 = 390 
   end
   if curStep == 1021 then
      doTweenAlpha('gf', 'gf', 0, 1, 'linear')
   end
   if curStep == 1023 then
      xx = -130
      yy = 470
      doTweenAlpha('Overlay', 'Overlay', 0.9, 5, 'linear')
      doTweenZoom('screenZoom', 'camGame', 0.85, 29.2, 'linear');
   end
   if curStep == 1050 then
      xx2 = 450
      yy2 = 520
   end
   if curStep == 1275 then
      objectPlayAnimation('Transition', 'idle', true);
      setProperty('Transition.alpha', 1)
      doTweenAlpha('trans', 'Transition', 0, 1, 'linear')
   end
   if curStep == 1275 then
      setProperty("defaultCamZoom", 0.72) 
   end
   if curStep == 1276 then
      xx2 = 240
      yy = 200
      setProperty('Overlay.alpha', 0) 
      triggerEvent('Change Character', 'bf', 'bf-light');  
      triggerEvent('Change Character', 'dad', 'sans-dusttale-almas');  
      setProperty('Floor2.visible', false)
      setProperty('Floor.visible', false)
      setProperty('Snow.visible', false)
      setProperty('Trees.visible', false)
      setProperty('Grass.visible', true)
      setProperty('Fungi.visible', true)
      setProperty('Fungi2.visible', true)
      setProperty('BG.visible', true)
   end
   if curStep == 1407 then
      setProperty("defaultCamZoom", 0.8)   
   end
   if curStep == 1534 then
      objectPlayAnimation('Transition', 'idle', true);
      setProperty('Transition.alpha', 1)
      doTweenAlpha('trans', 'Transition', 0, 1, 'linear')
      setProperty("defaultCamZoom", 0.72) 
   end
   if curStep == 1535 then
      xx = -120
      yy = 470
      xx2 = 270
      yy2 = 470
      triggerEvent('Change Character', 'bf', 'bf-dust');  
      triggerEvent('Change Character', 'dad', 'sans-dusttale');  
      setProperty('Floor2.visible', true)
      setProperty('Snow.visible', true)
      setProperty('Floor.visible', true)
      setProperty('Trees.visible', true)
      setProperty('Grass.visible', false)
      setProperty('Fungi.visible', false)
      setProperty('Fungi2.visible', false)
      setProperty('BG.visible', false)
   end
   if curStep == 1791 then
      setProperty('camHUD.alpha', 0);
      setProperty('black.alpha', 1);
      doTweenAlpha('black', 'black', 0, 3.5, 'linear')
   end
   if curStep == 1823 then
      setProperty('black.alpha', 1);
      doTweenAlpha('black', 'black', 0, 3.5, 'linear')
   end
   if curStep == 1855 then
      setProperty('black.alpha', 1);
      doTweenAlpha('black', 'black', 0, 3.5, 'linear')
   end
   if curStep == 1871 then
      setProperty('black.alpha', 1);
      doTweenAlpha('black', 'black', 0, 3.5, 'linear')
   end
   if curStep == 1887 then
      setProperty('black.alpha', 1);
      doTweenAlpha('black', 'black', 0, 3.5, 'linear')
   end
   if curStep == 1903 then
      setProperty('black.alpha', 1);
      doTweenAlpha('black', 'black', 0, 3.5, 'linear')
   end
   if curStep == 1916 then
      setProperty('black.alpha', 1);
      doTweenAlpha('black', 'black', 0, 3.5, 'linear')
   end
   if curStep == 1919 then
      setProperty('black.alpha', 1);
      doTweenAlpha('black', 'black', 0, 3.5, 'linear')
   end
   if curStep == 1951 then
      setProperty('black.alpha', 1);
      doTweenAlpha('black', 'black', 0, 3.5, 'linear')
   end
   if curStep == 1983 then
      setProperty('black.alpha', 1);
      doTweenAlpha('black', 'black', 0, 3.5, 'linear')
   end
   if curStep == 2005 then
      doTweenAlpha('black', 'black', 1, 10, 'linear')
   end
end
