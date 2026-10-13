function onCreate()
	   makeLuaSprite('FLASH', '', 0, 0);
        makeGraphic('FLASH',1280,720,'ffffff')
	      addLuaSprite('FLASH', false);
	setBlendMode('FLASH', 'SUBTRACT')
	setObjectCamera('FLASH', 'HUD')
end

function onSongStart()
doTweenAlpha('', 'FLASH', 1.0, 0.0, 'linear')
setProperty('timeTxt.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
end

function onStepHit ()
if curStep == 127 then
doTweenAlpha('', 'FLASH', 0.0, 2.5, 'linear')
end
end
