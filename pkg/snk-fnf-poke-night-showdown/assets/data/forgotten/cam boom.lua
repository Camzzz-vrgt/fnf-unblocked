local boom = false
local boom1 = 0.025
local boom2 = 0.045
local waza = 6
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

function onBeatHit()
if curBeat == 126 or curBeat == 222 or curBeat == 270 or curBeat == 319 or curBeat == 515 then
boom = true		
end
if curBeat == 174 or curBeat == 258 or curBeat == 317 or curBeat == 364 or curBeat == 510 or curBeat == 530 then
boom = false		
end
if curBeat == 418 then
boom = true	
boom1 = 0.055
boom2 = 0.045	
waza = 4
end
end 
end