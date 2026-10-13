function onCreate()
makeLuaSprite('negrooscuro', 'blackbg', 0, 0)
setProperty('negrooscuro.alpha', 1)
setObjectCamera('negrooscuro', 'Other')
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

makeLuaSprite('darkness', nil, 0,0);
makeGraphic('darkness', 1280, 800,'646464')
setObjectCamera('darkness', 'other')
setProperty('darkness.alpha', 0)
addLuaSprite('darkness', true);
setBlendMode('darkness','SUBTRACT')

makeLuaSprite('vg', 'purin/vg', -3, -1);
scaleObject('vg', 1.0, 1.0);
setObjectCamera('vg', 'other')
setProperty('vg.alpha', 0)
addLuaSprite('vg', false);

makeLuaSprite('blanco', nil, 0, 0);
makeGraphic('blanco',1280, 800,'ffffff')
addLuaSprite('blanco', true);
setObjectCamera('blanco','other')
setProperty('blanco.alpha',0)
setBlendMode('blanco', 'add')

setProperty('defaultCamZoom', 1.2)
setProperty('camGame.zoom', 1.2)  
setProperty('camHUD.alpha', 0)
setProperty('charmander.alpha', 0)
setProperty('squirtle.alpha', 0)
setProperty('snub.alpha', 0)
setProperty('cleafa.alpha', 0)
setProperty('awa2.alpha', 0)

precacheImage('purin_dead')
precacheSound('purindead')
end

function onTweenCompleted(tag)
if danger then
if tag == 'danger' then
doTweenAlpha('danger2','vg', 1, 2.5, 'quadInOut');
end
if tag == 'danger2' then
doTweenAlpha('danger','vg', 0, 2.5, 'quadInOut');
end
 end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("a", "negrooscuro", 0, 5, "linear")   
end
if curStep == 128 then
setProperty('camHUD.alpha', 1)
end
if curStep == 640 then
doTweenAlpha('HUD', 'camHUD', 0, 0.5, 'linear')
end
if curStep == 649 then
doTweenZoom('screenZoom', 'camGame', 1.2, 1.5, 'linear');
doTweenAlpha('white', 'blanco', 1, 0.4, 'linear')
end 
if curStep == 656 then
setProperty('dad.alpha', 0)
setProperty('awa.alpha', 0)
setProperty('awa2.alpha', 1)
setProperty('name.alpha', 0)   
setProperty('iconP2.alpha', 0)
setProperty('blanco.alpha', 0)
setProperty('darkness.alpha', 0.7)
setProperty('negrooscuro.alpha', 1)
end
if curStep == 670 then
danger = true
doTweenAlpha('danger2', 'vg', 1, 2.5, 'quadInOut');
end
if curStep == 688 then   
doTweenAlpha('black', 'negrooscuro', 0, 5, 'linear')
end
if curStep == 784 then   
setProperty('camHUD.alpha', 1)
end
if curStep == 816 then  
doTweenAlpha('snub', 'snub', 1, 5, 'linear') 
doTweenAlpha('squirtle', 'squirtle', 1, 5, 'linear') 
doTweenAlpha('charmander', 'charmander', 1, 5, 'linear')  
doTweenAlpha('cleafa', 'cleafa', 1, 5, 'linear')
end
if curStep == 868 then  
doTweenAlpha('name', 'name', 1, 1.5, 'linear') 
doTweenAlpha('iconwaza', 'iconP2', 1, 1.5, 'linear')  
doTweenAlpha('pudin', 'dad', 1, 1.5, 'linear')
end
if curStep == 1168 then
setProperty('camHUD.alpha', 0)
setProperty('charmander.alpha', 0)
setProperty('squirtle.alpha', 0)
setProperty('snub.alpha', 0)
setProperty('cleafa.alpha', 0)
setProperty('awa2.alpha', 0)
setProperty('darkness.alpha', 0)
setProperty('vg.visible', false)
setProperty('camGame.visible', false)
setProperty('awa.alpha', 1)
end
if curStep == 1200 then
setProperty('camHUD.alpha', 1)
setProperty('camGame.visible', true)
end
if curStep == 1456 then
doTweenAlpha("a", "darkness", 0.7, 1.5, "linear")   
setProperty('vg.visible', true)
end
if curStep == 1704 then
doTweenAlpha("a", "negrooscuro", 1, 0.5, "linear")   
end
if curStep == 1711 then
setProperty('negrooscuro.alpha', 0)
end
if curStep == 1743 then
setProperty('charmander.alpha', 1)
setProperty('squirtle.alpha', 1)
setProperty('snub.alpha', 1)
setProperty('cleafa.alpha', 1)
setProperty('awa2.alpha', 1)
setProperty('awa.alpha', 0)
end
if curStep == 2256 then
doTweenAlpha("aaawa", "camHUD", 0, 1.5, "linear")  
setProperty('vg.visible', false)
end
end

local allowEndSong = true

function onTimerCompleted(tag)
if tag == 'end' then
makeAnimatedLuaSprite("dead","purin_dead", -100, -20)
addAnimationByPrefix("dead","idle","purin dead0",24, false)
setScrollFactor("dead", 1.0, 1.0)
addLuaSprite("dead", true)

objectPlayAnimation("dead", "idle")
setProperty('defaultCamZoom', 0.7)
setProperty('camGame.zoom', 0.7)  
setProperty('dad.alpha', 0)
playSound("purindead", 1, 'dead')

doTweenAlpha("awa1", "awa2", 0, 2.0)
doTweenAlpha("awa2", "squirtle", 0, 2.0)
doTweenAlpha("awa3", "charmander", 0, 2.0)
doTweenAlpha("awa4", "snub", 0, 2.0)
doTweenAlpha("awa5", "cleafa", 0, 2.0)
doTweenAlpha("awa6", "name", 0, 2.0)
doTweenZoom("awa", "camGame", 1.2, 4.0)
end
end

function onSoundFinished(t)
if t == 'dead' then
endSong()
allowEndSong = true
end
end

function onEndSong()
if allowEndSong then
if not inCutscene then
			setProperty('inCutscene', true)
			runTimer("end",0.01)
allowEndSong = false
			return Function_Stop;
		end
end
end