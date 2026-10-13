local boom = false
local omg = false
local boom1 = 0.025
local boom2 = 0.035
local waza = 8
local waza2 = waza + waza

function onUpdate()
setProperty('camZoomingMult', false)
end

function onStepHit()
if boom then
    if curStep % waza == 0 then
 triggerEvent("Add Camera Zoom",boom1, boom1)
 end
    if curStep % waza2 == 0 then
 triggerEvent("Add Camera Zoom", boom2, boom2)
end
end
if omg then
   if curStep % waza == 0 then
 setProperty("camGame.angle", 2)
 doTweenAngle("omg", "camGame", 0, 0.5, "linear")
end
   if curStep % waza2 == 0 then
 setProperty("camGame.angle", -2)
 doTweenAngle("omg", "camGame", 0, 0.5, "linear")
end
end

function onBeatHit()
if curBeat == 96 or curBeat == 300 or curBeat == 436 then
boom = true		
end
if curBeat == 364 then
omg = true	
waza = 4
boom1 = 0.025
boom2 = 0.045	
end
if curBeat == 156 or curBeat == 532 then
boom = false		
end
if curBeat == 420 then
omg = false	
boom = false	
end
if curBeat == 500 then
waza = 8
end
end
end