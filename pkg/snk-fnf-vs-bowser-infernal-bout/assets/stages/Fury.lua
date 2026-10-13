function onCreate()
	pulsing = false
	
	makeLuaSprite('sky', 'stages/fury/Sky', -2300, -1100);
	setScrollFactor('sky', 0.5, 0.5);
	scaleObject('sky', 1.5, 1.5)

	makeLuaSprite('landscape', 'stages/fury/Landscape', -2700, -1100);
	setScrollFactor('landscape', 0.9, 0.9);
	scaleObject('landscape', 1.5, 1.5)


	makeLuaSprite('fury', 'stages/fury/fury', -2700, -1700);
	setScrollFactor('fury', 0.9, 0.9);
	scaleObject('fury', 1.5, 1.5)


	makeLuaSprite('platform', 'stages/fury/Platform', -1800, -500);

	makeLuaSprite('SingGlow', 'stages/fury/furyPulse', 0, 0);
	scaleObject("SingGlow", 0.7, 0.7)
	setBlendMode("SingGlow", "ADD")

	makeLuaSprite('lightning', 'stages/fury/lightningeffect');
	setBlendMode('lightning', 'ADD')
	setObjectCamera('lightning', 'hud')
	setProperty('lightning.alpha', 0)

	makeAnimatedLuaSprite('rain','stages/fury/rain', -1800, -800)
	addAnimationByPrefix('rain','pouring','rain rain',24, true)
	scaleObject('rain', 2, 2)
	objectPlayAnimation('rain','pouring',false)

	doTweenColor('tweenlandscape', 'landscape', '3074a4', 0.01)
	doTweenColor('tweenplatform', 'platform', '3074a4', 0.01)
	doTweenColor('tweensky', 'sky', '3074a4', 0.01)
	doTweenColor('tweenfury', 'fury', '3074a4', 0.01)
	
	
	
	addLuaSprite('sky', false);
	addLuaSprite('landscape', false);
	addLuaSprite('fury', false);
	addLuaSprite('platform', false);
	addLuaSprite('lightning', false);
	addLuaSprite('rain', true);
	

end

function onUpdate()

	if curStep == 432 then 
	addLuaSprite('SingGlow', true);
	setObjectCamera("SingGlow", "hud");
	end

end