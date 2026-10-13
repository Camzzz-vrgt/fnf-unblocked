function onCreate()
        makeLuaSprite('blackbg', nil, screenWidth * -0.5, screenHeight * -0.5)
        makeGraphic('blackbg', screenWidth * 2, screenHeight * 2, '000000')
        setObjectOrder('blackbg', getObjectOrder('boyfriendGroup') + 1)
        setObjectCamera('blackbg', 'hud')
        addLuaSprite('blackbg')

		makeLuaSprite('whitebg', nil, screenWidth * -0.5, screenHeight * -0.5)
        makeGraphic('whitebg', screenWidth * 2, screenHeight * 2, 'FFFFFF')
        setObjectOrder('whitebg', getObjectOrder('boyfriendGroup') + 1)
        setObjectCamera('whitebg', 'other')
		setProperty('whitebg.alpha', 0)
        addLuaSprite('whitebg')
end
function onSongStart()
	noteTweenAlpha("backa1", 0, 0, 1, "linear");
    noteTweenAlpha("backa2", 1, 0, 1, "linear");
    noteTweenAlpha("backa3", 2, 0, 1, "linear");
    noteTweenAlpha("backa4", 3, 0, 1, "linear");

	noteTweenAlpha("backa5", 4, 0.75, 1, "linear");
    noteTweenAlpha("backa6", 5, 0.75, 1, "linear");
    noteTweenAlpha("backa7", 6, 0.75, 1, "linear");
    noteTweenAlpha("backa8", 7, 0.75, 1, "linear");
end
function onCreatePost()
	setProperty('boyfriend.alpha', 0)
	setProperty('scoreTxt.alpha', 0)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('healthBar.alpha', 0)
	setProperty('Bar.alpha', 0)

if not middlescroll then
    noteTweenX("backx5", 4, 92, 0.0001, "expoOut");
    noteTweenX("backx6", 5, 203, 0.0001, "expoOut");
    noteTweenX("backx7", 6, 314, 0.0001, "expoOut");
    noteTweenX("backx8", 7, 425, 0.0001, "expoOut");
end
end
function onBeatHit()
	if curBeat > 0 and curBeat < 99.7 then
		triggerEvent("Add Camera Zoom",0, 0)
	
	end
if curBeat > 99.7 and curBeat < 132 or curBeat > 196.7 and curBeat < 260 then
	triggerEvent("Add Camera Zoom",0.065, 0.015)
end
if curBeat > 132 and curBeat < 193.7 then
	triggerEvent("Add Camera Zoom",0.085, 0.035)
end
end
function onStepHit()
if curStep == 1 then
	doTweenAlpha('Alpha1', 'blackbg',0, 10, linear)
end
if curStep == 111 then
	doTweenAlpha('Alpha1', 'blackbg',1, 1, linear)
end
if curStep == 128 then
	doTweenAlpha('Alpha1', 'blackbg',0, 6.25, linear)
	setProperty('Luz.alpha', 0)
	setProperty('FloorStague.alpha', 1)
	setProperty('Publico.alpha', 1)
	setProperty('boyfriend.alpha', 1)
	setProperty('dad.alpha', 0)

	if not middlescroll then
	noteTweenX("backx5", 4, 422, 1, "expoOut");
    noteTweenX("backx6", 5, 533, 1.05, "expoOut");
    noteTweenX("backx7", 6, 644, 1.1, "expoOut");
    noteTweenX("backx8", 7, 755, 1.15, "expoOut");
	end
end
if curStep == 383 then
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
setProperty('dad.alpha', 1)

removeLuaSprite('BGStague', true)
removeLuaSprite('FloorStague', true)
removeLuaSprite('Cortinas', true)
removeLuaSprite('Publico', true)
setProperty('Luz.alpha', 1)

if not middlescroll then
noteTweenX("backx1", 4, 740, 0.001, "expoOut");
noteTweenX("backx2", 5, 852, 0.001, "expoOut");
noteTweenX("backx3", 6, 963, 0.001, "expoOut");
noteTweenX("backx4", 7, 1075, 0.001, "expoOut")

noteTweenX("backx5", 0, 92, 0.001, "expoOut");
noteTweenX("backx6", 1, 203, 0.001, "expoOut");
noteTweenX("backx7", 2, 314, 0.001, "expoOut");
noteTweenX("backx8", 3, 425, 0.001, "expoOut");
end

noteTweenAlpha("backa1", 0, 0.75, 1, "linear");
noteTweenAlpha("backa2", 1, 0.75, 1, "linear");
noteTweenAlpha("backa3", 2, 0.75, 1, "linear");
noteTweenAlpha("backa4", 3, 0.75, 1, "linear");

setObjectCamera('Black', 'camHUD')
end
if curStep == 400 then
	setProperty('camGame.alpha', 1)
	setProperty('camHUD.alpha', 1)

	setProperty('scoreTxt.alpha', 1)
	setProperty('iconP1.alpha', 1)
	setProperty('iconP2.alpha', 1)
	setProperty('healthBar.alpha', 1)
	setProperty('Bar.alpha', 1)
	setProperty('pauseIndex','-alt')
end
if curStep == 528 then
doTweenColor('BC', 'Black', 'FF0000', 1, 'linear')

end
if curStep == 768 then
doTweenAlpha('Alpha1', 'blackbg',1, 1, 'linear')
end

if curStep == 1040 then
	setProperty('blackbg.alpha', 0)
images25 = {'BG','Luz','Black'}
for _,i in ipairs(images25) do
removeLuaSprite(i, true)
	end
images35 = {'BGfinal','Sucio','BV'}
for _,f in ipairs(images35) do
    setProperty(f..'.visible', true)
end
	setProperty('boyfriend.visible', false)
	triggerEvent("Camera Follow Pos",'800','580')
end
if curStep == 1295 or curStep == 1424 then
doTweenColor('BGFC', 'BGfinal', '000000', 8, 'linear')
end
if curStep == 1392 or curStep == 1519 then
doTweenColor('BGFC', 'BGfinal', 'FFFFFF', 1, 'linear')
end
if curStep == 1551 then
doTweenAlpha('WAlpha1', 'whitebg',1, 1, 'linear')
doTweenAlpha('HUDA1', 'camHUD',0, 1, 'linear')
end
end
function onTweenCompleted(tag)
	if tag == 'BC' then
		doTweenColor('BC2', 'Black', 'FFFFFF', 1, 'linear')
	end
	if tag == 'BC2' then
		doTweenColor('BC', 'Black', 'FF0000', 1, 'linear')
	end
end