function onCreate()
makeAnimatedLuaSprite('caine','characters/cocaine',790,300)
addAnimationByPrefix('caine','dance','cocaine idle',24,false)
setScrollFactor('caine', 1, 1);
addLuaSprite('caine',false)
scaleObject('caine', 0.7, 0.7)
end
local timeshit = 0;
function onUpdate()
 doTweenY('opponentFloatshit', 'caine', (math.sin(timeshit*5)*40), 0.001, 'linear')
 timeshit = timeshit+0.01
 end