function onCreatePost()
   makeLuaSprite('name', 'purinname', -560,-400);
   scaleObject('name', 0.77, 0.77);
   addLuaSprite('name', true);

   makeLuaSprite('waza1', 'movilwaza', -50, -49);
   scaleObject('waza1', 0.77, 0.77);
   setProperty('waza1.alpha', 1)
   setObjectCamera('waza1', 'other')
   addLuaSprite('waza1', true);

   setTextBorder('scoreTxt', 1.0, '000000')
   setTextSize('scoreTxt', 13);
   setProperty('scoreTxt.y',  (downscroll and 110 or 660))

   setTextBorder('botplayTxt', .9, '000000')
   setTextSize('botplayTxt', 15);

   setTextBorder('timeTxt', 2.9, '000000')
   setTextSize('timeTxt', 13)
   setProperty('timeTxt.y',  (downscroll and 650 or 29))
end

function onUpdatePost(elapsed)
   setProperty('iconP1.y', (downscroll and 18 or 555))
   setProperty('iconP2.y', (downscroll and 25 or 560))
end
