local ogdadx
function onCreatePost() ogdadx = getProperty('dad.x') end
function onStepHit() if curStep == 1 then TransTweenIg() end end

function onTimerCompleted(tag)
   if tag == 'TweenTrans' then
      doTweenX('thing3','dad',1600,35,'QuadInOut')
      --doTweenX('thing2','boyfriend',0,1,'QuadInOut')
   end
end

function onEvent(n,v1,v2)
if n =='Change Character' then
if v2 =='scrimbo-cheesys2' then
setObjectCamera('dadGroup', 'hud')
   --setObjectCamera('boyfriendGroup','hud')
   setProperty('dad.alpha',0.6)
   setProperty('dad.x', getProperty('dad.x')-1400)
   setProperty('dad.y', getProperty('dad.y')-375)
   --setProperty('boyfriend.alpha',0.6)
   --setProperty('boyfriend.x', getProperty('boyfriend.x'))
   --setProperty('boyfriend.y', getProperty('boyfriend.y'))
   runTimer('TweenTrans', 0.5)
end
end
end

function onStepHit()
if curStep == 1948 then
setObjectCamera('dadGroup', 'game')
setProperty('dad.alpha',1)
end

end