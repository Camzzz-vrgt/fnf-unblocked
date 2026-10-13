function onCreatePost()
makeAnimatedLuaSprite("fin",'room/Banette-end', 340,0)
addAnimationByPrefix("fin", "idle", "Banette-end0", 24, true)
setObjectCamera("fin",'other')
setProperty("fin.alpha", 0)
scaleObject("fin", 0.9, 0.9)
addLuaSprite("fin",true)
end

function onStepHit()
if curStep == 1460 then
setProperty('blackui.alpha', 0.)
setProperty('negrooscuro.alpha', 0)
setProperty('darkness.alpha', 0)
makeVideoSprite('a', 'we are pokemon', 0, 0, 'HUD', false)
end
if curStep == 2300 then
setProperty("fin.alpha", 1)
setProperty('darkness.alpha', 1)
doTweenX('scale1', 'fin.scale', 0.8, 10,'smoothStepIn')
doTweenY('scale2', 'fin.scale', 0.8, 10,'smoothStepIn')
doTweenAlpha("agueho", "darkness", 0, 15,'linear')
doTweenAlpha("aA", "negrooscuro", 0, 10,'linear')
end
if curStep == 2495 then
setProperty("fin.visible", false)
playSound("roto",0.6)
end
end