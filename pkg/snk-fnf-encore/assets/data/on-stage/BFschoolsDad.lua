function onCreate()

	makeLuaSprite('Fade','blackScreen',-750,-300)
	addLuaSprite('Fade',false)
	setLuaSpriteScrollFactor('Fade', 1.0, 1.0);
	scaleObject('Fade', 2.0, 2.0);
	setObjectCamera('Fade', 'hud')
	setProperty('Fade.alpha', 0)
	end

function onBeatHit()

if curBeat == 160 then
		doTweenAlpha('BfBoner', 'obj8', 0.5, 2, 'quartIn');
	end
if curBeat == 188 then
		doTweenAlpha('BfBoner', 'obj8', 0, 0.0001, 'quartIn');
		doTweenAlpha('Transition', 'Fade', 1, 0.0001, 'Linear');
	end
if curBeat == 192 then
		doTweenAlpha('NotOver', 'Fade', 0, 0.001, 'quartIn');
	end
end