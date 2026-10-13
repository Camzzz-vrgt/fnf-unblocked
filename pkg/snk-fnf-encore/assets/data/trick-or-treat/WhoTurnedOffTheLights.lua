function onCreate()

	makeLuaSprite('Fade','blackScreen',-750,-300)
	addLuaSprite('Fade',false)
	setLuaSpriteScrollFactor('Fade', 1.0, 1.0);
	scaleObject('Fade', 2.0, 2.0);
	setObjectCamera('Fade', 'hud')
	setProperty('Fade.alpha', 0)
	end

function onBeatHit()
if curBeat == 132 then
		doTweenAlpha('VerySpookyLightSwitch', 'Fade', 1, 0.001, 'quartIn');
	end
if curBeat == 140 then
		doTweenAlpha('Uhoh', 'Fade', 0, 0.001, 'quartIn');
	end
end