function onCreatePost()
makeLuaSprite('blackui', 'blackui', 0, 0);
setObjectCamera('blackui', 'camHUD')
scaleObject('blackui', 1.1, 1.1)
setProperty('blackui.alpha', 0)
addLuaSprite('blackui', false);

makeLuaSprite('darkness', null, 0, 0);
makeGraphic('darkness', 1370 ,940,'646464')
setObjectCamera('darkness', 'other')
setBlendMode('darkness','SUBTRACT')
setProperty('darkness.alpha', 1)
addLuaSprite('darkness', true);

makeLuaSprite('Rojooscuro', null, 0, 0);
makeGraphic('Rojooscuro', 1370 ,920,'00ffff')
setObjectCamera('Rojooscuro', 'other')
setBlendMode('Rojooscuro','SUBTRACT')
setProperty('Rojooscuro.alpha', 0)
addLuaSprite('Rojooscuro', true);

makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1370 ,920,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

setProperty("camHUD.alpha", 0)
setProperty('defaultCamZoom', 0.8)
setProperty('camGame.zoom', 0.8)
end

waza = false
function onUpdatePost()
if waza then
if mustHitSection == true then 
setProperty('defaultCamZoom', 0.8)
else
setProperty('defaultCamZoom', 1.2)
end
end
end

local fase2 = false
function onEvent(n,v1,v2)
if fase2 then
if n == 'Add Camera Zoom' then
cameraShake("HUD", 0.0015, 0.5)
end
end
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
if fase2 then
cameraShake("camGame", 0.002, 0.5)
end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("a", "negrooscuro", 0, 15,'linear')      
doTweenAlpha("b", "darkness", 0.05, 15,'linear')   
end
if curStep == 192 then
waza = true
setProperty("camHUD.alpha", 1)
end
if curStep == 288 or curStep == 696 then
doTweenAlpha("a", "blackui", 0.55, 1.5,'linear')    
doTweenAlpha("b", "negrooscuro", 0.4, 1.5,'linear')      
doTweenAlpha("c", "darkness", 0.35, 1.5,'linear')   
end
if curStep == 480 or curStep == 1270 then
setProperty("camGame.alpha", 0) 
end
if curStep == 504 or curStep == 888 or curStep == 1080 then
setProperty('blackui.alpha', 0.45)
setProperty('negrooscuro.alpha', 0.2)
setProperty('darkness.alpha', 0.15)
setProperty("camGame.alpha", 1) 
end
if curStep == 1031 then
doTweenAlpha("aA", "negrooscuro", 0, 1,'linear')      
doTweenAlpha("bA", "darkness", 0.05, 1,'linear')   
end
if curStep == 1278 then
setProperty("camGame.alpha", 1) 
end
if curStep == 1463 then
setProperty("camGame.alpha", 0) 
setProperty('blackui.alpha', 0.)
setProperty('negrooscuro.alpha', 0)
setProperty('darkness.alpha', 0)
end
if curStep == 1667 then
fase2 = true
setProperty("camGame.alpha", 1) 
setProperty('darkness.alpha', 0.2)
setProperty('blackui.alpha', 0.45)
setProperty('darling.visible', false)
setProperty('darling2.visible', true)
setProperty('Rojooscuro.alpha', 0.25)
end
if curStep == 2053 then
setProperty("camGame.alpha", 0) 
end  
if curStep == 2061 then
setProperty("camGame.alpha", 1)
end   
if curStep == 2188 then 
setProperty("camGame.alpha", 0) 
setProperty("camHUD.alpha", 0) 
setProperty('negrooscuro.alpha', 0.2)
setProperty('Rojooscuro.alpha', 0)
setProperty('darkness.alpha', 0.2)
setProperty('iconP1.visible', false)
setProperty('bed.visible', false)
setProperty('iconP2.visible', false)
setProperty('darling.visible', false)
setProperty('darling2.visible', false)
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
callOnLuas("ColorTrans", {'dad',255,255,255})
callOnLuas("ColorTrans", {'bg',-255,-255,-255})
callOnLuas("ColorTrans", {'window',-255,-255,-255})
callOnLuas("ColorTrans", {'boyfriend', 255,255,255})
end
if curStep == 2194 then
doTweenAlpha("sex", "camHUD", 1, 0.5,'linear')      
end
if curStep == 2210 then
setProperty("camGame.alpha", 1) 
end
if curStep == 2268 then
doTweenAlpha("aA", "negrooscuro", 1, 1,'linear')
doTweenAlpha("OH", "camHUD", 0, 1.3,'linear')      
doTweenAlpha("negro", "boyfriend", 0, 1.0,'linear')      
doTweenAlpha("negro1", "dad", 0, 1.0,'linear')      
end
end