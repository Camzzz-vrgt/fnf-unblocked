function onCreate()

	makeLuaSprite('Fade','blackScreen',-750,-300)
	addLuaSprite('Fade',false)
	setLuaSpriteScrollFactor('Fade', 1.0, 1.0);
	scaleObject('Fade', 2.0, 2.0);
	setObjectCamera('Fade', 'hud')
	setProperty('Fade.alpha', 0)
	end

function onBeatHit()
if curBeat == 151 then
		doTweenAlpha('Blackout', 'Fade', 1, 0.001, 'quartIn');
		runTimer('patients', 0.001);
	end
function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'patients' then
    doTweenAlpha('byebye', 'Fade', 0, 10.4, 'linear');
    	end
   end
end