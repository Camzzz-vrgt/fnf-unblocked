function onCreatePost()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)

setTextFont('scoreTxt', 'among us.ttf')
setTextFont('botplayTxt', 'among us.ttf')
setTextFont('timeTxt', 'among us.ttf')

setObjectOrder('amongUsGuys2', getObjectOrder('WBG') + 1);
setObjectOrder('amongUsGuys3', getObjectOrder('WBG') + 2);
setObjectOrder('amongUsGuys4', getObjectOrder('WBG') + 3);
end


function onSongStart()
doTweenAlpha('nsuwhfe', 'camGame', 1, 1, 'quadInOut')
end


function onEvent(n,v1,v2)
if n == 'camera_target' then
if v1 == 'all' then
folowcam = true

else
 folowcam = false
end
end
if n == 'WBG' then
if v1 == 'Bon' or v1 == 'Won' then
setProperty('Spotlight.visible', false)
setProperty('FG.visible', false)
setProperty('Effect.visible', false)

elseif v1 == 'off' then
setProperty('Spotlight.visible', true)
setProperty('FG.visible', true)
setProperty('Effect.visible', true)
setProperty('among_us_time.visible', true)
end
end
end

folowcam = true
camX = 600
camY = 120
function onUpdate()

if folowcam then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)

end
end



function onStepHit()
if curStep == 1096 then
doTweenAlpha('owbe', 'camHUD', 0,0.5, 'expoOut')
end
end