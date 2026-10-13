function onUpdate(elapsed)
end

function onCreatePost()
    makeLuaSprite('void','black', 0, 0)
	setGraphicSize('void',1280,720)
	setObjectCamera('void','camHud')
	updateHitbox('void')
	setBlendMode('void','multiply')
    addLuaSprite('void', false);
    setProperty('void.visible', true);
end

function onStepHit()
   if curStep == 2 then
      doTweenAlpha('black', 'void',0,6, 'linear');
   end
   if curStep == 942 then
      doTweenAlpha('black', 'void',1,3, 'linear');
   end
 end