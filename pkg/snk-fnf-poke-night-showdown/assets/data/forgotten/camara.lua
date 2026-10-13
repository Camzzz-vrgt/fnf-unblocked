local xx = -250;
local yy = -100;
local xx2 = -250;
local yy2 = -100;
local ofs = 25;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreatePost()
   setTextBorder('scoreTxt', 1.0, '000000')
   setTextSize('scoreTxt', 13);

   setTextBorder('botplayTxt', .9, '000000')
   setTextSize('botplayTxt', 15);

   setTextBorder('timeTxt', 2.9, '000000')
   setTextSize('timeTxt', 13)
   setProperty('timeTxt.y', (downscroll and 690 or 29))
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
    zoomshit = (getProperty('camGame.zoom')/0.8);
    setCharacterX('boyfriend',bfx*zoomshit)
    setCharacterY('boyfriend',bfy*zoomshit)
    setProperty('boyfriend.scale.x',zoomshit)
    setProperty('boyfriend.scale.y',zoomshit)
end

function onStepHit()
if curStep >= 192 then
xx = 100
yy = -300
xx2 = -250
yy2 = -50
end
end