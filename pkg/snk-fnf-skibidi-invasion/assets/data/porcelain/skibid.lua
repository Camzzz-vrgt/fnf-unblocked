function onCreate()
	setProperty('skipCountdown', true)
	makeLuaSprite('black','franc',0,0)
	screenCenter('black','y')
	screenCenter('black','x')
  	addLuaSprite('black', true);
	setObjectCamera('black','game')
	setProperty('black.alpha', 1)
	setProperty('camHUD.alpha', 0)
	setProperty('boyfriend.visible',false)
	setProperty('iconP2.visible',false)
end
function onUpdate()
	if curBeat == 1 then
		doTweenAlpha('hihud', 'camHUD', 1, 2, 'linear');
	end
	if curBeat == 16 then
		doTweenAlpha('reveal', 'black', 0, 5, 'linear');
	end
	if curBeat == 30 then
		setProperty('iconP2.visible',true)
	end
	if curBeat == 32 then
		setProperty('defaultCamZoom',1.3)
	end
end