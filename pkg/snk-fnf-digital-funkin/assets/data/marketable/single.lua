
function onCreate()
makeAnimatedLuaSprite('theguys','characters/helpog',790,300)
addAnimationByPrefix('theguys','dance','helpog idle',24,false)
setScrollFactor('theguys', 1, 1);
addLuaSprite('theguys',false)
scaleObject('theguys', 0.7, 0.7)
setProperty('theguys.alpha', 0.0001)
end

function onStepHit()
if curStep == 896 then
setProperty('theguys.alpha', 1)
end
end


function onBeatHit()
    if curBeat % 4 == 0 then
        playAnim('theguys', 'dance', true)
    end
end
function onCountdownTick(counter)
    if counter % 4 == 0 then
    playAnim('theguys', 'dance', true)
    end
end
