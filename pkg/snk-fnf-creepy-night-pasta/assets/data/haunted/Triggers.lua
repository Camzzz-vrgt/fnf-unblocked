function onCreate()
A1 = -3
A2 = 3
	CT = 40
	qz = 30
	timeR = 8
	makeLuaSprite('blackbg', nil, screenWidth * 0.2, screenHeight * -0.5)
	makeGraphic('blackbg', screenWidth * 4, screenHeight * 4, '000000')
	addLuaSprite('blackbg', true)
end
function onSongStart()
	noteTweenAlpha("backa1", 0, 0.75, 1, "linear");
    noteTweenAlpha("backa2", 1, 0.75, 1, "linear");
    noteTweenAlpha("backa3", 2, 0.75, 1, "linear");
    noteTweenAlpha("backa4", 3, 0.75, 1, "linear");

	noteTweenAlpha("backa5", 4, 0.75, 1, "linear");
    noteTweenAlpha("backa6", 5, 0.75, 1, "linear");
    noteTweenAlpha("backa7", 6, 0.75, 1, "linear");
    noteTweenAlpha("backa8", 7, 0.75, 1, "linear");
end
function onStepHit()
if curStep == 1 then
doTweenAlpha('AlphaHUD', 'camHUD', 1, 12.25, 'linear')
end
if curStep == 96 then
doTweenAlpha('AlphaGame', 'blackbg', 0, 0.65, 'linear')
doTweenY('tag_1', 'Quelico.scale', 30, 40, 'linear');
doTweenY('tag_2', 'Quelico', 'Quelico.width +360', 40, 'linear')
end
if curStep == 288 then
	doTweenAngle('AngleHUD', 'camHUD', 'A1', 8, 'linear')
	doTweenAngle('AngleGame', 'camGame', 'A1', 8, 'linear')
	runTimer('RC', 8)
end
if curStep == 672 then
	setProperty('blackbg.alpha', 1)
	setProperty('camHUD.alpha', 0)

end
if curStep == 710 then
	doTweenAlpha('AlphaHUD', 'camHUD', 1, 1, 'linear')
end
if curStep == 720 then
	doTweenAlpha('AlphaGame', 'blackbg', 0, 0.35, 'linear')
end
if curStep == 1104 then
	cancelTimer('RC')
	cancelTimer('RC2')

doTweenAngle('AngleHUD', 'camHUD', 0, 0.0001, 'linear')
doTweenAngle('AngleGame', 'camGame', 0, 0.0001, 'linear')
end
if curStep == 1246 then
	doTweenAlpha('AlphaGame', 'blackbg', 1, 3, 'linear')
	doTweenX('HB', 'healthBar.scale', 0, 3.15, 'linear');
	doTweenAlpha('IP1', 'iconP1', 0, 3, 'linear')
	doTweenAlpha('IP2', 'iconP2', 0, 3, 'linear')
	doTweenAlpha('ST2', 'scoreTxt', 0, 2.95, 'linear')
	doTweenY('ST', 'scoreTxt.scale', 0, 2.95, 'linear');
end

if curStep == 1792 then
	doTweenAlpha('AlphaGame', 'blackbg', 1, 1, 'linear')
end
if curStep == 1808 then
	A1 = -6
	A2 = 6
	doTweenAlpha('AlphaGame', 'blackbg', 0, 1.65, 'linear')
	doTweenAngle('AngleHUD', 'camHUD', 'A1', 8, 'linear')
	doTweenAngle('AngleGame', 'camGame', 'A1', 8, 'linear')
	runTimer('RC', 8)
end
if curStep == 2320 then
doTweenAlpha('AlphaGame', 'blackbg', 1, 1, 'linear')
doTweenAlpha('AlphaGame2', 'Dark', 1, 1, 'linear')
cancelTimer('RC')
cancelTimer('RC2')
end
if curStep == 2380 then
	doTweenAlpha('AlphaHUD', 'camHUD', 0, 1, 'linear')
end
end

function onUpdatePost(elapsed)
if curStep > 1280 then
	triggerEvent("Camera Follow Pos",'1580','188')
end
end
function onEvent(name, v1, v2)
if name == 'Smile' then
	setProperty('blackbg.alpha', 0)
	triggerEvent("Change Character",'Dad', 'SmiledogAlt2')
	setProperty('boyfriend.visible', false)
	removeLuaSprite('BG', true)
	removeLuaSprite('sus', true)
	removeLuaSprite('bed', true)
	removeLuaSprite('Microfono', true)
	removeLuaSprite('Table', true)
	removeLuaSprite('Chair', true)
	setProperty('Dark.alpha', 0)

end
end
function onBeatHit()
	if curBeat > 323.7 and curBeat < 451.7 then
		triggerEvent("Add Camera Zoom",0.085, 0.035)
	end
end
function onTimerCompleted(name)
if name == 'RC' then
doTweenAngle('AngleHUD', 'camHUD', 'A2', 8, 'linear')
doTweenAngle('AngleGame', 'camGame', 'A2', 8, 'linear')
runTimer('RC2', 8)
end
if name == 'RC2' then
doTweenAngle('AngleHUD', 'camHUD', 'A1', 8, 'linear')
doTweenAngle('AngleGame', 'camGame', 'A1', 8, 'linear')
runTimer('RC', 8)
end
end
function onTweenCompleted(name)
if name == 'tag_1' then
	setProperty('health', 0)
end


end
function opponentNoteHit()
	if curBeat > 323.7 then
		cameraShake('game',0.002 ,0.25)
		cameraShake('hud',0.0015 ,0.25)
	end
end
function onUpdate()
end
